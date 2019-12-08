import 'package:flutter/material.dart';
import 'package:kids_quiz/pages/quiz_add_page/quiz_add_page.dart';

class AddChoiceFab extends StatelessWidget {
  const AddChoiceFab({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('追加'),
      icon: Icon(Icons.add),
      onPressed: () => Navigator.of(context).pushNamed(QuizAddPage.routeName),
    );
  }
}
