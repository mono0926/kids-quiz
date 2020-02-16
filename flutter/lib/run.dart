import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/widgets.dart';
import 'package:kids_quiz/model/downloader.dart';
import 'package:kids_quiz/model/image_compressor.dart';
import 'package:kids_quiz/model/image_cropper.dart';
import 'package:kids_quiz/model/uploader.dart';
import 'package:provider/provider.dart';
import 'package:vsync_provider/vsync_provider.dart';

import 'app.dart';
import 'model/model.dart';
import 'router.dart';

enum Environment {
  cloud,
  local,
}

Future run({@required Environment environment}) async {
  WidgetsFlutterBinding.ensureInitialized();
  switch (environment) {
    case Environment.cloud:
      break;
    case Environment.local:
      await Firestore.instance.settings(
        persistenceEnabled: false,
        host: 'localhost:8080',
        sslEnabled: false,
      );
      break;
  }
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => Downloader()),
        Provider(
          create: (context) => Uploader(locator: context.read),
        ),
        Provider(create: (context) => ChoicesObserver()),
        Provider(create: (context) => GlobalKey<NavigatorState>()),
        Provider(create: (context) => const ImageCompressor()),
        Provider(create: (context) => const ImageCropper()),
        Provider(
          create: (context) => QuizGenerator.samples(locator: context.read),
        ),
        Provider(create: (context) => Router()),
        Provider(create: (context) => SpeechService()),
        VsyncProvider(isSingleTicker: false),
        ChangeNotifierProvider(
          create: (context) => QuizNotifier(locator: context.read),
        )
      ],
      child: const App(),
    ),
  );
}
