import 'package:flutter/material.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/pages/quiz_edit_page/choice_tile.dart';
import 'package:provider/provider.dart';

import 'quiz_edit_model.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key key,
    @required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizEditModel>(context);
    final choicesByCategory = model.choicesByCategory;
    final choices = choicesByCategory[category];
    return ExpansionTile(
      title: Text('$category (${choices.length})'),
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
      children: [
        ListTile(
          title: Text('すべての画像がクイズ対象'),
          dense: true,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Switch(
                value: true,
                onChanged: (value) {},
              ),
              IconButton(
                color: Theme.of(context).accentColor,
                icon: Icon(Icons.edit),
                onPressed: () {},
              )
            ],
          ),
        ),
        Divider(),
        ...choices.map((doc) => ChoiceTile(doc: doc)).toList(),
        const SizedBox(height: 8),
      ],
    );
  }
}
