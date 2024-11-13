class AddMobileNumberResponse {
  String? status;
  String? message;
  String? data;

  AddMobileNumberResponse({
    this.status,
    this.message,
    this.data,
  });
  AddMobileNumberResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
}

//////////////////////////////////
class AddMobileRequestModel {
  String? loanId;
  String? mobileNumber;
  String? latitude;
  String? longitude;
  AddMobileRequestModel({
    this.loanId,
    this.mobileNumber,
    this.latitude,
    this.longitude,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["loan_id"] = loanId;
    data["mobile_number"] = mobileNumber;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    return data;
  }
}
