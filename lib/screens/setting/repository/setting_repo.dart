import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';
import 'dart:developer';

import 'package:ydcpl_application/screens/setting/model/setting_model.dart';

class SettingRepo {
  Future<http.Response> setting(ChnagesPasswordRequest reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.setting));
    log("${reqModel.toJson()}");

    try {
      return await http
          .post(Uri.parse(Endpoint.setting), body: reqModel.toJson(), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
