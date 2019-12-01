import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/model/entity/choice/choice.dart';
import 'package:kids_quiz/model/image_cropper.dart';
import 'package:kids_quiz/model/uploader.dart';
import 'package:kids_quiz/util/app_navigator.dart';
import 'package:kids_quiz/util/photo_selector.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

class QuizAddPage extends StatelessWidget {
  const QuizAddPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return ChangeNotifierProvider(
      create: (context) => _Model(
        imageCropper: Provider.of(context, listen: false),
        uploader: Provider.of(context, listen: false),
        navigator: Provider.of(context, listen: false),
      ),
      child: const QuizAddPage._(),
    );
  }

  static const routeName = '/add';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_Model>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('クイズ画像を追加'),
        actions: <Widget>[
          FlatButton(
            colorBrightness: Brightness.dark,
            textTheme: ButtonTextTheme.normal,
            child: const Text('保存'),
            onPressed: model.save,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Barrier(
                showProgress: model.inProgress,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: model.imageUrl == null
                      ? RaisedButton(
                          color: Colors.grey[300],
                          child: const Text('写真を追加'),
                          onPressed: () => model.selectImage(context),
                        )
                      : CachedNetworkImage(imageUrl: model.imageUrl),
                ),
              ),
            ),
          ),
          ListTile(
            title: TextField(
              controller: model.nameController,
              decoration: const InputDecoration(labelText: '名前'),
            ),
          ),
          ListTile(
            title: TextField(
              controller: model.groupNameController,
              decoration: const InputDecoration(labelText: 'グループ名'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _Model with ChangeNotifier, ProgressMixin {
  _Model({
    @required this.imageCropper,
    @required this.uploader,
    @required this.navigator,
  });
  final ImageCropper imageCropper;
  final Uploader uploader;
  final AppNavigator navigator;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController groupNameController = TextEditingController();

  String imageUrl;
  String get name => nameController.text;
  String get group => groupNameController.text;

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

  Future<void> save() async {
    if (name.isEmpty || group.isEmpty || imageUrl == null) {
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
            group: group,
            imageUrl: imageUrl,
          ),
        );
    navigator.navigator.pop();
  }
}
