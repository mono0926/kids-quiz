import 'package:flutter/material.dart';
import 'package:kids_quiz/pages/pages.dart';
import 'package:mono_kit/mono_kit.dart';

import 'pages/result_page.dart';
import 'util/util.dart';

typedef WidgetPageBuilder = Widget Function(
  BuildContext context,
  RouteSettings settings,
);

class Router {
  static const root = '/';

  final _routes = <String, WidgetPageBuilder>{};
  final _fadeRoutes = <String, WidgetPageBuilder>{
    QuizPage.routeName: (context, settings) => const QuizPage(),
    ResultPage.routeName: (context, settings) => ResultPage.wrapped(),
  };
  final _modalRoutes = <String, WidgetPageBuilder>{};

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
