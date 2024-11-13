class GetSubCodeResponseModel {
  String? status;
  String? message;
  List<GetsubCodeList>? getSubcodeList;

  GetSubCodeResponseModel({
    this.status,
    this.message,
    this.getSubcodeList,
  });
  GetSubCodeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json["data"] != null) {
      getSubcodeList = <GetsubCodeList>[];
      json["data"].forEach((v) {
        getSubcodeList!.add(GetsubCodeList.fromJson(v));
      });
    }
  }
}

class GetsubCodeList {
  int? id;
  String? despositionSubcode;

  GetsubCodeList({
    this.id,
    this.despositionSubcode,
  });
  GetsubCodeList.fromJson(Map<String, dynamic> json) {
    despositionSubcode = json["desposition_subcode"];
    id = json["id"];
  }
}

///////////////////////////////
class GetSubCodeRequestModel {
  String? dispoCodeId;
  GetSubCodeRequestModel({
    this.dispoCodeId,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["dispo_code_id"] = dispoCodeId;
    return data;
  }
}
