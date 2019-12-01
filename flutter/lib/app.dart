import 'package:flutter/material.dart';
import 'package:kids_quiz/util/app_navigator.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
import 'router.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    const title = 'mono_kit Demo';
    return MaterialApp(
      theme: buildTheme(),
      title: title,
      navigatorKey: Provider.of<AppNavigator>(context).key,
      home: const QuizPage(),
      onGenerateRoute: Provider.of<Router>(context).onGenerateRoute,
      builder: (context, child) => TextScaleFactor(
        min: MediaQuery.of(context).size.width / 375,
        child: child,
      ),
    );
  }
}
