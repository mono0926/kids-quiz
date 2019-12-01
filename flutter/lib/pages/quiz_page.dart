import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/consts.dart';
import 'package:kids_quiz/model/entity/quiz.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key key}) : super(key: key);

  static const routeName = '/quiz';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizNotifier>(context);
    final quiz = model.quiz;
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: quiz.correctChoice.name,
              child: const _QuestionButton(),
            ),
            const SizedBox(height: 16),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: quiz.choices
                  .map(
                    (choice) => ChoiceCard(
                      choice: choice,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuestionButton extends StatelessWidget {
  const _QuestionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizNotifier>(context);
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: RaisedButton(
        onPressed: model.playQuestion,
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: model.quiz.correctChoice.name,
              style: Theme.of(context).accentTextTheme.headline,
            ),
            const TextSpan(text: ' '),
            TextSpan(
              text: model.questionSuffix,
              style: Theme.of(context).accentTextTheme.title,
            ),
          ]),
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    Key key,
    @required this.choice,
  }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizNotifier>(context, listen: false);
    final card = Card(
      child: Ink.image(
        image: CachedNetworkImageProvider(choice.imageUrl),
        fit: BoxFit.cover,
        child: InkWell(
          onTap: () {
            model.select(choice);
          },
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: model.incorrectChoices.contains(choice) ? 1 : 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                width: double.infinity,
                color: Theme.of(context).primaryColor.withOpacity(0.85),
                child: Text(
                  '${choice.name}',
                  style: Theme.of(context).primaryTextTheme.subhead.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (choice == model.quiz.correctChoice) {
      return Hero(
        tag: choice.imageUrl,
        child: card,
      );
    }
    return SlideTransition(
      position: model.incorrectAnimation(choice).animation,
      child: card,
    );
  }
}
