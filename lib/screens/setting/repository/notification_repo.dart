import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';
import 'package:ydcpl_application/screens/setting/model/notification_model.dart';
import 'dart:developer';

import 'package:ydcpl_application/screens/setting/model/setting_model.dart';

class NotificationRepo {
  Future<http.Response> notification(
      NotificationRequest reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.notification));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.notification),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
