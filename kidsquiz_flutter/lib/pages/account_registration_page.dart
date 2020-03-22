import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kids_quiz/util/util.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

class AccountRegistrationPage extends StatelessWidget {
  const AccountRegistrationPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return Provider(
      create: (context) => Model(),
      child: const AccountRegistrationPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = 24.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント登録'),
      ),
      body: TextScaleFactor(
        max: 1,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: <Widget>[
            AppleSignInButton(
              borderRadius: borderRadius,
              text: 'Appleアカウントで始める',
              onPressed: () {
                logger.info('Apple');
              },
            ),
            GoogleSignInButton(
              borderRadius: borderRadius,
              text: 'Googleアカウントで始める',
              onPressed: () {
                context.read<Model>().signIn();
              },
            ),
          ]
              .map((w) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: CenteredMaxWidth(
                      width: 320,
                      child: SizedBox(
                        height: 48,
                        child: w,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class Model {
  Model() {
    _authenticator.onAuthStateChanged.listen((user) {
      logger.info('user: $user');
    });
  }

  final _authenticator = Authenticator();

  void signIn() {
    _authenticator.signIn();
  }
}

class Authenticator {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  Future<FirebaseUser> firUser() => _auth.currentUser();
  Stream<FirebaseUser> get onAuthStateChanged => _auth.onAuthStateChanged;

  Future<FirebaseUser> signIn() async {
    final current = await _auth.currentUser();
    if (current != null) {
      logger.shout(
          'signIn should be called only if signed out(current: $current).');
      return current;
    }
    final gAccount = await _googleSignIn.signIn();
    if (gAccount == null) {
      return null;
    }
    final gAuth = await gAccount.authentication;
    final result = await _auth.signInWithCredential(
      GoogleAuthProvider.getCredential(
        idToken: gAuth.idToken,
        accessToken: gAuth.accessToken,
      ),
    );
    logger.info(result);
    return result.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
