import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono_kit/extensions/extensions.dart';

import 'consts.dart';
import 'router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: appName,
      // TODO(mono): 調整
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
