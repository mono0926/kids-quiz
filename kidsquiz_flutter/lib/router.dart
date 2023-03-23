import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kidsquiz/features/quiz/quiz_page.dart';
import 'package:mono_kit/widgets/go_router_location_button.dart';

final navigatorKey = Provider((ref) => GlobalKey<NavigatorState>());

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: ref.watch(navigatorKey),
    routes: [
      ShellRoute(
        builder: goRouteLocationButtonNavigationBuilder,
        routes: [
          GoRoute(
            path: '/',
            name: QuizPage.routeName,
            builder: (context, state) => const QuizPage(),
          ),
        ],
      ),
    ],
  ),
);
