import 'package:flutter/material.dart';
import 'package:kids_quiz/pages/quiz_add_page/quiz_add_page.dart';
import 'package:provider/provider.dart';

import 'category_tile.dart';
import 'quiz_edit_model.dart';

class QuizEditPage extends StatelessWidget {
  const QuizEditPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return ChangeNotifierProvider(
      create: (context) => QuizEditModel(
        observer: Provider.of(context, listen: false),
      ),
      child: const QuizEditPage._(),
    );
  }

  static const routeName = '/edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('クイズを編集'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('追加'),
        icon: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(QuizAddPage.routeName),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizEditModel>(context);
    final choicesByCategory = model.choicesByCategory;
    final categories = choicesByCategory.keys.toList();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 96),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryTile(category: category);
      },
    );
  }
}
