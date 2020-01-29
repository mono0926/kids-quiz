import 'package:cached_network_image/cached_network_image.dart';
import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/consts.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/pages/quiz_edit_page/quiz_edit_page.dart';
import 'package:kids_quiz/util/app_feedback.dart';
import 'package:kids_quiz/util/util.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatelessWidget {
  const QuizPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return DisposableProvider(
      create: (context) => _Model(),
      child: const QuizPage._(),
    );
  }

  static const routeName = '/quiz';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_Model>(context);
    final notifier = Provider.of<QuizNotifier>(context);
    final quiz = notifier.quiz;
    return Scaffold(
      key: model.feedback.key,
      appBar: AppBar(
        title: const Text(appName),
        actions: const [
          MenuButton(),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: quiz.correctChoice.entity.name,
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
              text: model.quiz.correctChoice.entity.name,
              style: Theme.of(context).accentTextTheme.headline5,
            ),
            const TextSpan(text: ' '),
            TextSpan(
              text: model.questionSuffix,
              style: Theme.of(context).accentTextTheme.headline6,
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

  final ChoiceDoc choice;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizNotifier>(context, listen: false);
    final card = Card(
      child: Ink.image(
        image: CachedNetworkImageProvider(choice.entity.imageUrl),
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
                  '${choice.entity.name}',
                  style: Theme.of(context).primaryTextTheme.subtitle1.copyWith(
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
        tag: choice.entity.imageUrl,
        child: card,
      );
    }
    return SlideTransition(
      position: model.incorrectAnimation(choice).animation,
      child: card,
    );
  }
}

class _Model with Disposable {
  final AppFeedback feedback = AppFeedback(GlobalKey());

  @override
  void dispose() {}

  void notifyLongPressNeeded() {
    feedback.show('メニューを表示するには、長押ししてください(お子さまの誤操作の防止のためです)。');
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_Action>(
      icon: Icon(Icons.more_horiz),
      itemBuilder: (context) {
        return <PopupMenuEntry<_Action>>[
          PopupMenuItem(
            child: ListTileTheme(
              style: ListTileStyle.drawer,
              child: ListTile(
                title: const Text('クイズを編集'),
                leading: Icon(Icons.edit),
              ),
            ),
            value: _Action.editQuiz,
          ),
        ];
      },
      onSelected: (value) async {
        logger.info(value);
        Provider.of<AppNavigator>(context).popToRoot();
        switch (value) {
          case _Action.editQuiz:
            await Navigator.of(context).pushNamed(QuizEditPage.routeName);
            break;
        }
      },
    );
  }
}

enum _Action {
  editQuiz,
}
