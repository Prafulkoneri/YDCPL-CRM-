class LogoutResmodel {
  String? status;
  String? message;

  LogoutResmodel({
    required this.status,
    required this.message,
  });
  LogoutResmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}

/////////////////////////////Request/////////////////////////////////////
class LogOutRequestModel {
  String? loginId;
  String? userId;
  LogOutRequestModel({
    this.loginId,
    this.userId,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["login_id"] = loginId;
    data["user_id"] = userId;
    return data;
  }
}
