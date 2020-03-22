import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:kids_quiz/model/image_compressor.dart';
import 'package:kids_quiz/model/image_cropper.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/model/uploader.dart';
import 'package:kids_quiz/util/photo_selector.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

class AddPageModel with ChangeNotifier {
  AddPageModel({
    @required this.locator,
    @required this.choiceDoc,
  }) {
    final choice = choiceDoc?.entity;
    nameController.text = choice?.name;
    _group = choice?.group;
    _imageUrl = choice?.imageUrl;
    _groups = _toCategories(observer.choices.value);
    notifyListeners();
    _sb.add(
      observer.choices.listen((choices) {
        _groups = _toCategories(choices);
        notifyListeners();
      }),
    );
  }

  final Locator locator;
  final Document<Choice> choiceDoc;
  ImageCropper get imageCropper => locator();
  ImageCompressor get imageCompressor => locator();
  ChoicesObserver get observer => locator();
  Uploader get uploader => locator();
  GlobalKey<NavigatorState> get navigatorKey => locator();
  final TextEditingController nameController = TextEditingController();
  final _sb = SubscriptionHolder();
  final BarrierController barrierController = BarrierController();

  String _imageUrl;
  String get name => nameController.text;
  String _group;
  List<String> _groups = [];

  List<String> get groups => _groups;
  String get group => _group ?? '';
  String get imageUrl => _imageUrl;

  List<String> _toCategories(List<Document<Choice>> docs) =>
      groupBy<Document<Choice>, String>(docs, (d) => d.entity.group)
          .keys
          .toList();

  Future<void> selectImage(BuildContext context) async {
    final file = await PhotoSelector(context: context).select();
    if (file == null) {
      return;
    }
    await barrierController.executeWithProgress<void>(() async {
      final cropped = await imageCropper.crop(file);
      if (cropped == null) {
        return;
      }
      final data = await imageCompressor.compress(cropped);
      _imageUrl = (await uploader.uploadImageData(
        name: name.isEmpty ? 'unknown' : name,
        data: data,
      ))
          .split('&token=')
          .first;
      notifyListeners();
    });
  }

  void updateGroup(String name) {
    if ((name ?? '').isEmpty) {
      return;
    }
    _group = name;
    notifyListeners();
  }

  Future<void> save() async {
    if (name.isEmpty || _group.isEmpty || _imageUrl == null) {
      await showOkAlertDialog(
        context: navigatorKey.currentState.descendantContext,
        title: '未記入の項目があります',
        message: '画像・名前・グループ名を指定してください。',
      );
      return;
    }
    // ignore: unawaited_futures
    choicesRef.docRef(choiceDoc?.id).set(
          Choice(
            name: name,
            group: _group,
            imageUrl: _imageUrl,
          ),
        );
    navigatorKey.currentState.pop();
  }

  @override
  void dispose() {
    _sb.dispose();
    barrierController.dispose();

    super.dispose();
  }
}
