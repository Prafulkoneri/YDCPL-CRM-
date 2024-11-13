import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';
import 'package:ydcpl_application/screens/bottom_navigation/model/log_out_model.dart';

class Logoutrepo {
  Future<http.Response> logOut(LogOutRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.logOut));
    try {
      return await http
          .post(Uri.parse(Endpoint.logOut), body: reqModel.toJson(), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
