class MobileRequestModel {
  String? loanId;
  MobileRequestModel({
    this.loanId,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["loan_id"] = loanId;
    return data;
  }
}

////////////////////////////////////////////RESPONSE////////////////
class MobileResponseModel {
  String? status;
  String? message;
  List<MobileList>? mobiledata;

  MobileResponseModel({
    this.status,
    this.message,
    this.mobiledata,
  });
  MobileResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      mobiledata = <MobileList>[];
      json["data"].forEach((v) {
        mobiledata!.add(MobileList.fromJson(v));
      });
    }
  }
}

class MobileList {
  String? mobileNo;
  String? createdType;

  MobileList({
    this.mobileNo,
    this.createdType,
  });
  MobileList.fromJson(Map<String, dynamic> json) {
    mobileNo = json["mobile_no"];
    createdType = json["created_by"];
  }
}
