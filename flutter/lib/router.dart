import 'package:flutter/material.dart';
import 'package:kids_quiz/model/entity/choice/choice.dart';
import 'package:kids_quiz/pages/group_page/group_page.dart';
import 'package:kids_quiz/pages/pages.dart';
import 'package:kids_quiz/pages/quiz_add_page/quiz_add_page.dart';
import 'package:kids_quiz/pages/quiz_edit_page/group_tile.dart';
import 'package:kids_quiz/pages/quiz_edit_page/quiz_edit_page.dart';
import 'package:mono_kit/mono_kit.dart';

import 'model/model.dart';
import 'pages/result_page.dart';
import 'util/util.dart';

typedef WidgetPageBuilder = Widget Function(
  BuildContext context,
  RouteSettings settings,
);

class Router {
  static const root = '/';

  final _routes = <String, WidgetPageBuilder>{
    GroupPage.routeName: (context, settings) => GroupPage.wrapped(
          model: settings.arguments as GroupModel,
        ),
  };
  final _fadeRoutes = <String, WidgetPageBuilder>{
    QuizPage.routeName: (context, settings) => QuizPage.wrapped(),
    ResultPage.routeName: (context, settings) => ResultPage.wrapped(),
    QuizAddPage.routeName: (context, settings) => QuizAddPage.wrapped(
          choiceDoc: settings.arguments as Document<Choice>,
        ),
  };
  final _modalRoutes = <String, WidgetPageBuilder>{
    QuizEditPage.routeName: (context, settings) => QuizEditPage.wrapped(),
  };

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    logger.info(settings.name);
    var pageBuilder = _routes[settings.name];
    if (pageBuilder != null) {
      return MaterialPageRoute<void>(
        builder: (context) => pageBuilder(context, settings),
        settings: settings,
      );
    }
    pageBuilder = _fadeRoutes[settings.name];
    if (pageBuilder != null) {
      return FadePageRoute<void>(
        builder: (context) => pageBuilder(context, settings),
        settings: settings,
      );
    }

    pageBuilder = _modalRoutes[settings.name];
    if (pageBuilder != null) {
      return MaterialPageRoute<void>(
        builder: (context) => pageBuilder(context, settings),
        settings: settings,
        fullscreenDialog: true,
      );
    }

    assert(false, 'unexpected settings: $settings');
    return null;
  }
}
