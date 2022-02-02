library roster;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_casting_bloc/model/actors_model.dart';
import 'package:movie_casting_bloc/repositories/actors_repository/actors_respository.dart';
import 'package:movie_casting_bloc/repositories/auth_repository/auth_repository.dart';
import 'package:movie_casting_bloc/service/locator.dart';
import 'package:movie_casting_bloc/service/navigation_service.dart';
import 'package:movie_casting_bloc/ui/shared/base_appbar.dart';
import 'package:movie_casting_bloc/ui/shared/base_colors.dart';
import 'package:movie_casting_bloc/ui/shared/spinner.dart';
import 'package:movie_casting_bloc/util/format_currency.dart';
import 'package:movie_casting_bloc/util/logger.dart';
import 'package:ui_helper/ui_helper.dart';

part 'roster.dart';

part 'bloc/roster_bloc.dart';
part 'widgets/casted_actor_tile.dart';