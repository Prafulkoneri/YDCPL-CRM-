// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ydcpl_application/screens/Profile/model/profile_model.dart';
// import 'package:ydcpl_application/screens/Profile/repository/profile_repo.dart';
// import 'package:ydcpl_application/screens/coc/model/app_bar_model.dart';
// import 'package:ydcpl_application/screens/coc/repository/app_bar_repo.dart';
// import 'package:ydcpl_application/screens/home/model/count_model.dart';
// import 'package:ydcpl_application/screens/home/model/home_list_model.dart';
// import 'package:ydcpl_application/screens/home/model/location_list_model.dart';
// import 'package:ydcpl_application/screens/home/model/port_fulio_model.dart';
// import 'package:ydcpl_application/screens/home/model/postos_model.dart';
// import 'package:ydcpl_application/screens/home/repository/count_repo.dart';
// import 'package:ydcpl_application/screens/home/repository/home_list_repo.dart';
// import 'package:ydcpl_application/screens/home/repository/locationList_repo.dart';
// import 'package:ydcpl_application/screens/home/repository/portfolio_repo.dart';
// import 'package:ydcpl_application/screens/home/repository/postos_repo.dart';
// import 'package:ydcpl_application/screens/update_satus/model/dispotion_code_model.dart';
// import 'package:ydcpl_application/screens/update_satus/repository/dispotion_code_repo.dart';
// import 'package:ydcpl_application/utils/utils.dart';

// class HomeFiltterController extends ChangeNotifier {
//   GetCountRepo getCountRepo = GetCountRepo();
//   HomeListRepo homeListRepo = HomeListRepo();
//   GetPorfolio getPorfolio = GetPorfolio();
//   GetPosTosRepo getPosTosRepo = GetPosTosRepo();
//   LocationListRepo locationListRepo = LocationListRepo();
//   TextEditingController searchController = TextEditingController();
//   bool showPaginationLoader = false;
//   ExpansionTileController portfolioExpansionTileController =
//       ExpansionTileController();
//   ExpansionTileController principleOutExpansionTileController =
//       ExpansionTileController();
//   ExpansionTileController totaloutExpansionTileController =
//       ExpansionTileController();
//   ExpansionTileController depositionCodeExpansionTileController =
//       ExpansionTileController();
//   ExpansionTileController locationExpansionTileController =
//       ExpansionTileController();
//   HomeListdata? homeList;
//   String? dispoCode;
//   String? portfolioId;
//   String? SelectedispoCode;
//   String? SelecteportCode;
//   String? SelectedPortId;
//   String? Selectepostos;
//   String? Selectelocation;
//   String? Selectetos;
//   String? posValue;
//   String? tosValue;
//   String? locsearch;

//   bool isExpanded = false;
//   bool isExpanded1 = false;

//   List<OutstandList>? outstandList;
//   PostosData? postosData;
//   AppBarImages appBarImageN = AppBarImages();
//   AppBarImage? appBar;
//   List<LocationData>? dataLocation;
//   CountData? countdata;
//   int offset = 0;
//   bool isLoading = true;

//   Future<void> initState(context) async {
//     offset = 0;
//     isLoading = true;
//     await getDispostionCode(context);
//     await getPortfolio(context);
//     await getpostos(context);
//     await getLocation(context);
//     notifyListeners();
//   }

//   //////////////////////
//   // HomePageScroolResquest get homePageScroolResquest => HomePageScroolResquest(
//   //     offset: offset.toString() ?? '', search: searchController.text);

//   Future<void> clearFiltter(context) async {
//     // LoadingOverlay.of(context).show();
//     SelectedPortId = 'Select Portfolio';
//     Selectepostos = 'Choose one';
//     Selectetos = 'Choose one';
//     SelectedispoCode = 'Choose one';
//     Selectelocation = 'Enter location';
//     await getAllList(context, '', '', '', '', '');
//     // LoadingOverlay.of(context).hide();
//     notifyListeners();
//   }

//   void toggleExpansion(bool isExpanded) {
//     isExpanded = isExpanded;
//     notifyListeners();
//   }

//   void closeExpansionTile(bool newValue) {
//     print("Closing ExpansionTile"); // Check if this message is printed
//     isExpanded1 = newValue;
//     notifyListeners();
//   }

