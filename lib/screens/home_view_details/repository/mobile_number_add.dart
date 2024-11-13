import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';
import 'package:ydcpl_application/screens/home_view_details/model/add_mobile_number.dart';
import 'package:ydcpl_application/screens/home_view_details/model/mobile_model.dart';

class AddMobileNumberRepo {
  Future<http.Response> mobileAdd(
      AddMobileRequestModel requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.addMobile),
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
