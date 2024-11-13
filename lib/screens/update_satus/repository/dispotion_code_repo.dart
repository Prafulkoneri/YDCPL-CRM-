import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';
import 'package:ydcpl_application/screens/home/model/home_list_model.dart';

class DispostionCodeRepo {
  Future<http.Response> dispotionCode(token) async {
    try {
      print(Endpoint.getDispositionCode);
      return await http.post(Uri.parse(Endpoint.getDispositionCode), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