//   DispostionCodeRepo dispostionCodeRepo = DispostionCodeRepo();
//   List<DispostionCodeList>? dispostionCodeListData;

//   getSubCode(
//     context,
//     dscode,
//   ) {
//     SelectedispoCode = dscode;
//     togglDispostiongExpansion();
//     notifyListeners();
//   }

//   void togglPortfolioExpansion() {
//     isExpanded = true;
//     portfolioExpansionTileController.collapse();
//     notifyListeners();
//   }

//   getPortFolio(context, porCode, poId) {
//     SelecteportCode = porCode;
//     SelectedPortId = poId;
//     togglPortfolioExpansion();
//     notifyListeners();
//   }

//   getpostoss(context, postosvalue) {
//     Selectepostos = postosvalue;
//     togglprincipleExpansion();
//     notifyListeners();
//   }

//   void togglprincipleExpansion() {
//     isExpanded = true;
//     principleOutExpansionTileController.collapse();
//     notifyListeners();
//   }

//   void toggloutstandingExpansion() {
//     isExpanded = true;
//     totaloutExpansionTileController.collapse();
//     notifyListeners();
//   }

//   void togglDispostiongExpansion() {
//     isExpanded = true;
//     depositionCodeExpansionTileController.collapse();
//     notifyListeners();
//   }

//   void togglLocationExpansion() {
//     isExpanded = true;
//     locationExpansionTileController.collapse();
//     notifyListeners();
//   }

//   getlocationid(context, locationfillter) {
//     Selectelocation = locationfillter;
//     togglLocationExpansion();
//     notifyListeners();
//   }

//   gettos(context, tosvalue) {
//     Selectetos = tosvalue;
//     toggloutstandingExpansion();
//     notifyListeners();
//   }

//   Future<void> getDispostionCode(context) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));
//     dispostionCodeRepo
//         .dispotionCode(pref.getString("successToken"))
//         .then((response) {
//       print(response.body);
//       log(response.body);
//       final result =
//           GetDispositionCodeResponseModel.fromJson(jsonDecode(response.body));
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         dispostionCodeListData = result.dispostionCodeListData;
//         notifyListeners();
//       } else {
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

//   List<PortfolioListData>? portfoliodata;

//   Future<void> getPortfolio(context) async {
//     // categoryId = id;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print("kkkkkkkkkk");
//     getPorfolio.getportfolio(pref.getString("successToken")).then((response) {
//       log(response.body);
//       final result = PortfolioResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         portfoliodata = result.portfoliodata;
//         isLoading = false;
//         // showPaginationLoader = false;
//         notifyListeners();
//       } else {
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
//   //////////////////////////////////////

//   Future<void> getpostos(context) async {
//     // categoryId = id;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print("kkkkkkkkkk");
//     getPosTosRepo.getPosTos(pref.getString("successToken")).then((response) {
//       log(response.body);
//       final result = PostosResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         postosData = result.postosData;
//         outstandList = postosData?.outstandList;
//         isLoading = false;
//         notifyListeners();
//       } else {
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

//   // Future<void> newAppbar(context) async {
//   //   // showLoader(true);
//   //   SharedPreferences pref = await SharedPreferences.getInstance();
//   //   print(pref.getString("successToken"));
//   //   appBarImageN.appbar(pref.getString("successToken")).then((response) {
//   //     print(response.body);
//   //     log(response.body);
//   //     final result = AppBarResponseMiodel.fromJson(jsonDecode(response.body));
//   //     print(response.statusCode);
//   //     if (response.statusCode == 200) {
//   //       appBar = result.appBar;
//   //       // showLoader(false);
//   //       notifyListeners();
//   //     } else {
//   //       Utils.showPrimarySnackbar(context, result.message,
//   //           type: SnackType.error);
//   //     }
//   //   }).onError((error, stackTrace) {
//   //       //Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//   //   }).catchError(
//   //     (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //     },
//   //     test: (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //       return false;
//   //     },
//   //   );
//   // }

//   ///////////////////////////////////////////////////////////

//   Future<void> getLocation(context) async {
//     // categoryId = id;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print("kkkkkkkkkk");
//     locationListRepo
//         .listLocation(pref.getString("successToken"))
//         .then((response) {
//       log(response.body);
//       final result =
//           LocationlistResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         dataLocation = result.dataLocation;
//         isLoading = false;
//         notifyListeners();
//       } else {
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
