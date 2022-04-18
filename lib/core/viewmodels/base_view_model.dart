import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_video/core/services/web_service.dart';
import 'package:flutter_video/utils/locator.dart';
import 'package:flutter_video/utils/navigation_service.dart';


class BaseViewModel extends ChangeNotifier {
  bool isLoading = false;
  final navigation = locator<NavigationService>();
  final webService = locator<WebService>();

  showLoading() {
    EasyLoading.show();
    isLoading = true;
    notifyListeners();
  }

  hideLoading() {
    EasyLoading.dismiss();
    isLoading = false;
    notifyListeners();
  }

  showError(String error) {
    if (error.isNotEmpty) navigation.showError(error);
  }
}
