import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ydcpl_application/screens/coc/model/app_bar_model.dart';
import 'package:ydcpl_application/screens/coc/model/coc_model.dart';
import 'package:ydcpl_application/screens/coc/repository/app_bar_repo.dart';
import 'package:ydcpl_application/screens/coc/repository/coc_repo.dart';
import 'package:ydcpl_application/screens/home_view_details/model/add_mobile_number.dart';
import 'package:ydcpl_application/screens/home_view_details/model/add_new_address_model.dart';
import 'package:ydcpl_application/screens/home_view_details/model/address_model.dart';
import 'package:ydcpl_application/screens/home_view_details/model/exists_address_model.dart';
import 'package:ydcpl_application/screens/home_view_details/model/field_visit%20_model.dart';
import 'package:ydcpl_application/screens/home_view_details/model/mobile_logs_model.dart';
import 'package:ydcpl_application/screens/home_view_details/model/mobile_model.dart';
import 'package:ydcpl_application/screens/home_view_details/model/view_details_model.dart';
import 'package:ydcpl_application/screens/home_view_details/repository/add_address_repo.dart';
import 'package:ydcpl_application/screens/home_view_details/repository/address_exists_repo.dart';
import 'package:ydcpl_application/screens/home_view_details/repository/address_list_repo.dart';
import 'package:ydcpl_application/screens/home_view_details/repository/field_visit_repo.dart';
import 'package:ydcpl_application/screens/home_view_details/repository/mobile_list_repo.dart';
import 'package:ydcpl_application/screens/home_view_details/repository/mobile_logs_repo.dart';
import 'package:ydcpl_application/screens/home_view_details/repository/mobile_number_add.dart';
import 'package:ydcpl_application/screens/home_view_details/repository/view_deatils_repo.dart';
import 'package:ydcpl_application/utils/utils.dart';
import 'package:ydcpl_application/widgets/loading_overlay.dart';

class HomeDetailsController extends ChangeNotifier {
  MobileListRepo mobileListRepo = MobileListRepo();
  AddressListRepo addressListRepo = AddressListRepo();
  FieldVisitRepo fieldVisitRepo = FieldVisitRepo();
  AddMobileNumberRepo addMobileNumberRepo = AddMobileNumberRepo();
  ExistsAddressRepo existsAddressRepo = ExistsAddressRepo();
  AddAddressRepo addAddressRepo = AddAddressRepo();
  MobileLogsRepo mobileLogsRepo = MobileLogsRepo();
  ViewDetailsRepo viewDetailsRepo = ViewDetailsRepo();
  TextEditingController addMobileController = TextEditingController();
  TextEditingController newaddressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  ViewDetailsRequestModel get viewDetailsRequestModel =>
      ViewDetailsRequestModel(customerId: customerId, loanId: loanId);

  ExistsAddressRequestModel get existsAddressRequestModel =>
      ExistsAddressRequestModel(
        loanId: loanId,
        newAddress: newaddressController.text,
      );

  Future<void> refreshState(BuildContext context, cId, lid) async {
    viewDeatils(context, cId, lid);
    // await getDispostionCode(context);
    // await getPortfolio(context);
    // await getpostos(context);
    // await getAllList(context, '', '', '', '', '');
    // await newAppbar(context);
    // await getLocation(context);
    notifyListeners();
  }

  // AddNewAddressRequestModel get addNewAddressRequestModel =>
  //     AddNewAddressRequestModel(
  //       loanId: loanId,
  //       address: newaddressController.text,
  //       area: areaController.text,
  //       pincode: pinCodeController.text,
  //     );
  ////////////////////////////////////////////////////
  // AddMobileRequestModel get addMobileRequestModel => AddMobileRequestModel(
  //   longitude: ,
  //   latitude: ,
  //     mobileNumber: addMobileController.text, loanId: loanId);
  bool isLoading = true;
  String? loanId;
  String? customerId;
  List<MobileList>? mobiledata;
  List<AddressList>? addressdata;
  HomeListDetails? homeListDetailsdata;
  // CustomerDetails? customerDetails;

