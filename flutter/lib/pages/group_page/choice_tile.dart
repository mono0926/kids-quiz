import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/pages/quiz_add_page/quiz_add_page.dart';
import 'package:provider/provider.dart';

import '../quiz_edit_page/group_tile.dart';

class ChoiceTile extends StatelessWidget {
  const ChoiceTile({
    Key key,
    @required this.doc,
  }) : super(key: key);

  final ChoiceDoc doc;

  @override
  Widget build(BuildContext context) {
    final choice = doc.entity;
    final model = context.watch<GroupModel>();
    return Dismissible(
      key: ValueKey(choice.name),
      background: Container(color: Theme.of(context).errorColor),
      onDismissed: (direction) => model.delete(doc),
      confirmDismiss: (direction) => Future.value(doc.id != null),
      child: ListTile(
        title: Text(choice.name),
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Theme.of(context).cardColor,
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: choice.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
//        trailing: doc.id == null ? Icon(Icons.bookmark) : null,
        trailing: Switch(value: true, onChanged: (value) {}),
        onTap: () => Navigator.of(context).pushNamed(
          QuizAddPage.routeName,
          arguments: doc,
        ),
      ),
    );
  }
}
