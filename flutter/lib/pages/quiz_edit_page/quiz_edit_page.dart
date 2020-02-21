import 'package:flutter/material.dart';
import 'package:kids_quiz/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'group_tile.dart';
import 'quiz_edit_model.dart';

class QuizEditPage extends StatelessWidget {
  const QuizEditPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return ChangeNotifierProvider(
      create: (context) => QuizEditModel(locator: context.read),
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
      floatingActionButton: const AddChoiceFab(group: null),
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
    final model = context.watch<QuizEditModel>();
    final choicesByCategory = model.choicesByGroup;
    final categories = choicesByCategory.keys.toList();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 96),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return GroupTileContainer(
          group: category,
        );
      },
    );
  }
}
