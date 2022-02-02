import 'package:another_flushbar/flushbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_casting_bloc/repositories/auth_repository/auth_baserepository.dart';
import 'package:movie_casting_bloc/service/locator.dart';
import 'package:movie_casting_bloc/service/navigation_service.dart';
import 'package:movie_casting_bloc/ui/page/start_up/index.dart';
import 'package:movie_casting_bloc/util/logger.dart';

class AuthRepository extends AuthBaseRepository {
  final fireAuth = FirebaseAuth.instance;
  final _navigationService = locator<NavigationService>();

  @override
  User get fetchCurrentUser => fireAuth.currentUser!;

  @override
  Future<User?> loginUser({required email, required password}) async {
    logger.d('message');
    try {
      UserCredential userCredential = await fireAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        logger.d("Error");
        return null;
      }
    } catch (e) {
      logger.d('There is an error' + e.toString());
      return null;
    }
  }

  @override
  Future<User?> signUpUser({required email, required password}) async {
    try {
      UserCredential userCredential = await fireAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        return userCredential.user;
      }
    } catch (e) {
      logger.d('There is an error on create account' + e.toString());
      return null;
    }
  }

  @override
  Stream<User?> listenToAuthState() {
    return fireAuth.userChanges();
  }

  @override
  Future<void> logoutUser() {
    _navigationService.navigateToUsingPushReplace(const StartUp());
    return fireAuth.signOut();
  }
}
