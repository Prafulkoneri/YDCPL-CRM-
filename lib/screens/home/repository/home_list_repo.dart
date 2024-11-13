// // import 'package:http/http.dart' as http;
// // import 'package:ydcpl_application/network/end_point.dart';
// // import 'package:ydcpl_application/screens/home/model/home_list_model.dart';

// // class HomeListRepo {
// //   Future<http.Response> homeList(HomePageScroolResquest reqModel, token) async {
// //     try {
// //       print(Endpoint.homelist);
// //       return await http.post(Uri.parse(Endpoint.homelist), headers: {
// //         "Authorization": "Bearer $token",
// //         'Content-Type': 'application/json',
// //       });
// //     } catch (e) {
// //       throw Exception(e);
// //     }
// //   }
// // }
// import 'package:http/http.dart' as http;
// import 'package:ydcpl_application/network/end_point.dart';
// import 'package:ydcpl_application/screens/home/model/home_list_model.dart';

// class HomeListRepo {
//   Future<http.Response> homeList(
//       HomePageScroolResquest requestModel, token) async {
//     try {
//       print(requestModel.toJson());
//       return await http.post(
//         Uri.parse(Endpoint.homelist),
//         body: requestModel.toJson(),
//         headers: {
//           "Authorization": "Bearer $token",
//         },
//       );
//     } catch (e) {
//       print('I am a exception');
//       print(e);
//       throw Exception();
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';
import 'package:ydcpl_application/screens/home/model/home_list_model.dart';

class HomeListRepo {
  Future<http.Response> homeList(HomePageScroolResquest reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.homelist));
    try {
      return await http.post(Uri.parse(Endpoint.homelist),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
