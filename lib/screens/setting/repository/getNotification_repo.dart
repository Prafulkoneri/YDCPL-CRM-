import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';

class GetSettingRepo {
  Future<http.Response> getSetting(token) async {
    try {
      return await http.get(Uri.parse(Endpoint.getNotification), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
