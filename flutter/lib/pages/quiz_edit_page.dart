import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/model/choices_observer.dart';
import 'package:kids_quiz/model/entity/choice/choice.dart';
import 'package:kids_quiz/pages/quiz_add_page.dart';
import 'package:mono_kit/utils/utils.dart';
import 'package:provider/provider.dart';

class QuizEditPage extends StatelessWidget {
  const QuizEditPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return ChangeNotifierProvider(
      create: (context) => _Model(
        observer: Provider.of(context, listen: false),
      ),
      child: const QuizEditPage._(),
    );
  }

  static const routeName = '/edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('クイズを編集'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('追加'),
        icon: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(QuizAddPage.routeName),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_Model>(context);
    final choices = model.choices;
    final categories = choices.keys.toList();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 96),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ExpansionTile(
          title: Text(category),
          children: choices[category]
              .map(
                (c) => Dismissible(
                  key: ValueKey(c.entity.name),
                  background: Container(color: Theme.of(context).errorColor),
                  onDismissed: (direction) => model.delete(c),
                  confirmDismiss: (direction) => Future.value(c.id != null),
                  child: ListTile(
                    title: Text(c.entity.name),
                    leading: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: Theme.of(context).canvasColor,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: CachedNetworkImage(
                              imageUrl: c.entity.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    trailing: c.id == null ? Icon(Icons.bookmark) : null,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _Model with ChangeNotifier {
  _Model({@required this.observer}) {
    _choices = _toMap(observer.choices.value);
    _sh.add(
      observer.choices.listen((choices) {
        _choices = _toMap(choices);
        notifyListeners();
      }),
    );
  }
  Map<String, List<ChoiceDoc>> _choices;
  Map<String, List<ChoiceDoc>> get choices => _choices;
  final ChoicesObserver observer;
  final _sh = SubscriptionHolder();

  static Map<String, List<ChoiceDoc>> _toMap(List<ChoiceDoc> choices) =>
      groupBy(choices, (x) => x.entity.group);

  void delete(ChoiceDoc doc) {
    ChoicesRef.ref().docRef(doc.id).ref.delete();
  }

  @override
  void dispose() {
    _sh.dispose();

    super.dispose();
  }
}
