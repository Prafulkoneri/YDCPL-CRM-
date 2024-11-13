class GetDispositionCodeResponseModel {
  String? status;
  String? message;
  List<DispostionCodeList>? dispostionCodeListData;

  GetDispositionCodeResponseModel({
    this.status,
    this.message,
    this.dispostionCodeListData,
  });
  GetDispositionCodeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json["data"] != null) {
      dispostionCodeListData = <DispostionCodeList>[];
      json["data"].forEach((v) {
        dispostionCodeListData!.add(DispostionCodeList.fromJson(v));
      });
    }
  }
}

class DispostionCodeList {
  int? id;
  String? despositionCode;

  DispostionCodeList({
    this.id,
    this.despositionCode,
  });
  DispostionCodeList.fromJson(Map<String, dynamic> json) {
    despositionCode = json["desposition_code"];
    id = json["id"];
  }
}
