import 'package:flutter/material.dart';
import 'package:kids_quiz/model/entity/choice/choice.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/pages/quiz_add_page/quiz_add_page.dart';

class AddChoiceFab extends StatelessWidget {
  const AddChoiceFab({
    Key key,
    @required this.group,
  }) : super(key: key);

  final String group;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('追加'),
      icon: Icon(Icons.add),
      onPressed: () => Navigator.of(context).pushNamed(
        QuizAddPage.routeName,
        arguments: Document<Choice>(
          null,
          Choice(
            name: null,
            imageUrl: null,
            group: group,
          ),
        ),
      ),
    );
  }
}
