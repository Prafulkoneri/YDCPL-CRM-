import 'package:http/http.dart' as http;
import 'package:ydcpl_application/network/end_point.dart';
import 'package:ydcpl_application/screens/home_view_details/model/add_new_address_model.dart';

class AddAddressRepo {
  Future<http.Response> addressadd(
      AddNewAddressRequestModel requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.addNewAddress),
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
