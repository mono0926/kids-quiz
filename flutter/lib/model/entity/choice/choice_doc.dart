import 'package:firestore_ref/firestore_ref.dart';

import 'choice.dart';

class ChoiceDoc extends Document<Choice> {
  const ChoiceDoc(
    String id,
    Choice entity,
  ) : super(
          id,
          entity,
        );
}
