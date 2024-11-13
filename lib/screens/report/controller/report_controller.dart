import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ydcpl_application/screens/coc/model/app_bar_model.dart';
import 'package:ydcpl_application/screens/coc/repository/app_bar_repo.dart';
import 'package:ydcpl_application/utils/utils.dart';

class ReportViewController extends ChangeNotifier {
  bool isLoading = false;

  int selectedIndex = 0;
  bool isTabChanged = false;

  void onTabClicked(index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> initState(context, index) async {
    // await getShopOrderList(context);
    await newAppbar(context);
    notifyListeners();
  }

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
