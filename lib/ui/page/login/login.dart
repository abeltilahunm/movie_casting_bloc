part of login;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext mainContext) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, bool?>(
        builder: (BuildContext context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: state != null && state == true
                ? loadingSpinnerWidget
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 28),
                      ),
                      verticalSpaceMedium,
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 12),
                      ),
                      verticalSpaceTiny,
                      StreamBuilder(
                        stream: context.read<LoginBloc>().emailStream,
                        builder: (context, snap) {
                          return InputTextField(
                            hint: '',
                            hasError: snap.hasError,
                            errorText: snap.error.toString(),
                            obscureText: false,
                            validator: (String text) {
                              context.read<LoginBloc>().validateUserEmail(text);
                            },
                            controller: context.read<LoginBloc>().emailCont,
                          );
                        },
                      ),
                      verticalSpaceSmall,
                      const Text(
                        "Password",
                        style: TextStyle(fontSize: 12),
                      ),
                      verticalSpaceTiny,
                      StreamBuilder(
                        stream: context.read<LoginBloc>().passwordStream,
                        builder: (context, snap) {
                          return InputTextField(
                            hint: '',
                            hasError: snap.hasError,
                            errorText: snap.error.toString(),
                            obscureText: true,
                            validator: (String text) {
                              context
                                  .read<LoginBloc>()
                                  .validateUserPassword(text);
                            },
                            controller: context.read<LoginBloc>().passCont,
                          );
                        },
                      ),
                      verticalSpaceMedium,
                      StreamBuilder(
                        stream: context.read<LoginBloc>().buttonValid,
                        builder: (context, snap) {
                          return ButtonWidget(
                            title: "Login",
                            disabled: !snap.hasData,
                            onTap: () {
                              if (snap.hasData) {
                                context
                                    .read<LoginBloc>()
                                    .loginUser(mainContext);
                              }
                            },
                          );
                        },
                      ),
                      verticalSpaceLarge,
                      Row(
                        children: [
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width / 2.5,
                            color: BaseColors.greyColor.withOpacity(0.4),
                          ),
                          const Text("OR"),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width / 2.5,
                            color: BaseColors.greyColor.withOpacity(0.4),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "New User?",
                            style: TextStyle(fontSize: 14),
                          ),
                          TextButton(
                            onPressed: () => context
                                .read<LoginBloc>()
                                .navigateToSignUp(context),
                            child: const Text(
                              "Create Account.",
                              style: TextStyle(
                                  fontSize: 16, color: BaseColors.black),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
