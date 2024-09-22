import 'package:flutter/material.dart';
import 'package:learning_flutter/social_auth/google_sign_in_apple_use_case.dart';
import 'package:learning_flutter/social_auth/google_sign_in_use_case.dart';

class SocialAuthPage extends StatefulWidget {
  const SocialAuthPage({super.key});

  @override
  State<SocialAuthPage> createState() => _SocialAuthPageState();
}

class _SocialAuthPageState extends State<SocialAuthPage> {
  final _loginUsingGoogle = GoogleSignInUseCase();
  final _loginUsingApple = AppleLoginUseCase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(onTap: () async {
         final result=  await _loginUsingGoogle.login();
         print('result ${result}');
              }, child: const Text("data")),
        ],
      ),
    );
  }
}

