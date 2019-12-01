import 'package:flutter/cupertino.dart';
import 'package:kids_quiz/model/model.dart';

class QuizGenerator {
  QuizGenerator({
    @required this.observer,
    @required this.defaultChoices,
  });

  QuizGenerator.samples({
    @required ChoicesObserver observer,
  }) : this(
          observer: observer,
          defaultChoices: [
            Choice(
              name: 'にゃんにゃん',
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg',
              group: GroupNames.animal,
            ),
            Choice(
              name: 'ワンワン',
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/kids-quiz-mono.appspot.com/o/images%2Fdog.jpg?alt=media',
              group: GroupNames.animal,
            ),
            Choice(
              name: 'ごりら',
              imageUrl:
                  'https://2.bp.blogspot.com/-ruMSXp-w-qk/XDXbUFVC3FI/AAAAAAABQ-8/QRyKKr--u9E1-Rvy2SQqt0QPWeq1ME6wgCLcBGAs/s800/animal_gorilla.png',
              group: GroupNames.animal,
            ),
            Choice(
              name: 'ぱんだ',
              imageUrl:
                  'https://3.bp.blogspot.com/-alu3Ws14N6o/V4R0achmabI/AAAAAAAA8M0/iD5HygmobgEYzPXBxSJZGOq5L6OQtPK7wCLcB/s800/animal_bear_panda.png',
              group: GroupNames.animal,
            ),
            Choice(
              name: 'しまうま',
              imageUrl:
                  'https://4.bp.blogspot.com/-zrwJd18ni_M/UaVU_qRokmI/AAAAAAAAT9w/apfFHGRZSfI/s800/animal_shimauma.png',
              group: GroupNames.animal,
            ),
            Choice(
              name: 'やまのてせん',
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/kids-quiz-mono.appspot.com/o/images%2FIMG_1579.JPG?alt=media',
              group: GroupNames.vehicle,
            ),
            Choice(
              name: 'トーマス',
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/kids-quiz-mono.appspot.com/o/images%2FIMG_1893.JPG?alt=media',
              group: GroupNames.vehicle,
            ),
            Choice(
              name: 'ドクターイエロー',
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/kids-quiz-mono.appspot.com/o/images%2FIMG_2589.JPG?alt=media',
              group: GroupNames.vehicle,
            ),
            Choice(
              name: 'しんかんせん',
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/kids-quiz-mono.appspot.com/o/images%2FIMG_4066.JPG?alt=media',
              group: GroupNames.vehicle,
            ),
            Choice(
              name: 'パトカー',
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/kids-quiz-mono.appspot.com/o/images%2FIMG_3452.JPG?alt=media',
              group: GroupNames.vehicle,
            ),
            Choice(
              name: 'ショベルカー',
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/kids-quiz-mono.appspot.com/o/images%2FIMG_5043.JPG?alt=media',
              group: GroupNames.vehicle,
            ),
            Choice(
              name: 'アンパンマンカー',
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/kids-quiz-mono.appspot.com/o/images%2FIMG_5410.JPG?alt=media',
              group: GroupNames.vehicle,
            ),
            Choice(
              name: 'ミキサー車',
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/kids-quiz-mono.appspot.com/o/images%2FIMG_9056.JPG?alt=media',
              group: GroupNames.vehicle,
            )
          ],
        );

  final ChoicesObserver observer;
  Quiz _quiz;
  Quiz get quiz => _quiz;
  List<Choice> choices = [];

  Quiz generate() {
    final choice = _decideCorrectChoice();
    return _quiz = Quiz(
      choices: choices
          .where((c) => c.group == choice.group)
          .toList()
          .getRange(0, 4)
          .toList()
            ..shuffle(),
      correctChoice: choice,
    );
  }

  Choice _decideCorrectChoice() {
    choices = List<Choice>.from(defaultChoices)
      ..addAll((observer.docs.value ?? []).map((r) => r.entity))
      ..shuffle();
    final choice = choices.first;
    return choice == _quiz?.correctChoice ? _decideCorrectChoice() : choice;
  }

  final List<Choice> defaultChoices;
}
