import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/pages/group_page/group_page.dart';
import 'package:provider/provider.dart';

import 'quiz_edit_model.dart';

class GroupTile extends StatelessWidget {
  const GroupTile._({Key key}) : super(key: key);

  static Widget wrapped({
    @required String group,
  }) {
    return ChangeNotifierProxyProvider<QuizEditModel, GroupModel>(
      key: ValueKey(group),
      create: (context) => GroupModel(
        group: group,
      ),
      update: (context, quizEditModel, previous) {
        return previous
          ..updateChoiceDocs(
            quizEditModel.choicesByGroup[previous.group],
          );
      },
      child: const GroupTile._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<GroupModel>();
    final choices = model.choiceDocs;
    return ListTile(
      title: Text('${model.group} (${choices.length})'),
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
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                  ),
                ),
              ],
            )
          : null,
      trailing: Icon(Icons.chevron_right),
      onTap: () => Navigator.of(context).pushNamed(
        GroupPage.routeName,
        arguments: model,
      ),
    );
  }
}

class GroupModel with ChangeNotifier {
  GroupModel({
    @required this.group,
  });
  final String group;

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
