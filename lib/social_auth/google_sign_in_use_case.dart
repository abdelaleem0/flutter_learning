import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInUseCase{
  final _googleSignIn = GoogleSignIn(
    scopes: [
      "email",
      "profile",
    ],
  );

  Future<bool> login() async {
    try {
      final result = await _googleSignIn.signIn();
      if (result != null) {
        await _googleSignIn.signOut();
        print("^^^^^^^^$result^^^^^^^^^");
        return true;
      } else {
        throw Exception();
      }
    } on PlatformException catch (e) {
      if (e.code == GoogleSignIn.kSignInFailedError) {
        throw Exception(
        );

      } else {
        rethrow;
      }
    }
  }

}