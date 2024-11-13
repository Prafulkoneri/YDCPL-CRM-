class AddressListResponse {
  String? status;
  String? message;
  List<AddressList>? addressdata;

  AddressListResponse({
    this.status,
    this.message,
    this.addressdata,
  });
  AddressListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json["data"] != null) {
      addressdata = <AddressList>[];
      json["data"].forEach((v) {
        addressdata!.add(AddressList.fromJson(v));
      });
    }
  }
}

class AddressList {
  String? address;
  String? area;
  String? pincode;
  String? createdType;

  AddressList({
    this.address,
    this.area,
    this.pincode,
    this.createdType,
  });
  AddressList.fromJson(Map<String, dynamic> json) {
    address = json["address"];
    area = json["area"];
    pincode = json["pincode"];
    createdType = json["created_by"];
  }
}
