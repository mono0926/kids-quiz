import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/model/choices_observer.dart';
import 'package:kids_quiz/model/entity/choice/choice.dart';
import 'package:kids_quiz/model/image_cropper.dart';
import 'package:kids_quiz/model/uploader.dart';
import 'package:kids_quiz/util/app_navigator.dart';
import 'package:kids_quiz/util/photo_selector.dart';
import 'package:kids_quiz/util/util.dart';
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
        observer: Provider.of(context, listen: false),
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
//          ListTile(
//            title: TextField(
//              controller: model.groupNameController,
//              decoration: const InputDecoration(labelText: 'グループ名'),
//            ),
//          ),
          const _CategoryButton(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_Model>(context);
    return ListTile(
      title: Text(
        'グループ名',
        style: TextStyle(color: Theme.of(context).textTheme.display4.color),
      ),
      trailing: PopupMenuButton<String>(
//        icon: Icon(Icons.more_horiz),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 24),
              Text(
                model.group,
                textAlign: TextAlign.right,
              ),
              const SizedBox(width: 24),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        itemBuilder: (context) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem(
              child: Column(
                children: <Widget>[
                  ListTile(
                    dense: true,
                    title: const Text('グループを追加'),
                    leading: Icon(Icons.edit),
                  ),
                  const Divider(),
                ],
              ),
              value: '',
            ),
            ...model.groups.map((c) => PopupMenuItem(
                  child: ListTile(
                    dense: true,
                    title: Text(c),
                  ),
                  value: c,
                )),
          ];
        },
        onSelected: (value) async {
          if (value == '') {
            final group = await showDialog<String>(
                context: context,
                builder: (context) {
                  return _Dialog.wrapped();
                });

            model.updateGroup(group);
            return;
          }
          logger.info(value);
          model.updateGroup(value);
        },
      ),
    );
  }
}

class _Model with ChangeNotifier, ProgressMixin {
  _Model({
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
//  final TextEditingController groupNameController = TextEditingController();
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

class _Dialog extends StatelessWidget {
  const _Dialog._({Key key}) : super(key: key);

  static Widget wrapped() {
    return DisposableProvider(
      builder: (context) => _DialogModel(),
      child: const _Dialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_DialogModel>(context);
    return AlertDialog(
      title: const Text('グループ名を入力'),
      content: TextField(
        autofocus: true,
        controller: model.groupController,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: const Text('追加'),
          onPressed: () =>
              Navigator.of(context).pop(model.groupController.text),
        )
      ],
    );
  }
}

class _DialogModel with Disposable {
  final TextEditingController groupController = TextEditingController();
  @override
  void dispose() {
    groupController.dispose();
  }
}
