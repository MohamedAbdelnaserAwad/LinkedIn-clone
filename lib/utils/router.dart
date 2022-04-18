import 'package:flutter/material.dart';
import 'package:flutter_video/ui/screens/auth/screens/login_screen.dart';
import 'package:flutter_video/ui/screens/auth/screens/register_screen.dart';
import 'package:flutter_video/ui/screens/camera_screen/camera_page.dart';
import 'package:flutter_video/ui/screens/home/home_screen.dart';
import 'package:flutter_video/ui/screens/splash/splash_screen.dart';
import 'package:flutter_video/utils/routers_paths.dart';



class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case SPLASH_ROUTE:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case REGISTER_ROUTE:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case CAMERA_ROUTE:
        return MaterialPageRoute(builder: (_) => const CameraPage());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not found'),
            ),
          ),
        );
    }
  }
}
