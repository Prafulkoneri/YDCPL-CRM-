import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ydcpl_application/screens/coc/model/app_bar_model.dart';
import 'package:ydcpl_application/screens/coc/model/coc_model.dart';
import 'package:ydcpl_application/screens/coc/repository/app_bar_repo.dart';
import 'package:ydcpl_application/screens/coc/repository/coc_repo.dart';
import 'package:ydcpl_application/utils/utils.dart';

class CocViewController extends ChangeNotifier {
  bool isChecked = false;
  bool isCheckedlog = false;

  void onChecked() async {
    isChecked = !isChecked;
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (isChecked) {
      pref.setBool("hasAgreedToCOC", true);
    } else {
      pref.setBool("hasAgreedToCOC", false);
    }
    notifyListeners();
  }

  void onCheckedlog() async {
    isCheckedlog = !isCheckedlog;
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (isCheckedlog) {
      pref.setBool("hasAgreedToCOClog", true);
    } else {
      pref.setBool("hasAgreedToCOClog", false);
    }
    notifyListeners();
  }

  CocViewRepo cocViewRepo = CocViewRepo();
  AppBarImages appBarImageN = AppBarImages();
  bool isLoading = true;

  Future<void> initState(
    context,
  ) async {
    isChecked = false;
    isCheckedlog = false;
    newAppbar(context);

    getCartList(context);
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  AppBarImage? appBar;

  CocData? cocdata;
  String htmlContentEnglish = ''; // Replace with your HTML string
  String htmlContentHindi = ''; // Replace with your HTML string
  String htmlContentMarathi = ''; // Replace with your HTML string
  Future<void> getCartList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    cocViewRepo.cocView(pref.getString("successToken")).then((response) {
      print(response.body);
      log(response.body);
      final result = CocResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        cocdata = result.cocdata;
        htmlContentEnglish = result.cocdata!.popupTextEng ?? '';
        htmlContentHindi = result.cocdata!.popupTextOther ?? '';
        htmlContentMarathi = result.cocdata!.popupTextMar ?? '';
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

  /////////////////////////////////////////////
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
