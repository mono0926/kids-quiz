import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

const isTeslaMode = bool.fromEnvironment('TESLA');
// TODO(mono): l10n
const appName = isTeslaMode ? '🚘 TESLA S3XY クイズ 👯‍♀️' : 'キッズクイズ';
