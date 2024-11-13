class MyProfileResponseModel {
  String? status;
  String? message;
  ProfileData? profiledata;

  MyProfileResponseModel({
    required this.status,
    required this.message,
    required this.profiledata,
  });
  MyProfileResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    profiledata =
        json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }
}

class ProfileData {
  int? id;
  String? email;
  String? employeeName;
  String? employeeEmail;
  String? employeeId;
  String? employeeProfilePhoto;
  String? employeeMobileNo;
  String? employeeArea;
  String? designation;
  String? department;

  ProfileData({
    required this.id,
    required this.email,
    required this.employeeName,
    required this.employeeEmail,
    required this.employeeId,
    required this.employeeProfilePhoto,
    required this.employeeMobileNo,
    required this.employeeArea,
    required this.designation,
    required this.department,
  });
  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    employeeName = json["employee_name"];
    employeeEmail = json["employee_email"];
    employeeId = json["employee_id"];
    employeeProfilePhoto = json["employee_profile_photo"];
    employeeMobileNo = json["employee_mobile_no"];
    employeeArea = json["employee_area"];
    designation = json["designation"];
    department = json["department"];
  }
}
