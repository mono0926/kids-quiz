import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidsquiz/features/quiz/quiz_answer_notifier.dart';
import 'package:kidsquiz/features/quiz/quiz_notifier.dart';
import 'package:kidsquiz/model/model.dart';
import 'package:kidsquiz/util/util.dart';
import 'package:kidsquiz/widgets/widgets.dart';

import 'quiz_speech_service.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({Key? key}) : super(key: key);

  static const routeName = 'quiz';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider).value;
    return quiz == null
        ? centeredCircularProgressIndicator
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                routeName,
              ),
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
                  const Gap(16),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: quiz.choices
                        .map(
                          (choice) => _ChoiceCard(
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

class _QuestionButton extends ConsumerWidget {
  const _QuestionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider).value;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return quiz == null
        ? centeredCircularProgressIndicator
        : FractionallySizedBox(
            widthFactor: 0.9,
            child: ElevatedButton(
              onPressed: () => ref.read(quizSpeechServiceProvider).speech(),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: quiz.correctChoice.entity.name,
                      style: textTheme.headline5!.copyWith(
                        color: colorScheme.onSecondary,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      // TODO(mono): l10n
                      text: 'はどれかな？',
                      style: textTheme.headline6!.copyWith(
                        color: colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

class _ChoiceCard extends HookConsumerWidget {
  const _ChoiceCard({
    Key? key,
    required this.choice,
  }) : super(key: key);

  final Document<Choice> choice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider).value!;
    final showLabel = ref.watch(
      quizAnswerProvider.select((s) => s.incorrectChoices.contains(choice)),
    );
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final animation = useMemoized(
      () {
        return animationController
            .drive(CurveTween(curve: Curves.elasticIn))
            .drive(
              Tween(
                begin: const Offset(0, 0),
                end: const Offset(0.2, 0),
              ),
            );
      },
      [animationController],
    );
    useEffect(
      () {
        if (showLabel) {
          Future(() async {
            await animationController.forward(from: 0);
            // TODO(mono): Staggered animationにしたい
            await animationController.reverse();
          });
        }
        return null;
      },
      [showLabel],
    );
    final card = Card(
      clipBehavior: Clip.hardEdge,
      child: Ink.image(
        image: ExtendedNetworkImageProvider(choice.entity.imageUrl),
        fit: BoxFit.cover,
        child: InkWell(
          onTap: () {
            ref.read(quizAnswerProvider.notifier).select(choice);
          },
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: showLabel ? 1 : 0,
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
                  choice.entity.name,
                  style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
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

    if (choice == quiz.correctChoice) {
      return Hero(
        tag: choice.entity.imageUrl,
        child: card,
      );
    }
    return SlideTransition(
      position: animation,
      child: card,
    );
  }
}
