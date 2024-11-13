// import 'package:http/http.dart' as http;
// import 'package:ydcpl_application/network/end_point.dart';
// import 'package:ydcpl_application/screens/home_view_details/model/view_details_model.dart';

// class ViewDetailsRepo {
//   Future<http.Response> viewDetails(
//       ViewDetailsRequestModel reqModel, token) async {
//     try {
//       print(Endpoint.viewDetails);
//       print(reqModel);
//       return await http.post(Uri.parse(Endpoint.viewDetails), headers: {
//         "Authorization": "Bearer $token",
//         // 'Content-Type': 'application/json',
//       });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';

import 'package:ydcpl_application/screens/home_view_details/model/view_details_model.dart';

class ViewDetailsRepo {
  Future<http.Response> viewDetails(
      ViewDetailsRequestModel requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.viewDetails),
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
