import 'package:flutter/material.dart';
import 'package:kids_quiz/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../quiz_edit_page/category_tile.dart';
import 'choice_tile.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage._({Key key}) : super(key: key);

  static const routeName = '/category';

  static Widget wrapped({
    @required CategoryModel model,
  }) {
    return ChangeNotifierProvider.value(
      value: model,
      child: const CategoryPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CategoryModel>(context);
    final docs = model.choiceDocs;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.category),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'すべての画像がクイズ対象',
//                style: Theme.of(context).primaryTextTheme.subtitle,
              ),
              dense: true,
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: const AddChoiceFab(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: docs.length,
        itemBuilder: (context, index) {
          final doc = docs[index];

          return ChoiceTile(
            key: ValueKey(doc.id),
            doc: doc,
          );
        },
      ),
    );
  }
}
