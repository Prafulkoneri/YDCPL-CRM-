class ExistsMobileResponse {
  String? status;
  String? message;

  ExistsMobileResponse({
    this.status,
    this.message,
  });
  ExistsMobileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}

//////////////////////////////////
class ExistsMobileRequestModel {
  String? loanId;
  String? mobileNumber;
  ExistsMobileRequestModel({
    this.loanId,
    this.mobileNumber,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["loan_id"] = loanId;
    data["mobile_no"] = mobileNumber;
    return data;
  }
}
