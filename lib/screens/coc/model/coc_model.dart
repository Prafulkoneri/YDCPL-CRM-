class CocResponseModel {
  String? status;
  String? message;
  CocData? cocdata;

  CocResponseModel({
    required this.status,
    required this.message,
    required this.cocdata,
  });
  CocResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    cocdata = json['data'] != null ? CocData.fromJson(json['data']) : null;
  }
}

class CocData {
  String? popupTextEng;
  String? popupTextMar;
  String? popupTextOther;

  CocData({
    required this.popupTextEng,
    required this.popupTextMar,
    required this.popupTextOther,
  });
  CocData.fromJson(Map<String, dynamic> json) {
    popupTextEng = json["popup_text_eng"];
    popupTextMar = json["popup_text_mar"];
    popupTextOther = json["popup_text_other"];
  }
}
