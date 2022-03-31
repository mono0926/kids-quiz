import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:kidsquiz/features/quiz/quiz_answer_notifier.dart';
import 'package:kidsquiz/features/quiz/quiz_notifier.dart';
import 'package:kidsquiz/main.dart';
import 'package:mono_kit/mono_kit.dart';

class QuizResultPage extends ConsumerWidget {
  const QuizResultPage._({Key? key}) : super(key: key);

  static const routeName = 'result';

  static void push(BuildContext context) {
    Navigator.of(context).push<void>(
      FadePageRoute(
        builder: (context) => const QuizResultPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(appName),
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Spacer(),
                    _Name(),
                    Gap(8),
                    Expanded(
                      flex: 20,
                      child: _Image(),
                    ),
                    Spacer(),
                    Center(child: _NextButton()),
                    Gap(16),
                  ],
                ),
              ),
            ),
          ),
          const _Confetti(),
        ],
      ),
    );
  }
}

class _Name extends ConsumerWidget {
  const _Name({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final choice = ref.watch(
      quizAnswerProvider.select((s) => s.correctChoice!),
    );
    return Hero(
      tag: choice.entity.name,
      child: Text(
        choice.entity.name,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _Image extends ConsumerWidget {
  const _Image({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final choice = ref.watch(
      quizAnswerProvider.select((s) => s.correctChoice!),
    );
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: choice.entity.imageUrl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ExtendedImage.network(
                choice.entity.imageUrl,
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 32,
        ),
      ),
      child: Text(
        'つぎへ',
        style: theme.textTheme.headline5!.copyWith(
          color: colorScheme.onSecondary,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        ref.read(quizProvider.notifier).next();
      },
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
