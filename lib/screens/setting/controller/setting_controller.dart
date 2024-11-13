import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ydcpl_application/screens/coc/model/app_bar_model.dart';
import 'package:ydcpl_application/screens/coc/repository/app_bar_repo.dart';
import 'package:ydcpl_application/screens/setting/model/get_notification.dart';
import 'package:ydcpl_application/screens/setting/model/notification_model.dart';
import 'package:ydcpl_application/screens/setting/model/setting_model.dart';
import 'package:ydcpl_application/screens/setting/repository/getNotification_repo.dart';
import 'package:ydcpl_application/screens/setting/repository/notification_repo.dart';
import 'package:ydcpl_application/screens/setting/repository/setting_repo.dart';
import 'package:ydcpl_application/utils/utils.dart';
import 'package:ydcpl_application/widgets/loading_overlay.dart';

class ChangeSettingController extends ChangeNotifier {
  TextEditingController confirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController oldpasswordController = TextEditingController();
  bool switchValue = true;
  BuildContext? context;

  Future<void> initState(context) async {
    // await profileData(context);
    this.context = context;
    await shopNotification(context, '');
    await newAppbar(context);
    notifyListeners();
  }

  void onToggleSwitch(bool value) async {
    await changeSettings(context, value);
    switchValue = value;
    notifyListeners();
  }

  String? bakendNotification = '';

  SettingRepo settingRepo = SettingRepo();
  ChnagesPasswordRequest get chnagesPasswordRequest => ChnagesPasswordRequest(
        confirmPassword: confirmController.text,
        password: passwordController.text,
        oldPassword: oldpasswordController.text,
      );

  Future<void> UpdatePassword(context) async {
    // if (newPasswordController.text != re_TypePasswordContyroller.text) {
    //   Utils.showPrimarySnackbar(context, "Enter---- Correct Password",
    //       type: SnackType.error);
    //   return;
    // }
    if (oldpasswordController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, "Enter Current Password",
          type: SnackType.error);
      return;
    }
    if (passwordController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, "Enter New Password",
          type: SnackType.error);
      return;
    }
    if (confirmController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, "Enter Confirm Password",
          type: SnackType.error);
      return;
    }
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    // getUpdateprofile
    settingRepo
        .setting(chnagesPasswordRequest, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      final result =
          ChnagesPasswordResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        oldpasswordController.clear();
        passwordController.clear();
        confirmController.clear();
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
        LoadingOverlay.of(context).hide();

        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);

        LoadingOverlay.of(context).hide();
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

  Future<void> refreshState(context) async {
    LoadingOverlay.of(context).show();
    oldpasswordController.clear();
    passwordController.clear();
    confirmController.clear();
    LoadingOverlay.of(context).hide();
    notifyListeners();
  }

  ////////////////////
  bool isAppNotificationEnable = true;

  NotificationRepo notificationRepo = NotificationRepo();
  GetSettingRepo getSettingRepo = GetSettingRepo();

  NotificationRequest get notificationRequest =>
      NotificationRequest(notification: isAppNotificationEnable ? "yes" : "no");

  Future<void> changeSettings(context, value) async {
    isAppNotificationEnable = value;
    SharedPreferences pref = await SharedPreferences.getInstance();
    notificationRepo
        .notification(notificationRequest, pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result =
          NotificationResponsemodel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        print(response.body);
        if (bakendNotification == 'no') {
          bakendNotification = 'yes';
        } else {
          bakendNotification = 'no';
        }

        print('switchavl: ${bakendNotification}');
        // if (result.status == 200) {
        // LoadingOverlay.of(context).hide();
        notifyListeners();

        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
      } else {
        // LoadingOverlay.of(context).hide();
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
  ////////////////////////////////////////

  Future<void> shopNotification(context, status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    getSettingRepo.getSetting(pref.getString("successToken")).then((response) {
      print("444444444");
      print(response.body);
      print("444444444");
      final result =
          GetNotificationResponsemodel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        isAppNotificationEnable =
            result.getNotificationData?.notificationStatus == "no"
                ? true
                : false;
        bakendNotification = result.getNotificationData?.notificationStatus;
        print('last: ${bakendNotification}');
        notifyListeners();
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

  bool isLoading = true;

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  AppBarImages appBarImageN = AppBarImages();
  AppBarImage? appBar;
  Future<void> newAppbar(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    appBarImageN.appbar(pref.getString("successToken")).then((response) {
      print(response.body);
      log(response.body);
      final result = AppBarResponseMiodel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        appBar = result.appBar;
        showLoader(false);
        notifyListeners();
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
