import 'package:flutter/material.dart';
import 'package:kids_quiz/model/entity/quiz.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizNotifier>(context);
    final quiz = model.quiz;
    return Scaffold(
      appBar: AppBar(
        title: const Text('キッズクイズ'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: quiz.correctChoice.name,
              child: RaisedButton(
                textTheme: ButtonTextTheme.accent,
                onPressed: model.playQuestion,
                child: Text(
                  model.question,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
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
        image: Image.network(choice.imageUrl).image,
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
