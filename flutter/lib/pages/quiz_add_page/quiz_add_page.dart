import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

import 'add_page_model.dart';
import 'category_button.dart';

class QuizAddPage extends StatelessWidget {
  const QuizAddPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return ChangeNotifierProvider(
      create: (context) => AddPageModel(
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
    final model = Provider.of<AddPageModel>(context);

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
          _buildImage(model, context),
          _buildNameField(model),
          const CategoryButton(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildNameField(AddPageModel model) {
    return ListTile(
      title: TextField(
        controller: model.nameController,
        decoration: const InputDecoration(labelText: '名前'),
      ),
    );
  }

  Widget _buildImage(AddPageModel model, BuildContext context) {
    return Padding(
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
                    child: Text(
                      '写真を追加',
                      style: Theme.of(context)
                          .accentTextTheme
                          .headline
                          .copyWith(
                            color: Theme.of(context).colorScheme.primaryVariant,
                          ),
                    ),
                    onPressed: () => model.selectImage(context),
                  )
                : CachedNetworkImage(imageUrl: model.imageUrl),
          ),
        ),
      ),
    );
  }
}
