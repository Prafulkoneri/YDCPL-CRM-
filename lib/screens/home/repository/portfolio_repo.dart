import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';

class GetPorfolio {
  Future<http.Response> getportfolio(token) async {
    try {
      print(Endpoint.getportfolio);
      return await http.get(Uri.parse(Endpoint.getportfolio), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
