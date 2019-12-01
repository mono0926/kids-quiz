import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:kids_quiz/model/image_cropper.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/model/uploader.dart';
import 'package:kids_quiz/util/app_navigator.dart';
import 'package:kids_quiz/util/photo_selector.dart';
import 'package:mono_kit/mono_kit.dart';

class AddPageModel with ChangeNotifier, ProgressMixin {
  AddPageModel({
    @required this.imageCropper,
    @required this.uploader,
    @required this.navigator,
    @required this.observer,
  }) {
    _groups = _toCategories(observer.choices.value);
    _sb.add(
      observer.choices.listen((choices) {
        _groups = _toCategories(choices);
        notifyListeners();
      }),
    );
  }
  final ImageCropper imageCropper;
  final Uploader uploader;
  final AppNavigator navigator;
  final TextEditingController nameController = TextEditingController();
  final ChoicesObserver observer;
  final _sb = SubscriptionHolder();

  String imageUrl;
  String get name => nameController.text;
  String _group = '';
  List<String> _groups = [];

  List<String> get groups => _groups;
  String get group => _group;

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
    await executeWithProgress<void>(() async {
      imageUrl = (await uploader.uploadImageFile(
        name: name.isEmpty ? 'unknown' : name,
        file: cropped,
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
    if (name.isEmpty || _group.isEmpty || imageUrl == null) {
      await navigator.showOkDialog(
        title: '未記入の項目があります',
        message: '画像・名前・グループ名を指定してください。',
      );
      return;
    }
    // ignore: unawaited_futures
    ChoicesRef.ref().docRef().set(
          Choice(
            name: name,
            group: _group,
            imageUrl: imageUrl,
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
