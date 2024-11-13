import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';

class AppBarImages {
  Future<http.Response> appbar(token) async {
    try {
      print(Endpoint.appBarImage);
      return await http.get(Uri.parse(Endpoint.appBarImage), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
