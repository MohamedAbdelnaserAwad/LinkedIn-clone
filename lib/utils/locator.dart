import 'package:flutter_video/core/services/web_service.dart';
import 'package:flutter_video/ui/screens/auth/viewmodels/auth_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'navigation_service.dart';

GetIt locator = GetIt.instance;


void setupLocator() {
  locator.registerLazySingleton(() => WebService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthViewModel());

}