import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';
import 'package:ydcpl_application/screens/auth/model/login_model.dart';

class LoginRepo {
  Future<http.Response> customerSignIn(LoginRequestModel requestModel) async {
    print(requestModel.toJson());
    try {
      return await http.post(
        Uri.parse(Endpoint.login),
        body: requestModel.toJson(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
