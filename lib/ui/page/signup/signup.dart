part of signup;

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext mainContext) {
    return Scaffold(
      body: BlocBuilder<SignUpBloc, bool?>(
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
                        "Sign Up",
                        style: TextStyle(fontSize: 28),
                      ),
                      verticalSpaceMedium,
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 12),
                      ),
                      verticalSpaceTiny,
                      StreamBuilder(
                        stream: context.read<SignUpBloc>().emailStream,
                        builder: (context, snap) {
                          return InputTextField(
                            hint: '',
                            hasError: snap.hasError,
                            errorText: snap.error.toString(),
                            obscureText: false,
                            validator: (String text) {
                              context
                                  .read<SignUpBloc>()
                                  .validateUserEmail(text);
                            },
                            controller: context.read<SignUpBloc>().emailCont,
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
                        stream: context.read<SignUpBloc>().passwordStream,
                        builder: (context, snap) {
                          return InputTextField(
                            hint: '',
                            hasError: snap.hasError,
                            errorText: snap.error.toString(),
                            obscureText: true,
                            validator: (String text) {
                              context
                                  .read<SignUpBloc>()
                                  .validateUserPassword(text);
                            },
                            controller: context.read<SignUpBloc>().passCont,
                          );
                        },
                      ),
                      verticalSpaceSmall,
                      const Text(
                        "Confirm Password",
                        style: TextStyle(fontSize: 12),
                      ),
                      verticalSpaceTiny,
                      StreamBuilder(
                        stream:
                            context.read<SignUpBloc>().confirmPasswordStream,
                        builder: (context, snap) {
                          return InputTextField(
                            hint: '',
                            hasError: snap.hasError,
                            errorText: snap.error.toString(),
                            obscureText: true,
                            validator: (String text) {
                              context
                                  .read<SignUpBloc>()
                                  .validateUserConfirmPassword(text);
                            },
                            controller: context.read<SignUpBloc>().conCont,
                          );
                        },
                      ),
                      verticalSpaceMedium,
                      StreamBuilder(
                        stream: context.read<SignUpBloc>().buttonValid,
                        builder: (context, snap) {
                          return ButtonWidget(
                            title: "Sign Up",
                            disabled: !snap.hasData,
                            onTap: () {
                              if (snap.hasData) {
                                context
                                    .read<SignUpBloc>()
                                    .signUpUser(mainContext);
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
                            "Already User?",
                            style: TextStyle(fontSize: 14),
                          ),
                          TextButton(
                            onPressed: () => context
                                .read<SignUpBloc>()
                                .navigateToLogin(context),
                            child: const Text(
                              "Login.",
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
