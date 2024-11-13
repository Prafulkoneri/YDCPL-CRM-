import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ydcpl_application/network/end_point.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/coc/model/app_bar_model.dart';
import 'package:ydcpl_application/screens/coc/repository/app_bar_repo.dart';
import 'package:ydcpl_application/screens/home/model/count_model.dart';
import 'package:ydcpl_application/screens/home_view_details/controller/view_details_controller.dart';
import 'package:ydcpl_application/screens/home_view_details/view/home_view_details.dart';
import 'package:ydcpl_application/screens/update_satus/model/dispotion_code_model.dart';
import 'package:ydcpl_application/screens/update_satus/model/getSubCode_model.dart';
import 'package:ydcpl_application/screens/update_satus/model/submit_form_model.dart';
import 'package:ydcpl_application/screens/update_satus/repository/dispotion_code_repo.dart';
import 'package:ydcpl_application/screens/update_satus/repository/sub_code_repo.dart';
import 'package:ydcpl_application/screens/update_satus/repository/submit_form_repo.dart';
import 'package:ydcpl_application/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:ydcpl_application/widgets/loading_overlay.dart';

class UpdateController extends ChangeNotifier {
  DispostionCodeRepo dispostionCodeRepo = DispostionCodeRepo();
  SubCodeRepo subCodeRepo = SubCodeRepo();
  SubmitFormRepo submitFormRepo = SubmitFormRepo();
  List<DispostionCodeList>? dispostionCodeListData;
  List<GetsubCodeList>? getSubcodeList;
  TextEditingController feedBackController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  ExpansionTileController depositionCodeExpansionTileController =
      ExpansionTileController();
  ExpansionTileController depositionSubCodeExpansionTileController =
      ExpansionTileController();

  GetSubCodeRequestModel get getSubCodeRequestModel =>
      GetSubCodeRequestModel(dispoCodeId: dispoCode);
  String? dispoCode = '';
  String? disSubCode = '';
  String? loanId = '';
  String? customerId = '';
  String? paidDate = '';
  String? paidStatus = '';
  // String? ptpDate = '';
  String completeAddress = '';
  String? newCustomer = '';
  String? disname = '';
  bool isRTPSelected = false;
  bool isPTPSelected = false;

  Future<void> initState(
    context,
    loanId,
    customerId,
  ) async {
    print('0.0.');
    print(customerId);
    print('0.0.');
    disSubCode = '';
    disname = '';

    this.newCustomer = customerId;
    await getDispostionCode(context);
    productImage = File("");
    newAppbar(context);
    notifyListeners();
  }

  void onFromDateSelected(date) {
    print(date);
    fromDateController.text = date;
    notifyListeners();
  }

