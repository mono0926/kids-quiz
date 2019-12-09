import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:mono_kit/mono_kit.dart';

class AccountRegistrationPage extends StatelessWidget {
  const AccountRegistrationPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const borderRadius = 1000.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント登録'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: <Widget>[
          AppleSignInButton(
            borderRadius: borderRadius,
            text: 'Appleアカウントで始める',
            onPressed: () {},
          ),
          GoogleSignInButton(
            borderRadius: borderRadius,
            text: 'Googleアカウントで始める',
            onPressed: () {},
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
    );
  }
}
