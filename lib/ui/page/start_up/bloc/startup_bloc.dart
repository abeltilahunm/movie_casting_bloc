part of start_up;

class StartUpBloc extends Cubit<User?> {
  StartUpBloc() : super(null);

  final _authRepository = AuthRepository();

  Stream<User?> getAuthStateOfUser() {
    return _authRepository.listenToAuthState();
  }
}
