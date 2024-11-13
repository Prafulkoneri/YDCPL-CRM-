class AddNewAddressResponseModel {
  String? status;
  String? message;
  String? data;

  AddNewAddressResponseModel({
    this.status,
    this.message,
    this.data,
  });
  AddNewAddressResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
}

//////////////////////////////////////
class AddNewAddressRequestModel {
  String? loanId;
  String? address;
  String? area;
  String? pincode;
  String? latitude;
  String? longitude;
  AddNewAddressRequestModel({
    this.loanId,
    this.address,
    this.area,
    this.pincode,
    this.latitude,
    this.longitude,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["loan_id"] = loanId;
    data["new_address"] = address;
    data["area"] = area;
    data["pincode"] = pincode;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    return data;
  }
}
