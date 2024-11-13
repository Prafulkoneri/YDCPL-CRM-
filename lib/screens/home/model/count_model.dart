class HomeCountResponse {
  String? status;
  String? message;
  CountData? countdata;

  HomeCountResponse({
    this.status,
    this.message,
    this.countdata,
  });
  HomeCountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    countdata = json['data'] != null ? CountData.fromJson(json['data']) : null;
  }
}

class CountData {
  int? totalCases;

  CountData({
    this.totalCases,
  });
  CountData.fromJson(Map<String, dynamic> json) {
    totalCases = json["total_cases"];
  }
}
