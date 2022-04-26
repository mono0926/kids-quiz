import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kidsquiz/features/quiz/quiz_page.dart';
import 'package:mono_kit/widgets/go_router_location_button.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: QuizPage.routeName,
        builder: (context, state) => const QuizPage(),
      ),
    ],
    navigatorBuilder: (context, state, child) => GoRouterLocationButton(
      // ignore: avoid_redundant_argument_values
      visible: kDebugMode,
      child: child,
    ),
  ),
);

extension GoRouterX on GoRouter {
  BuildContext get context => navigator!.context;
}
