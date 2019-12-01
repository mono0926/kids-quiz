import 'package:flutter/material.dart';
import 'package:kids_quiz/util/util.dart';
import 'package:provider/provider.dart';

import 'add_page_model.dart';
import 'name_dialog.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddPageModel>(context);
    return ListTile(
      title: Text(
        'グループ名',
        style: TextStyle(color: Theme.of(context).textTheme.display4.color),
      ),
      trailing: PopupMenuButton<String>(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 24),
              Text(
                model.group,
                textAlign: TextAlign.right,
              ),
              const SizedBox(width: 24),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        itemBuilder: (context) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem(
              child: Column(
                children: <Widget>[
                  ListTile(
                    dense: true,
                    title: const Text('グループを追加'),
                    leading: Icon(Icons.edit),
                  ),
                  const Divider(),
                ],
              ),
              value: '',
            ),
            ...model.groups.map((c) => PopupMenuItem(
                  child: ListTile(
                    dense: true,
                    title: Text(c),
                  ),
                  value: c,
                )),
          ];
        },
        onSelected: (value) {
          if (value == '') {
            showDialog<String>(
              context: context,
              builder: (context) => NameDialog.wrapped(
                model: model,
              ),
            );
          } else {
            logger.info(value);
            model.updateGroup(value);
          }
        },
      ),
    );
  }
}
