class GetNotificationResponsemodel {
  String? status;
  String? message;
  GetNotificationData? getNotificationData;

  GetNotificationResponsemodel({
    required this.status,
    required this.message,
    required this.getNotificationData,
  });
  GetNotificationResponsemodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    getNotificationData = json['data'] != null
        ? GetNotificationData.fromJson(json['data'])
        : null;
  }
}

class GetNotificationData {
  int? id;
  String? notificationStatus;

  GetNotificationData({
    required this.id,
    required this.notificationStatus,
  });
  GetNotificationData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    notificationStatus = json["notification_status"];
  }
}
