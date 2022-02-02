import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_casting_bloc/service/locator.dart';
import 'package:movie_casting_bloc/service/navigation_service.dart';
import 'package:movie_casting_bloc/ui/page/actors/index.dart';
import 'package:movie_casting_bloc/ui/page/login/index.dart';
import 'package:movie_casting_bloc/ui/page/roster/index.dart';
import 'package:movie_casting_bloc/ui/page/signup/index.dart';
import 'package:movie_casting_bloc/ui/page/start_up/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ActorsBloc>(
          create: (BuildContext context) => ActorsBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider<StartUpBloc>(
          create: (BuildContext context) => StartUpBloc(),
        ),
        BlocProvider<SignUpBloc>(
          create: (BuildContext context) => SignUpBloc(),
        ),
        BlocProvider<RosterBloc>(
          create: (BuildContext context) => RosterBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        home: const StartUp(),
      ),
    );
  }
}
