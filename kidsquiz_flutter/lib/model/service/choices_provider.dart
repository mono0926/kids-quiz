import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidsquiz/main.dart';
import 'package:kidsquiz/model/model.dart';
import 'package:kidsquiz/util/util.dart';

final choicesRef = Provider(
  (ref) => FirebaseFirestore.instance.collection('choices').withConverter(
        fromFirestore: (snapshot, _) => Choice.fromJson(snapshot.data()!),
        toFirestore: (choice, _) => choice.toJson(),
      ),
);

final choicesProvider = StreamProvider((ref) {
  // アップロードしたクイズの権限周りを真っ当に整えるまではデフォルトのクイズのみ
  return Stream.value(isTeslaMode ? _teslaChoices : _defaultChoices);
  // ignore: dead_code
  return ref
      .watch(choicesRef)
      .orderBy(TimestampField.createdAt, descending: true)
      .snapshots()
      .map(
        (querySnap) => [
          ...querySnap.docs.map(
            (docSnap) => Document(
              docSnap.id,
              docSnap.data(),
            ),
          ),
          ..._defaultChoices,
        ],
      );
});

enum Tesla { s, e, x, y }

extension on Tesla {
  String get label {
    switch (this) {
      case Tesla.s:
        return 'Model S';
      case Tesla.e:
        return 'Model 3';
      case Tesla.x:
        return 'Model X';
      case Tesla.y:
        return 'Model Y';
    }
  }
}

final _teslaChoices = Tesla.values
    .map(
      (t) => ['l', 'r', 'b'].map(
        (group) => Choice(
          name: t.label,
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/kids-quiz-mono.appspot.com/o/images%2Ftesla%2F${t.name}%2F$group.jpg?alt=media',
          group: group,
        ),
      ),
    )
    .expand((e) => e)
    .map((c) => Document<Choice>(null, c))
    .toList();

final _defaultChoices = const [
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
].map((c) => Document<Choice>(null, c)).toList();
