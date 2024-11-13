import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';

class GetPosTosRepo {
  Future<http.Response> getPosTos(token) async {
    try {
      print(Endpoint.getpostos);
      return await http.get(Uri.parse(Endpoint.getpostos), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
