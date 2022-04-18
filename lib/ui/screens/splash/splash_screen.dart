import 'package:flutter/material.dart';
import 'package:flutter_video/ui/screens/auth/screens/login_screen.dart';
import 'package:flutter_video/ui/shared/app_colors.dart';
import 'package:flutter_video/ui/shared/text_styles.dart';
import 'package:flutter_video/utils/common.dart';


import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const LoginScreen(),
      duration: 4000,
      speed: 1,
      imageSize: 190,
      imageSrc: imgPath+"linkedin.png",
      text: "LinkedIn",
      textType: TextType.ScaleAnimatedText,
      textStyle: splashTextStyle.copyWith(fontSize: 28),
      backgroundColor: lightBlueBackground,
    );
  }
}
