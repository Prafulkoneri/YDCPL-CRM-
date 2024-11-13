class MobileLogsListResponseModel {
  String? status;
  String? message;
  MobileCallLogsListData? mobileCallLogsListData;

  MobileLogsListResponseModel({
    this.status,
    this.message,
    this.mobileCallLogsListData,
  });
  MobileLogsListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    mobileCallLogsListData = json['data'] != null
        ? MobileCallLogsListData.fromJson(json['data'])
        : null;
  }
}

class MobileCallLogsListData {
  List<CustomercallLogsData>? customerCallLogsData;

  MobileCallLogsListData({
    this.customerCallLogsData,
  });
  MobileCallLogsListData.fromJson(Map<String, dynamic> json) {
    if (json["customer_data"] != null) {
      customerCallLogsData = <CustomercallLogsData>[];
      json["customer_data"].forEach((v) {
        customerCallLogsData!.add(CustomercallLogsData.fromJson(v));
      });
    }
  }
}

class CustomercallLogsData {
  String? loanId;
  String? phoneNo;
  String? dialedFrom;
  String? dispositionCode;
  String? dispositionSubCode;
  String? callDate;
  String? feedbackDetails;
  String? attachmentFile;
  String? createdAt;
  String? createdBy;

  CustomercallLogsData({
    this.loanId,
    this.phoneNo,
    this.dialedFrom,
    this.dispositionCode,
    this.dispositionSubCode,
    this.callDate,
    this.feedbackDetails,
    this.attachmentFile,
    this.createdAt,
    this.createdBy,
  });
  CustomercallLogsData.fromJson(Map<String, dynamic> json) {
    loanId = json["loan_id"]; //
    phoneNo = json["phone_no"]; //
    dialedFrom = json["dialed_from"]; //
    dispositionCode = json["disposition_code"]; //
    dispositionSubCode = json["disposition_sub_code"]; //
    feedbackDetails = json["feedback_details"]; //
    attachmentFile = json["attachment_file"]; //
    createdBy = json["created_by"]; //
    callDate = json["call_date"]; //
    createdAt = json["created_at"]; //
  }
}
