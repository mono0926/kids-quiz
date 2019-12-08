import 'package:flutter/material.dart';
import 'package:kids_quiz/widgets/text_input_dialog.dart';
import 'package:provider/provider.dart';

import 'add_page_model.dart';

class NameDialog extends StatelessWidget {
  const NameDialog._({Key key}) : super(key: key);

  static Widget wrapped({
    @required AddPageModel model,
  }) {
    return ChangeNotifierProvider.value(
      value: model,
      child: const NameDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextInputDialog(
      okLabel: '追加',
      titleLabel: 'グループ名を入力',
      onOkPressed: (text) {
        Provider.of<AddPageModel>(context).updateGroup(text);
      },
    );
  }
}
