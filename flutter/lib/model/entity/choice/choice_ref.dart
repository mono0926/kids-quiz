import 'package:firestore_ref/firestore_ref.dart';
import 'package:meta/meta.dart';

import 'choice.dart';
import 'choice_doc.dart';

class ChoiceRef extends DocumentRef<Choice, ChoiceDoc> {
  const ChoiceRef({
    @required DocumentReference ref,
    @required DocumentDecoder<ChoiceDoc> decoder,
    @required EntityEncoder<Choice> encoder,
  }) : super(
          ref: ref,
          decoder: decoder,
          encoder: encoder,
        );
}
