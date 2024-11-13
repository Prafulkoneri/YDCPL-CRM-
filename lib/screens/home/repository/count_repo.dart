import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';

class GetCountRepo {
  Future<http.Response> countCase(token) async {
    try {
      print(Endpoint.getCount);
      return await http.post(Uri.parse(Endpoint.getCount), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
