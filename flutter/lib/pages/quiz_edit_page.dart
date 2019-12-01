import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/model/choices_observer.dart';
import 'package:kids_quiz/model/entity/choice/choice.dart';
import 'package:kids_quiz/pages/quiz_add_page.dart';
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
    final docs = model.docs;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: docs.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final doc = docs[index];
        final choice = doc.entity;
        return ListTile(
          title: Text(choice.name),
          subtitle: Text(choice.group),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(imageUrl: choice.imageUrl),
          ),
        );
      },
    );
  }
}

class _Model with ChangeNotifier {
  _Model({@required this.observer}) {
    _docs = observer.docs.value;
    observer.docs.listen((docs) {
      _docs = docs;
      notifyListeners();
    });
  }
  List<ChoiceDoc> _docs;
  List<ChoiceDoc> get docs => _docs;
  final ChoicesObserver observer;
}
