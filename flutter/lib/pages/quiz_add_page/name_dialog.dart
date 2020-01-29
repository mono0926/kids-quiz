import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class NameDialog extends StatelessWidget {
  const NameDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextInputDialog(
      okButtonLabel: '追加',
      titleLabel: 'グループ名を入力',
    );
  }
}
