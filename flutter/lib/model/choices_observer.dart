import 'package:disposable_provider/disposable_provider.dart';
import 'package:firestore_ref/firestore_ref.dart';
import 'package:kids_quiz/model/entity/choice/choice.dart';
import 'package:rxdart/rxdart.dart';

class ChoicesObserver with Disposable {
  ChoicesObserver() {
    ChoicesRef.ref()
        .documents((r) => r.orderBy(
              EntityField.createdAt,
              descending: true,
            ))
        .pipe(_docs);
  }

  final _docs = BehaviorSubject<List<ChoiceDoc>>();

  ValueObservable<List<ChoiceDoc>> get docs => _docs;

  @override
  void dispose() {
    _docs.close();
  }
}
