class ExistsAddressResponse {
  String? status;
  String? message;

  ExistsAddressResponse({
    this.status,
    this.message,
  });
  ExistsAddressResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}

//////////////////////////////////
class ExistsAddressRequestModel {
  String? loanId;
  String? newAddress;
  ExistsAddressRequestModel({
    this.loanId,
    this.newAddress,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["loan_id"] = loanId;
    data["new_address"] = newAddress;
    return data;
  }
}
