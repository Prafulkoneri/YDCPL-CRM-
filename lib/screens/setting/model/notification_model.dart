class NotificationResponsemodel {
  String? status;
  String? message;

  NotificationResponsemodel({
    required this.status,
    required this.message,
  });
  NotificationResponsemodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}

///////////////////////////////////////////////////////
class NotificationRequest {
  String? notification;

  NotificationRequest({
    this.notification,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["notification_status"] = notification;
    return data;
  }
}
