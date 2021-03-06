import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/model/entity/choice/choice.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

import 'add_page_model.dart';
import 'category_button.dart';

class QuizAddPage extends StatelessWidget {
  const QuizAddPage._({Key key}) : super(key: key);

  static Widget wrapped({
    @required Document<Choice> choiceDoc,
  }) {
    return ChangeNotifierProvider(
      create: (context) => AddPageModel(
        locator: context.read,
        choiceDoc: choiceDoc,
      ),
      child: const QuizAddPage._(),
    );
  }

  static const routeName = '/add';

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AddPageModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(model.choiceDoc?.id == null ? 'クイズを追加' : 'クイズを編集'),
        actions: <Widget>[
          FlatButton(
            colorBrightness: Brightness.dark,
            textTheme: ButtonTextTheme.normal,
            child: const Text('保存'),
            onPressed: model.save,
          )
        ],
      ),
      body: UnfocusOnTap(
        child: ListView(
          children: <Widget>[
            _buildNameField(model),
            const SizedBox(height: 8),
            const CategoryButton(),
            const SizedBox(height: 16),
            _buildImage(model, context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField(AddPageModel model) {
    return ListTile(
      title: TextField(
        autofocus: true,
        controller: model.nameController,
        decoration: const InputDecoration(labelText: '名前'),
      ),
    );
  }

  Widget _buildImage(AddPageModel model, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Barrier(
        showProgress: model.barrierController.inProgress,
        child: AspectRatio(
          aspectRatio: 1,
          child: model.imageUrl == null
              ? RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.grey[300],
                  child: Text(
                    '写真を追加',
                    style: Theme.of(context).accentTextTheme.headline6.copyWith(
                          color: Theme.of(context).colorScheme.primaryVariant,
                        ),
                  ),
                  onPressed: () => model.selectImage(context),
                )
              : Card(
                  color: Theme.of(context).buttonColor,
                  margin: EdgeInsets.zero,
                  child: Ink.image(
                    image: CachedNetworkImageProvider(model.imageUrl),
                    child: InkWell(
                      onTap: () => model.selectImage(context),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
