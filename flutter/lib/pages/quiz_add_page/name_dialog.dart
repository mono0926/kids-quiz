import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_page_model.dart';

class NameDialog extends StatelessWidget {
  const NameDialog._({Key key}) : super(key: key);

  static Widget wrapped({
    @required AddPageModel model,
  }) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: model),
        DisposableProvider(
          builder: (context) => _Model(),
        )
      ],
      child: const NameDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_Model>(context);
    return AlertDialog(
      title: const Text('グループ名を入力'),
      content: TextField(
        autofocus: true,
        controller: model.groupController,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: const Text('追加'),
          onPressed: () {
            Provider.of<AddPageModel>(context)
                .updateGroup(model.groupController.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

class _Model with Disposable {
  final TextEditingController groupController = TextEditingController();
  @override
  void dispose() {
    groupController.dispose();
  }
}
