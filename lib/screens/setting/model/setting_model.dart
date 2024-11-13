class ChnagesPasswordResponse {
  String? status;
  String? message;

  ChnagesPasswordResponse({
    required this.status,
    required this.message,
  });
  ChnagesPasswordResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}

/////////////////////
class ChnagesPasswordRequest {
  String? oldPassword;
  String? password;
  String? confirmPassword;
  ChnagesPasswordRequest({
    this.oldPassword,
    this.password,
    this.confirmPassword,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["old_password"] = oldPassword;
    data["password"] = password;
    data["confirm_password"] = confirmPassword;
    return data;
  }
}
