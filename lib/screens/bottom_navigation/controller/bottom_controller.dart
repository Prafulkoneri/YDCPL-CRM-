// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ydcpl_application/screens/auth/view/login_view.dart';
// import 'package:ydcpl_application/screens/bottom_navigation/model/log_out_model.dart';
// import 'package:ydcpl_application/screens/bottom_navigation/repository/log_out_repo.dart';
// import 'package:ydcpl_application/screens/home/view/home_view.dart';
// import 'package:ydcpl_application/screens/Profile/view/Profile_view.dart';
// import 'package:ydcpl_application/screens/report/view/report_view.dart';
// import 'package:ydcpl_application/screens/setting/view/setting_view.dart';
// import 'package:ydcpl_application/utils/utils.dart';

// class MainScreenController extends ChangeNotifier {
//   int currentIndex = 0;
//   int currentTab = 0;
//   int cartCount = 0;
//   bool stackLoaderVisible = false;
//   Logoutrepo logoutrepo = Logoutrepo();
//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentScreen = const HomePageScreenView(
//       // refreshPage: false,
//       );
//   bool isLocationServiceEnabled = false;
//   bool isPincodeSnackBarVisible = false;
//   String lat = "";
//   String lng = "";
//   String message = "";
//   bool isFirstLoad = true;
//   // LatLng defaultLatLng = const LatLng(18.5679, 73.9143);
//   String cityName = "";
//   String areaName = "";
//   String? loginId = "";
//   String? userID = "";
//   bool locationNotFound = false;
//   bool isLocationFound = false;
//   String locationErrorMessage = "";
//   bool hideBottomNavigation = false;

//   // RemoteMessage? notificationMessage;
//   bool isInititalNotification = false;
// //  pref.setString("loginId", result.loginId ?? "");
// //         pref.setString("userId", result.userId ?? "");
//   void initState(
//     context,
//     index,
//     currentScreen,
//   ) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     loginId = pref.getString("loginId");
//     print("djhsjhfgrg");
//     print(loginId);
//     print("djhsjhfgrg");

//     userID = pref.getString("userId");
//     print("123654");
//     print(userID);
//     print("123654");

//     // navigation(index, currentScreen);
//     // newBudget;
//     // if (isFirstLoad) {
//     //   showMap(context, true);......................................................
//     // }
//     isFirstLoad = false;
//     notifyListeners();
//   }

//   onNavigation(index, screen, context) {
//     currentScreen = screen;
//     currentTab = index;
//     notifyListeners();
//   }

//   ////New///////
//   void getCartCount(count) {
//     // print(cartCount);
//     cartCount = count;
//     notifyListeners();
//   }
// ////

//   void onBottomNavChanged(index) {
//     currentIndex = index;
//     notifyListeners();
//   }

//   showStackLoader(value) {
//     stackLoaderVisible = value;
//     notifyListeners();
//   }

//   void onHomeScreenPressed() {
//     currentTab = 0;
//     currentScreen = const HomePageScreenView(
//         // refreshPage: false,
//         );
//     notifyListeners();
//   }

// ////////////

//   showBottomNavigationBar() {
//     hideBottomNavigation = false;
//     notifyListeners();
//   }

//   hideBottomNavigationBar() {
//     hideBottomNavigation = true;
//     notifyListeners();
//   }

//   void onShopPressed() {
//     currentTab = 1;
//     currentScreen = const ReportViewScreen(
//         // refreshPage: true,ReportViewScreen
//         // isSearchFocus: false,
//         );
//     notifyListeners();
//   }

//   void onOfferPressed() {
//     currentTab = 2;
//     currentScreen = const SettingViewScreen();
//     notifyListeners();
//   }

//   void onAccountPressed(context) async {
//     print("objdddddddect");
//     await logOut(context);
//     // hideBottomNavigationBar();

//     // currentTab = 3;
//     // currentScreen = const LoginViewScreen(
//     //     // isRefreshed: true,
//     //     );
//     notifyListeners();
//   }

//   Future<void> navigation(tabIndex, screenName) async {
//     print("${tabIndex}tabIndex");
//     currentTab = tabIndex;
//     currentScreen = screenName;
//     notifyListeners();
//   }

//   void onDismissTaped() {
//     locationNotFound = false;
//     locationErrorMessage = "";
//     notifyListeners();
//   }

