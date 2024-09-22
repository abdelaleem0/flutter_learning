import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleLoginUseCase   {
  AppleLoginUseCase();
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<bool> getResult() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );


      print('--------${appleCredential.toString()}');

      /// Save the email securely for future logins
      return true;
    } on SignInWithAppleAuthorizationException catch (e) {
      switch (e.code) {
        case AuthorizationErrorCode.canceled:
          throw Exception();
        case AuthorizationErrorCode.failed:
          throw Exception();

        case AuthorizationErrorCode.invalidResponse:
          throw Exception();
        case AuthorizationErrorCode.notHandled:
          rethrow;
        case AuthorizationErrorCode.notInteractive:
          rethrow;
        case AuthorizationErrorCode.unknown:
          throw Exception();
      }
    }
  }

}
