import 'package:disposable_provider/disposable_provider.dart';
import 'package:firestore_ref/firestore_ref.dart';
import 'package:rxdart/rxdart.dart';

import 'model.dart';

class ChoicesObserver with Disposable {
  ChoicesObserver() : _choices = BehaviorSubject.seeded(_defaultChoices) {
    ChoicesRef.ref()
        .documents((r) => r.orderBy(
              TimestampField.createdAt,
              descending: true,
            ))
        .map((x) => x..addAll(_defaultChoices))
        .pipe(_choices);
  }

  final BehaviorSubject<List<ChoiceDoc>> _choices;

  ValueStream<List<ChoiceDoc>> get choices => _choices;

  @override
  void dispose() {
    _choices.close();
  }
}

final _defaultChoices = [
  Choice(
    name: 'にゃんにゃん',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg',
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
].map((c) => ChoiceDoc(null, c)).toList();
