class LoginRequestModel {
  String? emailId;
  String? password;
  // String? fcmToken;
  LoginRequestModel({
    this.emailId,
    this.password,
    // this.fcmToken,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["email"] = emailId;
    data["password"] = password;
    // data["fcm_token"] = fcmToken;
    return data;
  }
}

/////////////////////////////////////////////////////////////////////////////////
class LoginResponseModel {
  String? status;
  String? message;
  LoginData? logindata;
  String? loginId;
  String? userId;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.logindata,
    required this.loginId,
    required this.userId,
  });
  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    loginId = json['login_id'];
    userId = json['user_id'];
    logindata = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }
}

class LoginData {
  String? token;

  LoginData({
    required this.token,
  });
  LoginData.fromJson(Map<String, dynamic> json) {
    token = json["token"];
  }
}
