import 'package:flutter/material.dart';

class AppFeedback {
  AppFeedback(this.key);
  AppFeedback.fromState(ScaffoldState state) : _state = state;
  AppFeedback.fromContext(BuildContext context)
      : this.fromState(Scaffold.of(context));

  GlobalKey<ScaffoldState> key;
  ScaffoldState _state;

  ScaffoldState get state => _state ?? key.currentState;
  BuildContext get context => state.context;

  void show(String text) {
    state
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(text)),
      );
  }

  void showUndo({
    @required String text,
    @required VoidCallback onUndo,
  }) {
    state
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
          action: SnackBarAction(
            textColor: Theme.of(context).textSelectionColor,
            label: '元に戻す',
            onPressed: onUndo,
          ),
        ),
      );
  }

  void notImplemented() {
    showError('未実装です');
  }

  void showError(dynamic error) {
    state
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).errorColor,
          content: Text(
            error.toString(),
          ),
        ),
      );
  }
}
