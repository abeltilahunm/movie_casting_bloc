part of login;

class LoginBloc extends Cubit<bool?> {
  final _authRepo = AuthRepository();
  final _emailController = StreamController<String>.broadcast();

  Stream<String> get emailStream => _emailController.stream;

  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get passwordStream => _passwordController.stream;

  final _emailReg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  TextEditingController get emailCont => _emailTextController;

  TextEditingController get passCont => _passwordTextController;

  //used to combine two streams, if they are valid button will be enabled.
  Stream<bool> get buttonValid =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  final _navigationService = locator<NavigationService>();

  LoginBloc() : super(null);

  Future<void> loginUser(BuildContext context) async {
    logger.d('Called');

    emit(true);
    User? user = await _authRepo.loginUser(
        email: emailCont.text, password: passCont.text);
    emit(false);

    if (user == null) {
      emailCont.clear();
      passCont.clear();
      FocusScope.of(context).unfocus();
      FlushbarHelper.createError(
              message: "Login Failed, Please try again ",
              title: "Wrong Credential")
          .show(context);
    } else {
      emailCont.clear();
      passCont.clear();
      FocusScope.of(context).unfocus();
    }
  }

  validateUserEmail(String text) {
    if (text.isEmpty) {
      // emit("This field can't be empty");
      _emailController.sink.addError("This field can't be empty");
    } else if (text.length < 4) {
      _emailController.sink.addError("Email is too short");
    } else if (!_emailReg.hasMatch(text)) {
      _emailController.sink.addError("Email is invalid");
    } else {
      _emailController.sink.add(text);
    }
  }

  validateUserPassword(String text) {
    if (text.isEmpty) {
      _passwordController.sink.addError("Password can't be empty");
    } else {
      _passwordController.sink.add(text);
    }
  }

  navigateToSignUp(BuildContext context) {
    _navigationService.navigateToUsingPush(const SignUp());
  }
}
