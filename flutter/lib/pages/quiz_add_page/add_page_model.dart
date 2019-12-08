import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:kids_quiz/model/image_compressor.dart';
import 'package:kids_quiz/model/image_cropper.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/model/uploader.dart';
import 'package:kids_quiz/util/app_navigator.dart';
import 'package:kids_quiz/util/photo_selector.dart';
import 'package:mono_kit/mono_kit.dart';

class AddPageModel with ChangeNotifier, ProgressMixin {
  AddPageModel({
    @required this.choiceDoc,
    @required this.imageCropper,
    @required this.imageCompressor,
    @required this.uploader,
    @required this.navigator,
    @required this.observer,
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

  final ChoiceDoc choiceDoc;
  final ImageCropper imageCropper;
  final ImageCompressor imageCompressor;
  final Uploader uploader;
  final AppNavigator navigator;
  final TextEditingController nameController = TextEditingController();
  final ChoicesObserver observer;
  final _sb = SubscriptionHolder();

  String _imageUrl;
  String get name => nameController.text;
  String _group;
  List<String> _groups = [];

  List<String> get groups => _groups;
  String get group => _group ?? '';
  String get imageUrl => _imageUrl;

  List<String> _toCategories(List<ChoiceDoc> docs) =>
      groupBy<ChoiceDoc, String>(docs, (d) => d.entity.group).keys.toList();

  Future<void> selectImage(BuildContext context) async {
    final file = await PhotoSelector(context: context).select();
    if (file == null) {
      return;
    }
    final cropped = await imageCropper.crop(file);
    if (cropped == null) {
      return;
    }
    final data = await imageCompressor.compress(cropped);
    await executeWithProgress<void>(() async {
      _imageUrl = (await uploader.uploadImageData(
        name: name.isEmpty ? 'unknown' : name,
        data: data,
      ))
          .split('&token=')
          .first;
    });

    notifyListeners();
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
      await navigator.showOkDialog(
        title: '未記入の項目があります',
        message: '画像・名前・グループ名を指定してください。',
      );
      return;
    }
    // ignore: unawaited_futures
    ChoicesRef.ref().docRef(choiceDoc?.id).set(
          Choice(
            name: name,
            group: _group,
            imageUrl: _imageUrl,
          ),
        );
    navigator.navigator.pop();
  }

  @override
  void dispose() {
    _sb.dispose();

    super.dispose();
  }
}
