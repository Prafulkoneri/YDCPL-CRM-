import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';

class ProfileRepo {
  Future<http.Response> profile(token) async {
    try {
      print(Endpoint.profile);
      return await http.get(Uri.parse(Endpoint.profile), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
