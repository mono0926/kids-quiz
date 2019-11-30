import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/pages/home_page.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

class CorrectPage extends StatelessWidget {
  const CorrectPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return DisposableProvider(
      builder: (context) => _Model(),
      child: const CorrectPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<QuizNotifier>(context);
    final model = Provider.of<_Model>(context);
    final quiz = notifier.quiz;
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: const Text('キッズクイズ'),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: quiz.correctChoice.name,
                    child: Text(
                      quiz.correctChoice.name,
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                  Hero(
                    tag: quiz.correctChoice.imageUrl,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          quiz.correctChoice.imageUrl,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'つぎへ',
                        style: Theme.of(context).textTheme.headline,
                      ),
                      onPressed: () {
                        notifier.next();
                        Navigator.of(context).pushReplacement<void, void>(
                          FadePageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ConfettiWidget(
            confettiController: model.confettiController,
            blastDirection: -pi / 2,
            emissionFrequency: 0.01,
            numberOfParticles: 50,
            maxBlastForce: 80,
            minBlastForce: 60,
            minimumSize: const Size(30, 15),
            maximumSize: const Size(45, 22.5),
            colors: [
//              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.yellow,
              Colors.orange,
              Colors.cyanAccent,
            ],
          ),
        )
      ],
    );
  }
}

class _Model with Disposable {
  _Model() {
    confettiController.play();
  }

  final confettiController = ConfettiController(
    duration: const Duration(seconds: 5),
  );

  @override
  void dispose() {
    confettiController.dispose();
  }
}
