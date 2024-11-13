import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';

class LocationListRepo {
  Future<http.Response> listLocation(token) async {
    try {
      print(Endpoint.getLocationList);
      return await http.get(Uri.parse(Endpoint.getLocationList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
