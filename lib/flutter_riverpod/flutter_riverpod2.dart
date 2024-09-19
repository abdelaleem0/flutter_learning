// lib/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a class to manage the state
class AuthProviderTwo extends StateNotifier<int> {
  AuthProviderTwo() : super(0){
    print("_______________--AuthProviderTwo_______________________");
  }
  // Initialize counter to 0

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  Future<void> login(String username, String password) async {
    // Simulate a login process
    await Future.delayed(Duration(seconds: 1));
    print('User $username logged in');
  }

  Future<void> register(String username, String password) async {
    // Simulate a registration process
    await Future.delayed(Duration(seconds: 1));
    print('User $username registered');
  }


  @override
 void dispose(){
    print("_______________--Dispose_______________________");

    super.dispose();


  }

}

// Create a provider for AuthProvider
final authProvider2 = StateNotifierProvider<AuthProviderTwo, int>((ref) {
  return AuthProviderTwo();
});
