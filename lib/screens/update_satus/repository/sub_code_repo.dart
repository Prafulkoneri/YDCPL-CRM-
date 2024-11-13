import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';
import 'package:ydcpl_application/screens/update_satus/model/getSubCode_model.dart';

class SubCodeRepo {
  Future<http.Response> subCode(
      GetSubCodeRequestModel requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.subCode),
        body: requestModel.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
    } catch (e) {
      print('I am a exception');
      print(e);
      throw Exception();
    }
  }
}
