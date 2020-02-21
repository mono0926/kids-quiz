import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/pages/group_page/group_page.dart';
import 'package:provider/provider.dart';

import 'quiz_edit_model.dart';

class GroupTileContainer extends StatelessWidget {
  const GroupTileContainer({
    Key key,
    @required this.group,
  }) : super(key: key);

  final String group;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<QuizEditModel, GroupModel>(
      key: ValueKey(group),
      create: (context) => GroupModel(
        group: group,
      ),
      update: (context, quizEditModel, previous) {
        return previous
          ..updateDocument(
            quizEditModel.choicesByGroup[previous.group],
          );
      },
      builder: (context, child) => OpenContainer(
        transitionType: ContainerTransitionType.fade,
        openBuilder: (_context, _openContainer) {
          return GroupPage.wrapped(model: context.read());
        },
        tappable: false,
        closedShape: const RoundedRectangleBorder(),
        closedElevation: 0,
        closedBuilder: (_context, openContainer) {
          return ChangeNotifierProvider.value(
            value: context.read<GroupModel>(),
            child: GroupTile._(
              openContainer: openContainer,
            ),
          );
        },
      ),
    );
  }
}

class GroupTile extends StatelessWidget {
  const GroupTile._({
    Key key,
    @required this.openContainer,
  }) : super(key: key);

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<GroupModel>();
    final choices = model.choiceDocs;
    return ListTile(
      title: Text('${model.group} (${choices.length})'),
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
      onTap: openContainer,
    );
  }
}

class GroupModel with ChangeNotifier {
  GroupModel({
    @required this.group,
  });
  final String group;

  List<Document<Choice>> _choiceDocs;
  List<Document<Choice>> get choiceDocs => _choiceDocs;

  void updateDocument(List<Document<Choice>> docs) {
    if (listEquals(_choiceDocs, docs)) {
      return;
    }
    _choiceDocs = docs;
    notifyListeners();
  }

  void delete(Document<Choice> doc) {
    choicesRef.docRef(doc.id).ref.delete();
  }
}
