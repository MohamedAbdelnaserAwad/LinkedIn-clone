import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/ui/screens/auth/screens/register_screen.dart';
import 'package:flutter_video/ui/screens/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter_video/ui/shared/app_colors.dart';
import 'package:flutter_video/ui/shared/text_styles.dart';
import 'package:flutter_video/utils/common.dart';
import 'package:flutter_video/utils/locator.dart';
import 'package:flutter_video/utils/navigation_service.dart';
import 'package:flutter_video/utils/rotation_rout.dart';
import 'package:flutter_video/utils/routers_paths.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emilController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emilController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
          style: appBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: fKey,
            child: Column(
              children: [
                Image.asset(imgPath + 'linkedin.png', width: 180, height: 180),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  controller: emilController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You Must Enter Vaild Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: MaterialButton(
                    onPressed: () {
                      if (fKey.currentState!.validate()) {
                        locator<AuthViewModel>().doLogin(
                            email: emilController.text,
                            password: passwordController.text,
                          context: context,
                        );
                      }
                    },
                    child: const Text(
                      'LOGIN',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have an Account?",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, RotationRoute(page: RegisterScreen()));
                        //locator<NavigationService>().pushReplacement(REGISTER_ROUTE);
                      },
                      child: const Text(
                        'Sign Up',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
