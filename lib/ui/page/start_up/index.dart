library start_up;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_casting_bloc/repositories/auth_repository/auth_repository.dart';
import 'package:movie_casting_bloc/ui/page/actors/index.dart';
import 'package:movie_casting_bloc/ui/page/login/index.dart';
import 'package:movie_casting_bloc/ui/shared/spinner.dart';
import 'package:movie_casting_bloc/util/logger.dart';

part 'start_up.dart';

part 'bloc/startup_bloc.dart';