  Future<void> initState(context, cId, lid, pN, pCN) async {
    print("0.1");
    print(pN);
    print(pCN);
    print("0.2");
    await viewDeatils(context, cId, lid);
    newAppbar(context);
    // getCartList(context);
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  MobileRequestModel get mobileRequestModel =>
      MobileRequestModel(loanId: loanId);
  Future<void> getMobilelist(context, lId) async {
    loanId = lId;
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    mobileListRepo
        .mobilelist(mobileRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result = MobileResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        mobiledata = result.mobiledata;
        LoadingOverlay.of(context).hide();
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

  // /////////////////Address//////////////
  Future<void> getAddressList(context, lId) async {
    loanId = lId;
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    addressListRepo
        .addresslist(mobileRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result = AddressListResponse.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        addressdata = result.addressdata;
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

  ////////////////////////////////////View Details/////////////////////
  Future<void> viewDeatils(context, cId, lid) async {
    showLoader(true);
    print("jhkghgdj");
    print(cId);
    print(lid);
    print("jhkghgdj");
    customerId = cId;
    loanId = lid;
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    viewDetailsRepo
        .viewDetails(viewDetailsRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result =
          HomeListDetailsResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        homeListDetailsdata = result.homeListDetailsdata;
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

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggleExpansion(bool expanded) {
    _isExpanded = expanded;
    notifyListeners();
  }

  FieldVisitList? fieldVisitDa;

  //////////////////////////
  Future<void> FieldStatusLog(context, lId) async {
    loanId = lId;
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    fieldVisitRepo
        .fieldVisit(mobileRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result = FiledVisitLogsresponse.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        fieldVisitDa = result.fieldVisitDa;
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

  //////////////////////////
  MobileCallLogsListData? mobileCallLogsListData;

  Future<void> MobileCallListLogs(context, lId) async {
    loanId = lId;
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    mobileLogsRepo
        .mobileLogsList(mobileRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result =
          MobileLogsListResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        mobileCallLogsListData = result.mobileCallLogsListData;
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

  void launchPhone(String mobNumber, context) async {
    var number = Uri.parse("tel:$mobNumber");
    if (await canLaunchUrl(number)) {
      await launchUrl(number);
    } else {
      Utils.showPrimarySnackbar(context, "Unable to dial at the moment",
          type: SnackType.error);
    }
  }

  void openGoogleMaps(String address, context) async {
    LoadingOverlay.of(context).show();

    String encodedAddress = Uri.encodeFull(address);
    final url =
        'https://www.google.com/maps/search/?api=1&query=$encodedAddress';
    if (await canLaunch(url)) {
      await launch(url);
      LoadingOverlay.of(context).hide();
    } else {
      LoadingOverlay.of(context).hide();
      throw 'Could not launch $url';
    }
  }

  /////////////////////////////////////

  //////////////////////////
  Future<void> AddMobileNumber(context, lId, mNumber) async {
    loanId = lId;
    addMobileController = mNumber;
    showLoader(true);
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double latitude = position.latitude;
    double longitude = position.longitude;
    List<Placemark> addresses =
        await placemarkFromCoordinates(latitude, longitude);
    AddMobileRequestModel addMobileRequestModel = AddMobileRequestModel(
        longitude: latitude.toString(),
        latitude: longitude.toString(),
        mobileNumber: addMobileController.text,
        loanId: loanId);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    addMobileNumberRepo
        .mobileAdd(addMobileRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result =
          AddMobileNumberResponse.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        Navigator.pop(context);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
        addMobileController.clear();
        // fieldVisitDa = result.fieldVisitDa;
        showLoader(false);
        notifyListeners();
      } else {
        addMobileController.clear();
        showLoader(false);
        notifyListeners();
        Navigator.pop(context);
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

  //////////////////////////

  Future<void> AddNewAddress(context, lId, nAddress, aAdrres, pCode) async {
    loanId = lId;
    newaddressController = nAddress;
    areaController = aAdrres;
    pinCodeController = pCode;
    showLoader(true);
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double latitude = position.latitude;
    double longitude = position.longitude;
    List<Placemark> addresses =
        await placemarkFromCoordinates(latitude, longitude);
    // AddMobileRequestModel addMobileRequestModel = AddMobileRequestModel(
    // longitude: latitude.toString(),
    // latitude: longitude.toString(),
    //     mobileNumber: addMobileController.text,
    //     loanId: loanId);
    AddNewAddressRequestModel addNewAddressRequestModel =
        AddNewAddressRequestModel(
      longitude: latitude.toString(),
      latitude: longitude.toString(),
      loanId: loanId,
      address: newaddressController.text,
      area: areaController.text,
      pincode: pinCodeController.text,
    );
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    addAddressRepo
        .addressadd(addNewAddressRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result =
          AddNewAddressResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        newaddressController.clear();
        areaController.clear();
        pinCodeController.clear();
        Navigator.pop(context);
        // fieldVisitDa = result.fieldVisitDa;
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
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
  ////////////////////////////////////////////////////////////

  Future<void> checkAddressExist(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    existsAddressRepo
        .existAddressadd(
            existsAddressRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.statusCode);
      log("response.body${response.body}");
      final result = ExistsAddressResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.success);
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
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
  //////////////////////////

  Future<void> checkNumberExist(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    existsAddressRepo
        .existAddressadd(
            existsAddressRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.statusCode);
      log("response.body${response.body}");
      final result = ExistsAddressResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.success);
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
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
