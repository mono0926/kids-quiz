import 'package:flutter/material.dart';
import 'package:kids_quiz/util/app_navigator.dart';
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
      home: const HomePage(),
      onGenerateRoute: Provider.of<Router>(context).onGenerateRoute,
    );
  }
}
