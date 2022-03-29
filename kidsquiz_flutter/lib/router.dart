import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kidsquiz/features/quiz/quiz_page.dart';

import 'features/quiz/quiz_result_page.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: QuizPage.routeName,
        builder: (context, state) => const QuizPage(),
      ),
      GoRoute(
        path: '/result',
        name: QuizResultPage.routeName,
        builder: (context, state) => const QuizResultPage(),
      ),
    ],
  ),
);
