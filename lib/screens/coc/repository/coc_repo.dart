import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';

class CocViewRepo {
  Future<http.Response> cocView(token) async {
    try {
      print(Endpoint.coc);
      return await http.get(Uri.parse(Endpoint.coc), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
