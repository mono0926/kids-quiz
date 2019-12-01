import 'package:firestore_ref/firestore_ref.dart';

import 'choice.dart';
import 'choice_doc.dart';
import 'choice_ref.dart';

export 'choice_ref.dart';

class ChoicesRef extends CollectionRef<Choice, ChoiceDoc> {
  ChoicesRef.ref()
      : super(
          ref: firestoreInstance.collection(collection),
          decoder: _ChoiceDocDecoder(),
          encoder: _ChoiceEncoder(),
        );

  static const collection = 'choices';

  @override
  ChoiceRef docRef([String id]) {
    return ChoiceRef(
      ref: docRefRaw(id),
      encoder: encoder,
      decoder: decoder,
    );
  }
}

class _ChoiceDocDecoder extends DocumentDecoder<ChoiceDoc> {
  @override
  ChoiceDoc decode(DocumentSnapshot snapshot) {
    return ChoiceDoc(
      snapshot.documentID,
      Choice.fromJson(FirRefDocumentSnapshotEx(snapshot).data),
    );
  }
}

class _ChoiceEncoder extends EntityEncoder<Choice> {
  @override
  Map<String, dynamic> encode(Choice entity) => entity.toJson();
}
