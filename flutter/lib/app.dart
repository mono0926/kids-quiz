import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kids_quiz/consts.dart';
import 'package:kids_quiz/util/app_navigator.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

import 'pages/quiz_page.dart';
import 'router.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(),
      title: appName,
      navigatorKey: Provider.of<AppNavigator>(context).key,
      home: const AccountRegistrationPage(),
//      home: QuizPage.wrapped(),
      onGenerateRoute: Provider.of<Router>(context).onGenerateRoute,
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        return TextScaleFactor(
          min: min(mediaQuery.size.width, mediaQuery.size.height) / 375,
          max: 2,
          child: child,
        );
      },
    );
  }
}
