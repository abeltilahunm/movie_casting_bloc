library login;

import 'dart:async';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_casting_bloc/repositories/auth_repository/auth_repository.dart';
import 'package:movie_casting_bloc/service/locator.dart';
import 'package:movie_casting_bloc/service/navigation_service.dart';
import 'package:movie_casting_bloc/ui/page/signup/index.dart';
import 'package:movie_casting_bloc/ui/shared/base_colors.dart';
import 'package:movie_casting_bloc/ui/shared/spinner.dart';
import 'package:movie_casting_bloc/ui/shared/textfeild_widget.dart';
import 'package:movie_casting_bloc/util/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ui_helper/ui_helper.dart';

part 'login.dart';

part 'bloc/login_bloc.dart';
