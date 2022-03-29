import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:kidsquiz/features/quiz/quiz_notifier.dart';
import 'package:kidsquiz/router.dart';

import 'quiz_page.dart';

class QuizResultPage extends ConsumerWidget {
  const QuizResultPage({Key? key}) : super(key: key);

  static const routeName = 'result';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
              // TODO(mono): あとで
              // title: const Text(appName),
              ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _Name(),
                  Gap(16),
                  Expanded(child: _Image()),
                  Gap(24),
                  _NextButton(),
                  Gap(8),
                ],
              ),
            ),
          ),
        ),
        const _Confetti(),
      ],
    );
  }
}

class _Name extends ConsumerWidget {
  const _Name({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider).value!;
    return Hero(
      tag: quiz.correctChoice.entity.name,
      child: Text(
        quiz.correctChoice.entity.name,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class _Image extends ConsumerWidget {
  const _Image({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider).value!;
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: quiz.correctChoice.entity.imageUrl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ExtendedImage.network(
                quiz.correctChoice.entity.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8),
        ),
        child: Text(
          'つぎへ',
          style: theme.textTheme.headline5!.copyWith(
            color: colorScheme.onSecondary,
          ),
        ),
        onPressed: () {
          ref.read(quizProvider.notifier).next();
          ref.read(routerProvider).goNamed(QuizPage.routeName);
        },
      ),
    );
  }
}

class _Confetti extends ConsumerWidget {
  const _Confetti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ConfettiWidget(
        confettiController: ref.watch(confettiController),
        blastDirection: -pi / 2,
        emissionFrequency: 0.01,
        numberOfParticles: 50,
        maxBlastForce: 80,
        minBlastForce: 60,
        minimumSize: const Size(30, 15),
        maximumSize: const Size(45, 22.5),
        colors: const [
//              Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.yellow,
          Colors.orange,
          Colors.cyanAccent,
        ],
      ),
    );
  }
}

final confettiController = Provider.autoDispose(
  (ref) {
    final controller = ConfettiController(
      duration: const Duration(seconds: 5),
    )..play();
    ref.onDispose(controller.dispose);
    return controller;
  },
);
