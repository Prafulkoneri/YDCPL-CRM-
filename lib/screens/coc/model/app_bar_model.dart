class AppBarResponseMiodel {
  String? status;
  String? message;
  AppBarImage? appBar;

  AppBarResponseMiodel({
    required this.status,
    required this.message,
    required this.appBar,
  });
  AppBarResponseMiodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    appBar = json['data'] != null ? AppBarImage.fromJson(json['data']) : null;
  }
}

class AppBarImage {
  String? imageAppBar;
  String? nameAppBar;

  AppBarImage({
    required this.imageAppBar,
    required this.nameAppBar,
  });
  AppBarImage.fromJson(Map<String, dynamic> json) {
    imageAppBar = json["app_bar_image"];
    nameAppBar = json["bank_name"];
  }
}
