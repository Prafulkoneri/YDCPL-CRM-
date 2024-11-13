import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ydcpl_application/screens/coc/model/app_bar_model.dart';
import 'package:ydcpl_application/screens/coc/repository/app_bar_repo.dart';
import 'package:ydcpl_application/screens/script/model/screpit_model.dart';
import 'package:ydcpl_application/screens/script/repository/scrept_repo.dart';
import 'package:ydcpl_application/utils/utils.dart';
import 'package:ydcpl_application/widgets/loading_overlay.dart';

class ScriptController extends ChangeNotifier {
  ScriptRepo scriptRepo = ScriptRepo();
  bool isLoading = true;
  String? scriptId;
  String? scriptName = '';
  ExpansionTileController depositionCodeExpans55ionTileController =
      ExpansionTileController();

  void toggleExpansion(bool isExpanded) {
    isExpanded = isExpanded;
    notifyListeners();
  }

  bool isExpanded = false;

  void togglceonExpansion() {
    isExpanded = true;
    depositionCodeExpans55ionTileController.collapse();
    notifyListeners();
  }

  ddadf(context, postosvalue) {
    scriptName = postosvalue;
    togglceonExpansion();
    notifyListeners();
  }
  // Future<void> selectCategories(context, sId) async {
  //   scriptId = sId;
  //   togglceonExpansion();
  //   notifyListeners();
  // }

  ScriptRequestModel get scriptRequestModel => ScriptRequestModel(
        scriptCategoryId: scriptId ?? '',
      );
  Future<void> initState(context, sId, sName) async {
    await scriptDetails(context, sId, sName);
    newAppbar(context);
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

  ScriptData? scriptData;
  List<Script>? script;
  List<ScriptCategorys>? scriptCategories;

  Future<void> scriptDetails(context, sId, sName) async {
    scriptId = sId;
    scriptName = sName;
    // togglceonExpansion();
    showLoader(true);
    // LoadingOverlay.of(context).show();

    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    scriptRepo
        .scriptData(scriptRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result = ScriptResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        scriptData = result.scriptData;
        script = scriptData?.script;
        scriptCategories = scriptData?.scriptCategories ?? [];
        // LoadingOverlay.of(context).hide();

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
