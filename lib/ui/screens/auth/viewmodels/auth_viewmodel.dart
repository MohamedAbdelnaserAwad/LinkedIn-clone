import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_video/core/services/shared_prefrance_manager.dart';
import 'package:flutter_video/core/viewmodels/base_view_model.dart';
import 'package:flutter_video/ui/screens/auth/models/login_response.dart';
import 'package:flutter_video/ui/screens/auth/models/register_response.dart';
import 'package:flutter_video/ui/screens/home/home_screen.dart';
import 'package:flutter_video/ui/shared/values.dart';
import 'package:flutter_video/utils/apo_constants.dart';
import 'package:flutter_video/utils/rotation_rout.dart';
import 'package:flutter_video/utils/routers_paths.dart';





class AuthViewModel extends BaseViewModel {

  void doLogin({required String email, required String password ,required BuildContext context,}) async {
    Map<String, dynamic> response = {};
    LoginResponse? loginResponse;

    try {
      showLoading();
      response =
      await webService.postRequest(ApiConstants.LOGIN_URL, queryParams: {
        'email': email,
        'password': password,
      });

      hideLoading();
      loginResponse = LoginResponse.fromJson(json.decode(response['data']));
      if (loginResponse.status ?? false) {
        // SharedPrefs.saveData(
        //   key: 'token',
        //   value: loginResponse.data!.token,
        // ).then((value) {
        //   //Values.token =loginResponse!.data!.token.toString();
        //   //SharedPrefs.saveData(key: 'token', value: Values.token);
         // navigation.pushReplacement(HOME_ROUTE);


        Navigator.push(context, RotationRoute(page: HomeScreen()));



        // });
      } else {
        showError(loginResponse.message ?? "Unauthorized");
      }
    } catch (ex) {
      hideLoading();
      String error = response['error'] ?? "Server error";
      showError(error);
    }
  }

  void doRegister(
      {required String email,
        required String password,
        required String name,
        required String phone,
        required BuildContext context
      }) async {
    Map<String, dynamic> response = {};
    RegisterResponse? registerResponse;

    try {
      showLoading();
      response =
      await webService.postRequest(ApiConstants.REGISTER_URL, queryParams: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      });

      hideLoading();
      registerResponse =
          RegisterResponse.fromJson(json.decode(response['data']));
      if (registerResponse.status ?? false) {
        //navigation.pushReplacement(HOME_ROUTE);
        Navigator.push(context, RotationRoute(page: HomeScreen()));

      } else {
        showError("Email or Phone Already taken");
      }
    } catch (ex) {
      hideLoading();
      String error = response['error'] ?? "Server error";
      showError(error);
    }
  }
}
