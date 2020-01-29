import 'package:flutter/material.dart';
import 'package:kids_quiz/util/util.dart';
import 'package:provider/provider.dart';

import 'add_page_model.dart';
import 'name_dialog.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AddPageModel>();
    return ListTile(
      title: Row(
        children: <Widget>[
          Text(
            'グループ名',
            style: TextStyle(
              color: Theme.of(context).textTheme.headline1.color,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: PopupMenuButton<String>(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
//                  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        model.group,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(width: 8),
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
                onSelected: (value) async {
                  if (value == '') {
                    final text = await showDialog<String>(
                      context: context,
                      builder: (context) => const NameDialog(),
                    );
                    model.updateGroup(text);
                  } else {
                    logger.info(value);
                    model.updateGroup(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
