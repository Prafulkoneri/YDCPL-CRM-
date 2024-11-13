class PostosResponseModel {
  String? status;
  String? message;
  PostosData? postosData;

  PostosResponseModel({
    this.status,
    this.message,
    this.postosData,
  });
  PostosResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    postosData =
        json['data'] != null ? PostosData.fromJson(json['data']) : null;
  }
}

class PostosData {
  List<OutstandList>? outstandList;

  PostosData({
    this.outstandList,
  });
  PostosData.fromJson(Map<String, dynamic> json) {
    if (json["outstand_list"] != null) {
      outstandList = <OutstandList>[];
      json["outstand_list"].forEach((v) {
        outstandList!.add(OutstandList.fromJson(v));
      });
    }
  }
}

class OutstandList {
  String? id;
  String? value;

  OutstandList({
    this.id,
    this.value,
  });
  OutstandList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    value = json["value"];
  }
}