  Future<void> getDispostionCode(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    dispostionCodeRepo
        .dispotionCode(pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result =
          GetDispositionCodeResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        dispostionCodeListData = result.dispostionCodeListData;
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
//////////////////////////////////

  Future<void> selectsubCode(context, subcode) async {
    disSubCode = subcode;
    togglSubCodeExpansion();
    notifyListeners();
  }

//////////////////////////////////////
  Future<void> getSubCode(context, dscode, dsname) async {
    dispoCode = dscode;
    disname = dsname;
    disSubCode = '';
    togglceonExpansion();
    if (dsname == 'RTP') {
      isRTPSelected = true;
      notifyListeners();
    } else {
      isRTPSelected = false;
      notifyListeners();
    }
    if (dsname == 'PTP') {
      isPTPSelected = true;
      notifyListeners();
    } else {
      isPTPSelected = false;
      notifyListeners();
    }

    // showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    subCodeRepo
        .subCode(getSubCodeRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result =
          GetSubCodeResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        getSubcodeList = result.getSubcodeList;
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

  ///////////////////////////////////////////////////
  bool isExpanded = false;

  void toggleExpansion(bool isExpanded) {
    isExpanded = isExpanded;
    notifyListeners();
  }

  void togglceonExpansion() {
    isExpanded = true;
    depositionCodeExpansionTileController.collapse();
    notifyListeners();
  }

  void togglSubCodeExpansion() {
    isExpanded = true;
    depositionSubCodeExpansionTileController.collapse();
    notifyListeners();
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
  // Future<void> subMitFrom(
  //   context,
  //   lId,
  //   feed,
  // ) async {
  //   loanId = lId;

  //   feedBackController = feed;

  //   Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  //   double latitude = position.latitude;
  //   double longitude = position.longitude;

  //   print('Latitude: $latitude, Longitude: $longitude');
  //   SubmitFormRequestModel submitFormRequestModel = SubmitFormRequestModel(
  //       longitude: latitude.toString(),
  //       latitude: longitude.toString(),
  //       paidAmount: amountController.text,
  //       // ptpDate: ptpDate,
  //       paidStatus: paidStatus, //
  //       paidDate: fromDateController.text, //
  //       loanId: loanId, //
  //       executiveFeedBack: feedBackController.text, //
  //       dispoSubCode: disSubCode, //
  //       dispoCode: dispoCode //
  //       );
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   print(pref.getString("successToken"));
  //   submitFormRepo
  //       .submitform(submitFormRequestModel, pref.getString("successToken"))
  //       .then((response) {
  //     print(response.body);
  //     log(response.body);
  //     final result =
  //         SubmitFormResponseModel.fromJson(jsonDecode(response.body));
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       Utils.showPrimarySnackbar(context, result.message,
  //           type: SnackType.success);
  //       notifyListeners();
  //     } else {
  //       Utils.showPrimarySnackbar(context, result.message,
  //           type: SnackType.error);
  //     }
  //   }).onError((error, stackTrace) {
  //       //Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
  //   }).catchError(
  //     (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //     },
  //     test: (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //       return false;
  //     },
  //   );
  // }

  Future<void> subMitFrom(
    context,
    lId,
    feed,
    dsname,
    dsCode,
    datef,
    amountc,
  ) async {
    if (feedBackController.text == "") {
      Utils.showPrimarySnackbar(context, "Please enter feedBack",
          type: SnackType.error);
      return;
    }
    LoadingOverlay.of(context).show();

    loanId = lId;
    feedBackController.text = feed;
    fromDateController.text = datef;
    amountController.text = amountc;
    disSubCode = dsCode;
    disname = dsname;
    uploadImage(context);
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double latitude = position.latitude;
    double longitude = position.longitude;
    List<Placemark> addresses =
        await placemarkFromCoordinates(latitude, longitude);

    if (addresses.isNotEmpty) {
      Placemark firstAddress = addresses.first;
      completeAddress = firstAddress.street ?? '';
      if (firstAddress.subLocality != null)
        completeAddress += ', ${firstAddress.subLocality}';
      if (firstAddress.locality != null)
        completeAddress += ', ${firstAddress.locality}';
      if (firstAddress.administrativeArea != null)
        completeAddress += ', ${firstAddress.administrativeArea}';
      if (firstAddress.country != null)
        completeAddress += ', ${firstAddress.country}';
      if (firstAddress.postalCode != null)
        completeAddress += ' ${firstAddress.postalCode}';
    }

    print('Complete Address: $completeAddress');

    print('Latitude: $latitude, Longitude: $longitude');
    SubmitFormRequestModel submitFormRequestModel = SubmitFormRequestModel(
        attachment: fileImage1.path,
        longitude: latitude.toString(),
        latitude: longitude.toString(),
        paidAmount: amountController.text,
        // ptpDate: ptpDate,
        paidStatus: paidStatus, //
        paidDate: fromDateController.text, //
        loanId: loanId, //
        executiveFeedBack: feedBackController.text, //
        dispoSubCode: disSubCode, //
        dispoCode: dispoCode //
        );
    // LoadingOverlay.of(context).show();

    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    submitFormRepo
        .submitform(submitFormRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      log(response.body);
      final result =
          SubmitFormResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('0.77');
        print(newCustomer);
        print('0.77');

        final read = Provider.of<HomeDetailsController>(context, listen: false);
        read.viewDeatils(context, newCustomer, loanId);

        Navigator.pop(
          context,
          MaterialPageRoute(
              builder: (context) => HomeViewDetailsScreen(
                  customerId: newCustomer, loanId: loanId)),
        );
        feedBackController.clear();
        fromDateController.clear();
        amountController.clear();
        disSubCode = '';
        disname = '';
        disSubCode = '';
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
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

  String networkImage1 = "";
  String fileName1 = "";
  File fileImage1 = File("");
  String image1Type = "";
  void onChooseFile1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );

    if (result != null) {
      networkImage1 = "";
      fileName1 = result.files.first.name;
      print(result.files.single.extension);
      fileImage1 = File(result.files.single.path ?? "");
      if (result.files.single.extension == "pdf") {
        image1Type = "pdf";
      } else {
        image1Type = "jpg";
      }
      uploadImage(context);
      // await uploadDocuments(context, packageId, fileImage1);
      notifyListeners();
    }
  }

  String networkImagecam = "";
  File fileImage1cam = File("");

  void openCameras(context) async {
    final picker = ImagePicker(); // Create an ImagePicker instance
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: double.infinity,
      maxWidth: double.infinity,
      imageQuality: 100,
    );

    if (pickedFile != null) {
      networkImage1 = "";
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
      );
      productImage = File(pickedFile.path);
    }

    notifyListeners();
    // Navigator.of(context, rootNavigator: true).pop();
  }

  File productImage = File("");

  ///////////////////////////////////////

  Future uploadImage(context) async {
    // LoadingOverlay.of(context).show();
    print("888888");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("successToken").toString();
    print(token);
    var uri = Uri.parse(Endpoint.submit);
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = "Bearer $token";
    request.fields['loan_id'] = loanId.toString();
    request.fields['executive_feedback'] = feedBackController.text;
    List<http.MultipartFile> newList = <http.MultipartFile>[];
    File imageFile1 = fileImage1;
    var stream1 = http.ByteStream(imageFile1.openRead());
    var length1 = await imageFile1.length();
    var multipartFile1 = http.MultipartFile("attachment", stream1, length1,
        filename: basename(imageFile1.path));
    newList.add(multipartFile1);
    request.files.addAll(newList);
    print(request.fields);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response.body);
    if (response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('status', 'Uploaded');
      print("object");
      print(response.body);
      print("object");
      // Utils.showPrimarySnackbar(context, "Updated Successfully",
      //     type: SnackType.success);
      // LoadingOverlay.of(context).show();
      notifyListeners();
    } else {
      // LoadingOverlay.of(context).show();
      Utils.showPrimarySnackbar(context, "Error on uploading",
          type: SnackType.error);
      return;
    }
  }
}
