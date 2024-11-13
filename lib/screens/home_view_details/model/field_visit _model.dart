class FiledVisitLogsresponse {
  String? status;
  String? message;
  FieldVisitList? fieldVisitDa;

  FiledVisitLogsresponse({
    this.status,
    this.message,
    this.fieldVisitDa,
  });
  FiledVisitLogsresponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    fieldVisitDa =
        json['data'] != null ? FieldVisitList.fromJson(json['data']) : null;
  }
}

class FieldVisitList {
  List<CustomerFieldVisit>? customerFieldVisitData;

  FieldVisitList({
    this.customerFieldVisitData,
  });
  FieldVisitList.fromJson(Map<String, dynamic> json) {
    if (json["customer_data"] != null) {
      customerFieldVisitData = <CustomerFieldVisit>[];
      json["customer_data"].forEach((v) {
        customerFieldVisitData!.add(CustomerFieldVisit.fromJson(v));
      });
    }
  }
}

class CustomerFieldVisit {
  int? fieldExecutiveId;
  String? executiveId;
  String? executiveFeedback;
  String? resolutionStatus;
  String? fieldExecutiveName;
  String? createdAt;
  String? createdBy;
  String? createdTime;
  String? dispoCode;
  String? dispoSubcode;
  String? paidDate;
  String? paidAmount;

  CustomerFieldVisit({
    this.fieldExecutiveId,
    this.executiveId,
    this.executiveFeedback,
    this.resolutionStatus,
    this.fieldExecutiveName,
    this.createdAt,
    this.createdTime,
    this.createdBy,
    this.dispoCode,
    this.dispoSubcode,
    this.paidDate,
    this.paidAmount,
  });
  CustomerFieldVisit.fromJson(Map<String, dynamic> json) {
    fieldExecutiveId = json["field_executive_id"];
    executiveId = json["executive_id"];
    executiveFeedback = json["executive_feedback"];
    resolutionStatus = json["resolution_status"];
    fieldExecutiveName = json["field_executive_name"];
    createdBy = json["created_by"];
    createdTime = json["created_time"];
    createdAt = json["created_at"];
    dispoCode = json["dispo_code"];
    dispoSubcode = json["dispo_subcode"];
    paidDate = json["paid_date"];
    paidAmount = json["paid_amount"];
  }
}
