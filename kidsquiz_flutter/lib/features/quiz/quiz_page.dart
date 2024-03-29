import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidsquiz/consts.dart';
import 'package:kidsquiz/features/quiz/generated_quiz.dart';
import 'package:kidsquiz/features/quiz/menu_button.dart';
import 'package:kidsquiz/features/quiz/quiz_answer_notifier.dart';
import 'package:kidsquiz/features/quiz/size_dialog.dart';
import 'package:kidsquiz/model/model.dart';
import 'package:kidsquiz/util/util.dart';
import 'package:kidsquiz/widgets/widgets.dart';
import 'package:mono_kit/mono_kit.dart';

import 'quiz_speech_service.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  static const routeName = 'quiz';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(generatedQuizProvider).value;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return quiz == null
        ? centeredCircularProgressIndicator
        : Scaffold(
            appBar: AppBar(
              title: const Text(appName),
              actions: const [MenuButton()],
            ),
            body: Column(
              children: [
                AnimatedExpansionVisibility(
                  isVisible: ref.watch(ttsBannerVisibilityProvider),
                  child: MaterialBanner(
                    backgroundColor: colorScheme.error.withOpacity(0.2),
                    content: const Text(
                      '⚠️ デスクトップ版Chrome以外の環境では、音声読み上げが機能しない可能性があります。',
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => ref
                            .read(ttsBannerVisibilityProvider.notifier)
                            .dismiss(),
                        child: const Text('閉じる'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Gap(16),
                        Hero(
                          tag: quiz.correctChoice.entity.name,
                          child: const _QuestionButton(),
                        ),
                        Expanded(
                          child: Center(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: FractionallySizedBox(
                                widthFactor: ref.watch(sizeProvider),
                                heightFactor: ref.watch(sizeProvider),
                                child: GridView.count(
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class _QuestionButton extends ConsumerWidget {
  const _QuestionButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(generatedQuizProvider).value!;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final foregroundColor = colorScheme.onPrimary;
    return Center(
      child: FilledButton(
        onPressed: () => ref.read(quizSpeechServiceProvider).speech(),
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 32,
          ),
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: quiz.correctChoice.entity.name,
                style: textTheme.headlineSmall!.copyWith(
                  color: foregroundColor,
                ),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                // TODO(mono): l10n
                text: 'はどれかな？',
                style: textTheme.titleLarge!.copyWith(
                  color: foregroundColor,
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
    required this.choice,
  });

  final Document<Choice> choice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(generatedQuizProvider).value!;
    final showLabel = ref.watch(
      quizAnswerProvider.select((s) => s.incorrectChoices.contains(choice)),
    );
    final card = Card(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      child: Ink.image(
        image: ExtendedNetworkImageProvider(choice.entity.imageUrl),
        fit: isTeslaMode ? null : BoxFit.cover,
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
                  style:
                      Theme.of(context).primaryTextTheme.titleMedium!.copyWith(
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

    return choice == quiz.correctChoice
        ? Hero(
            tag: choice.entity.imageUrl,
            child: card,
          )
        : showLabel
            ? card.animate().shake(rotation: 0, offset: const Offset(20, 0))
            : card;
  }
}
