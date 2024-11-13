class SubmitFormResponseModel {
  String? status;
  String? message;

  SubmitFormResponseModel({
    this.status,
    this.message,
  });
  SubmitFormResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}

///////////////////////////////
class SubmitFormRequestModel {
  String? loanId;
  String? executiveFeedBack;
  String? dispoCode;
  String? dispoSubCode;
  String? ptpDate;
  String? paidDate;
  String? paidStatus;
  String? paidAmount;
  String? latitude;
  String? longitude;
  String? attachment;
  SubmitFormRequestModel({
    this.loanId,
    this.executiveFeedBack,
    this.dispoCode,
    this.dispoSubCode,
    this.ptpDate,
    this.paidDate,
    this.paidStatus,
    this.paidAmount,
    this.latitude,
    this.longitude,
    this.attachment,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["loan_id"] = loanId;
    data["executive_feedback"] = executiveFeedBack;
    data["dispo_code"] = dispoCode;
    data["dispo_subcode"] = dispoSubCode;
    data["attachment"] = attachment;
    data["paid_date"] = paidDate;
    data["paid_status"] = paidStatus;
    data["paid_amount"] = paidAmount;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    return data;
  }
}