//   LogOutRequestModel get logOutRequestModel =>
//       LogOutRequestModel(userId: userID, loginId: loginId
//           // productId: productId.toString(),
//           );
//   Future<void> logOut(context) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     logoutrepo
//         .logOut(logOutRequestModel, pref.get('successToken'))
//         .then((response) async {
//       log(response.body);
//       debugPrint('/////////////');
//       final result = LogoutResmodel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         pref.clear();
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginViewScreen()),
//         );
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//         //Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ydcpl_application/screens/auth/view/login_view.dart';
import 'package:ydcpl_application/screens/bottom_navigation/model/log_out_model.dart';
import 'package:ydcpl_application/screens/bottom_navigation/repository/log_out_repo.dart';
import 'package:ydcpl_application/screens/coc/view/testing_coc.dart';
import 'package:ydcpl_application/screens/home/view/home_view.dart';
import 'package:ydcpl_application/screens/Profile/view/Profile_view.dart';
import 'package:ydcpl_application/screens/home_view_details/view/home_view_details.dart';
import 'package:ydcpl_application/screens/notification/view/notification_view.dart';
import 'package:ydcpl_application/screens/report/view/report_view.dart';
import 'package:ydcpl_application/screens/setting/view/setting_view.dart';
import 'package:ydcpl_application/utils/utils.dart';

class MainScreenController extends ChangeNotifier {
  int currentIndex = 0;
  int currentTab = 0;
  int cartCount = 0;
  bool stackLoaderVisible = false;
  Logoutrepo logoutrepo = Logoutrepo();
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePageScreenView(
      // refreshPage: false,
      );
  bool isLocationServiceEnabled = false;
  bool isPincodeSnackBarVisible = false;
  String lat = "";
  String lng = "";
  String message = "";
  bool isFirstLoad = true;
  // LatLng defaultLatLng = const LatLng(18.5679, 73.9143);
  String cityName = "";
  String areaName = "";
  String? loginId = "";
  String? userID = "";
  bool locationNotFound = false;
  bool isLocationFound = false;
  String locationErrorMessage = "";
  bool hideBottomNavigation = false;

  // RemoteMessage? notificationMessage;
  bool isInititalNotification = false;
//  pref.setString("loginId", result.loginId ?? "");
//         pref.setString("userId", result.userId ?? "");
  void initState(
    context,
    index,
    currentScreen,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    loginId = pref.getString("loginId");
    print("djhsjhfgrg");
    print(loginId);
    print("djhsjhfgrg");

    userID = pref.getString("userId");
    print("123654");
    print(userID);
    print("123654");

    // navigation(index, currentScreen);
    // newBudget;
    // if (isFirstLoad) {
    //   showMap(context, true);......................................................
    // }
    isFirstLoad = false;
    notifyListeners();
  }

  onNavigation(index, screen, context, [bool? hideBottom]) {
    currentScreen = screen;
    currentTab = index;
    hideBottomNavigation = hideBottom ?? false;
    notifyListeners();
  }

  onCustomVoucherTypeNotification(
      context, customerId, loanId, productName, productCategory) {
    print("hello");
    currentScreen = HomeViewDetailsScreen(
      customerId: customerId,
      loanId: loanId,
      productName: productName,
      productCategoryName: productCategory,
    );
    // const Notificatio0nView(
    //     // isRefresh: true,
    //     // route: "main",
    //     );
    hideBottomNavigation = true;
    notifyListeners();
  }

  ////New///////
  void getCartCount(count) {
    // print(cartCount);
    cartCount = count;
    notifyListeners();
  }
////

  void onBottomNavChanged(index) {
    currentIndex = index;
    notifyListeners();
  }

  showStackLoader(value) {
    stackLoaderVisible = value;
    notifyListeners();
  }

  void onHomeScreenPressed() {
    currentTab = 0;
    currentScreen = const HomePageScreenView(
        // refreshPage: false,
        );
    notifyListeners();
  }

////////////

  showBottomNavigationBar() {
    hideBottomNavigation = false;
    notifyListeners();
  }

  hideBottomNavigationBar() {
    hideBottomNavigation = true;
    notifyListeners();
  }

  void onShopPressed() {
    currentTab = 1;
    currentScreen = const SOrderStatusView(
        // refreshPage: true,ReportViewScreen
        // isSearchFocus: false,
        );
    notifyListeners();
  }

  void onOfferPressed() {
    currentTab = 2;
    currentScreen = const SettingViewScreen();
    notifyListeners();
  }

  void onAccountPressed(context) async {
    print("objdddddddect");
    // await logOut(context);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const EnglishcocScreenView(
                screenName: 'HomePage',
              )),
    );
    // hideBottomNavigationBar();

    // currentTab = 3;
    // currentScreen = const LoginViewScreen(
    //     // isRefreshed: true,
    //     );
    notifyListeners();
  }

  Future<void> navigation(tabIndex, screenName) async {
    print("${tabIndex}tabIndex");
    currentTab = tabIndex;
    currentScreen = screenName;
    notifyListeners();
  }

  void onDismissTaped() {
    locationNotFound = false;
    locationErrorMessage = "";
    notifyListeners();
  }

  LogOutRequestModel get logOutRequestModel =>
      LogOutRequestModel(userId: userID, loginId: loginId
          // productId: productId.toString(),
          );
  Future<void> logOut(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    logoutrepo
        .logOut(logOutRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result = LogoutResmodel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        pref.clear();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginViewScreen()),
        );
        notifyListeners();
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
      } else {
        log(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
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
