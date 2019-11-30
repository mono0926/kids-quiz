import 'package:flutter/widgets.dart';
import 'package:kids_quiz/util/util.dart';
import 'package:provider/provider.dart';
import 'package:vsync_provider/vsync_provider.dart';

import 'app.dart';
import 'model/model.dart';
import 'router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => AppNavigator()),
        Provider(create: (context) => QuizGenerator.samples()),
        Provider(create: (context) => Router()),
        Provider(create: (context) => SpeechService()),
        VsyncProvider(isSingleTicker: false),
        ChangeNotifierProvider(
          create: (context) => QuizNotifier(
            quizGenerator: Provider.of(context, listen: false),
            speechService: Provider.of(context, listen: false),
            navigator: Provider.of(context, listen: false),
            tickerProvider: VsyncProvider.of(context),
          ),
        )
      ],
      child: const App(),
    ),
  );
}
