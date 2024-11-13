import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ydcpl_application/main.dart';
import 'package:ydcpl_application/screens/auth/model/login_model.dart';
import 'package:ydcpl_application/screens/auth/repository/login_repo.dart';
import 'package:ydcpl_application/screens/coc/view/english_coc.dart';
import 'package:ydcpl_application/screens/coc/view/testing_coc.dart';
import 'package:ydcpl_application/utils/utils.dart';

class AuthController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginRepo loginRepo = LoginRepo();
  LoginData? logindata;

  bool isChecked = false;

  Future<void> initState(context) async {
    emailController.clear();
    passwordController.clear();

    notifyListeners();
    // await (context);
  }

  void onChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }

  LoginRequestModel get loginRequestModel => LoginRequestModel(
      // fcmToken: fcmToken,
      password: passwordController.text,
      emailId: emailController.text);

  Future<void> onlogin(context) async {
    // if (mobileController.text.length < 10) {
    //   Utils.showPrimarySnackbar(context, "Please Enter Mobile Number",
    //       type: SnackType.error);
    //   notifyListeners();
    //   return;
    // }
    // if (passwordController.text == '' && passwordController.text == '') {
    //   Utils.showPrimarySnackbar(context, 'Please field Data',
    //       type: SnackType.error);
    //   notifyListeners();
    //   return;
    // }
    if (emailController.text == "") {
      Utils.showPrimarySnackbar(context, "Enter Email ID",
          type: SnackType.error);
      return;
    }
    bool email = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(emailController.text.trim());
    print(email);
    if (!email) {
      Utils.showPrimarySnackbar(context, "Enter Valid Email ID",
          type: SnackType.error);
      return;
    }
    if (passwordController.text == "") {
      Utils.showPrimarySnackbar(context, "Enter Password",
          type: SnackType.error);
      notifyListeners();
      return;
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    loginRepo.customerSignIn(loginRequestModel).then((response) {
      final result = LoginResponseModel.fromJson(jsonDecode(response.body));
      print(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        logindata = result.logindata;
        pref.setString("successToken", result.logindata?.token ?? "");
        pref.setString("loginId", result.loginId ?? "");
        pref.setString("userId", result.userId ?? "");
        final loginId = pref.getString('loginId');
        print(loginId);

        print(result.logindata);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EnglishcocScreenView(
                    screenName: '',
                  )),
        );
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      //Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }
}
