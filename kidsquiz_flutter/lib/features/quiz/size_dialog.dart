import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidsquiz/features/quiz/menu_button.dart';
import 'package:kidsquiz/util/util.dart';

class SizeDialog extends ConsumerWidget {
  const SizeDialog({super.key});

  static void show({required BuildContext context}) {
    showModal<void>(
      context: context,
      builder: (context) => const SizeDialog(),
      configuration: const FadeScaleTransitionConfiguration(
        barrierColor: Colors.black26,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      title: Text(Menu.size.label),
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: 320,
          child: Slider(
            value: ref.watch(sizeProvider),
            onChanged: (size) {
              logger.info(size);
              ref.read(sizeProvider.notifier).update((_) => size);
            },
            divisions: 9,
            min: 0.1,
          ),
        ),
      ],
    );
  }
}

final sizeProvider = StateProvider<double>((ref) => 1);
