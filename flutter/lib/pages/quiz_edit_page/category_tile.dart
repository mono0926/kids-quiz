import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/pages/category_page/category_page.dart';
import 'package:provider/provider.dart';

import 'quiz_edit_model.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile._({Key key}) : super(key: key);

  static Widget wrapped({
    @required String category,
  }) {
    return ChangeNotifierProxyProvider<QuizEditModel, CategoryModel>(
      key: ValueKey(category),
      create: (context) => CategoryModel(
        category: category,
      ),
      update: (context, quizEditModel, previous) {
        return previous
          ..updateChoiceDocs(
            quizEditModel.choicesByCategory[previous.category],
          );
      },
      child: const CategoryTile._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CategoryModel>(context);
    final choices = model.choiceDocs;
    return ListTile(
      title: Text('${model.category} (${choices.length})'),
//      title: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Text('$category (${choices.length})'),
//          Switch(
//            value: true,
//            onChanged: (_) {},
//          ),
//        ],
//      ),
      subtitle: choices.length < Choice.minNumber
          ? Row(
              children: <Widget>[
                Icon(
                  Icons.warning,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'クイズに出現させるには4つ以上の登録が必要です',
                    style: Theme.of(context).textTheme.body2.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                  ),
                ),
              ],
            )
          : null,
      trailing: Icon(Icons.chevron_right),
      onTap: () => Navigator.of(context).pushNamed(
        CategoryPage.routeName,
        arguments: model,
      ),
    );
  }
}

class CategoryModel with ChangeNotifier {
  CategoryModel({
    @required this.category,
  });
  final String category;

  List<ChoiceDoc> _choiceDocs;
  List<ChoiceDoc> get choiceDocs => _choiceDocs;

  void updateChoiceDocs(List<ChoiceDoc> docs) {
    if (listEquals(_choiceDocs, docs)) {
      return;
    }
    _choiceDocs = docs;
    notifyListeners();
  }

  void delete(ChoiceDoc doc) {
    ChoicesRef.ref().docRef(doc.id).ref.delete();
  }
}
