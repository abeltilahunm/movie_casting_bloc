part of start_up;

class StartUp extends StatelessWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of<StartUpBloc>(context).getAuthStateOfUser(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingSpinnerWidget;
        } else {
          logger.d('here');
          if (snapshot.hasData && snapshot.data != null) {
            return const ActorsList();
          } else {
            return const Login();
          }
        }
      },
    );
  }
}
