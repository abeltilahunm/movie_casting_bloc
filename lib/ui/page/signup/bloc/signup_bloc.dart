part of signup;

class SignUpBloc extends Cubit<bool?> {
  final _authRepo = AuthRepository();
  final _emailController = StreamController<String>.broadcast();

  Stream<String> get emailStream => _emailController.stream;

  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get passwordStream => _passwordController.stream;

  final _passwordConfirmController = StreamController<String>.broadcast();

  Stream<String> get confirmPasswordStream => _passwordConfirmController.stream;

  final _emailReg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _conPasswordTextController = TextEditingController();

  TextEditingController get emailCont => _emailTextController;

  TextEditingController get passCont => _passwordTextController;

  TextEditingController get conCont => _conPasswordTextController;

  //used to combine two streams, if they are valid button will be enabled.
  Stream<bool> get buttonValid => Rx.combineLatest3(
      emailStream, passwordStream, confirmPasswordStream, (a, b, c) => true);

  final _navigationService = locator<NavigationService>();
  SignUpBloc() : super(null);

  Future<void> signUpUser(BuildContext context) async {
    emit(true);
    User? user = await _authRepo.signUpUser(
        email: emailCont.text, password: passCont.text);
    emit(false);

    if (user == null) {
      rest(context);
      FlushbarHelper.createError(
              message: "Login Failed, Please try again ",
              title: "Wrong Credential")
          .show(context);
    }else{
      _navigationService.popUntil();
      _navigationService.navigateToUsingPushReplace(const ActorsList());
    }
  }

  rest(BuildContext context) {
    emailCont.clear();
    passCont.clear();
    conCont.clear();
    FocusScope.of(context).unfocus();
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

  validateUserConfirmPassword(String text) {
    if (text.isEmpty) {
      _passwordConfirmController.sink
          .addError("Confirm password can't be empty");
    } else if (passCont.text != text) {
      _passwordConfirmController.sink.addError("Passwords don't match.");
    } else {
      _passwordConfirmController.sink.add(text);
    }
  }

  navigateToLogin(BuildContext context) {
    rest(context);
    _navigationService.popPage();
  }
}
