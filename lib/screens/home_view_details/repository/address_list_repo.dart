// import 'package:http/http.dart' as http;
// import 'package:ydcpl_application/network/end_point.dart';
// import 'package:ydcpl_application/screens/home/model/home_list_model.dart';
// import 'package:ydcpl_application/screens/home_view_details/model/mobile_model.dart';

// class AddressListRepo {
//   Future<http.Response> addresslist(MobileRequestModel reqModel, token) async {
//     try {
//       print(Endpoint.customerAddress);
//       return await http.post(Uri.parse(Endpoint.customerAddress), headers: {
//         "Authorization": "Bearer $token",
//         'Content-Type': 'application/json',
//       });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';
import 'package:ydcpl_application/screens/home_view_details/model/mobile_model.dart';

class AddressListRepo {
  Future<http.Response> addresslist(
      MobileRequestModel requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.customerAddress),
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