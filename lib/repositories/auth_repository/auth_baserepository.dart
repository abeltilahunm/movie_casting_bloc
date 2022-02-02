import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBaseRepository{
  Future<User?> signUpUser({required email, required password});
  Future<User?> loginUser({required email, required password});
  Future<void> logoutUser();
  User get fetchCurrentUser;

  Stream<User?> listenToAuthState();
}