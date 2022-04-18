import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/ui/screens/auth/screens/login_screen.dart';
import 'package:flutter_video/ui/screens/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter_video/ui/shared/app_colors.dart';
import 'package:flutter_video/ui/shared/text_styles.dart';
import 'package:flutter_video/utils/common.dart';
import 'package:flutter_video/utils/locator.dart';
import 'package:flutter_video/utils/navigation_service.dart';
import 'package:flutter_video/utils/rotation_rout.dart';
import 'package:flutter_video/utils/routers_paths.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emilController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emilController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Registration',
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
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You Must Enter Valid Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  controller: emilController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You Must Enter Valid Emil';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You Must Enter Valid Phone';
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
                  height: 15.0,
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
                        locator<AuthViewModel>().doRegister(
                            email: emilController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                          context: context,
                        );
                      }
                    },
                    child: const Text(
                      'SIGN UP',
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
                      'Already have an account?',
                    ),
                    TextButton(
                      onPressed: () {
                       // locator<NavigationService>().pushReplacement(LOGIN_ROUTE);
                        Navigator.push(context, RotationRoute(page: LoginScreen()));

                      },
                      child: const Text(
                        'Login Now',
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
