import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidsquiz/features/quiz/size_dialog.dart';

class MenuButton extends ConsumerWidget {
  const MenuButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<Menu>(
      itemBuilder: (context) {
        return Menu.values.map((menu) {
          return PopupMenuItem(
            value: menu,
            child: Text(menu.label),
          );
        }).toList();
      },
      onSelected: (menu) {
        switch (menu) {
          case Menu.size:
            SizeDialog.show(context: context);
            break;
        }
      },
    );
  }
}

enum Menu {
  size(label: '大きさを変更'),
  ;

  const Menu({required this.label});
  final String label;
}
