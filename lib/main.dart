import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_video/ui/shared/app_colors.dart';
import 'package:flutter_video/utils/locator.dart';
import 'package:flutter_video/utils/routers_paths.dart';
import 'package:flutter_video/utils/router.dart' as router;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_video/utils/navigation_service.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SharedPreferences.setMockInitialValues({});
  runApp(const MyApp());
  configLoading();
}
void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.transparent
    ..boxShadow = <BoxShadow>[]
    ..textColor = Colors.white
    ..indicatorColor = darkGreen
    ..maskType = EasyLoadingMaskType.none
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = false
    ..dismissOnTap = false;
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LinkedIn',
      theme: ThemeData(
          fontFamily: 'ArabicUIText',
          primaryColor: blueColor2,
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: blueColor2)),
      initialRoute: SPLASH_ROUTE,
      onGenerateRoute: router.Router.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      builder: EasyLoading.init(builder: BotToastInit()),
    );;
  }
}
