import 'package:flutter/material.dart';
import 'package:flutter_video/ui/screens/camera_screen/camera_page.dart';
import 'package:flutter_video/ui/shared/app_colors.dart';
import 'package:flutter_video/utils/locator.dart';
import 'package:flutter_video/utils/navigation_service.dart';
import 'package:flutter_video/utils/rotation_rout.dart';
import 'package:flutter_video/utils/routers_paths.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 50.0,
          child: MaterialButton(
            onPressed: () {
              locator<NavigationService>().pushReplacement(CAMERA_ROUTE);
              //Navigator.push(context, RotationRoute(page: CameraPage()));

            },
            child: const Text(
              'Let\'s Record' ,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            color: blueColor2,
          ),
        ),
      ),
    );
  }
}
