import 'package:get_it/get_it.dart';
import 'package:movie_casting_bloc/service/navigation_service.dart';

final locator = GetIt.instance; // GetIt.I is also valid
void setUp() {
  locator.registerLazySingleton(() => NavigationService());

  // register more instances
}
