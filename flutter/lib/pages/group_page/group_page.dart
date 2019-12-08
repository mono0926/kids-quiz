import 'package:flutter/material.dart';
import 'package:kids_quiz/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../quiz_edit_page/group_tile.dart';
import 'choice_tile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage._({Key key}) : super(key: key);

  static const routeName = '/group';

  static Widget wrapped({
    @required GroupModel model,
  }) {
    return ChangeNotifierProvider.value(
      value: model,
      child: const GroupPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GroupModel>(context);
    final docs = model.choiceDocs;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.group),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.white,
            child: ListTile(
              title: const Text(
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
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) => TextInputDialog(
                  titleLabel: 'グループ名を編集',
                  onOkPressed: (text) {
                    // TODO(mono): カテゴリー名を更新
                  },
                  okLabel: '更新',
                  initialText: model.group,
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: AddChoiceFab(
        group: model.group,
      ),
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
