class LocationlistResponseModel {
  String? status;
  String? message;
  List<LocationData>? dataLocation;

  LocationlistResponseModel({
    this.status,
    this.message,
    this.dataLocation,
  });
  LocationlistResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      dataLocation = <LocationData>[];
      json["data"].forEach((v) {
        dataLocation!.add(LocationData.fromJson(v));
      });
    }
  }
}

class LocationData {
  int? id;
  String? location;

  LocationData({
    this.id,
    this.location,
  });
  LocationData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    location = json["location"];
  }
}
