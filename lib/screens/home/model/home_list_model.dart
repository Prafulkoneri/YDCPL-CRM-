class HomePageScroolResponse {
  String? status;
  String? message;
  HomeListdata? homeList;

  HomePageScroolResponse({
    this.status,
    this.message,
    this.homeList,
  });
  HomePageScroolResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    homeList =
        json['data'] != null ? HomeListdata.fromJson(json['data']) : null;
  }
}

class HomeListdata {
  List<AllocatedDatum>? allocatedData;

  HomeListdata({
    this.allocatedData,
  });
  HomeListdata.fromJson(Map<String, dynamic> json) {
    if (json["allocated_data"] != null) {
      allocatedData = <AllocatedDatum>[];
      json["allocated_data"].forEach((v) {
        allocatedData!.add(AllocatedDatum.fromJson(v));
      });
    }
  }

  void addAll(HomeListdata? homeList) {}
}

class AllocatedDatum {
  int? id;
  String? product;
  String? loanId;
  String? name;
  String? mobileNo1;
  String? totalOs;
  String? emiAmount;
  String? createdAt;
  String? dispostionCode;
  String? productCategoryName;
  String? productName;

  AllocatedDatum({
    this.id,
    this.product,
    this.loanId,
    this.name,
    this.mobileNo1,
    this.totalOs,
    this.emiAmount,
    this.createdAt,
    this.dispostionCode,
    this.productCategoryName,
    this.productName,
  });
  AllocatedDatum.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    product = json["product"];
    loanId = json["loan_id"];
    name = json["name"];
    mobileNo1 = json["mobile_no_1"];
    totalOs = json["total_os"];
    emiAmount = json["emi_amount"];
    createdAt = json["created_at"];
    dispostionCode = json["dispo_code"];
    productCategoryName = json["product_category_name"];
    productName = json["product_name"];
  }
}
////////////////////////////

class HomePageScroolResquest {
  String? offset;
  String? search;
  String? portfolioId;
  String? tosValue;
  String? posValue;
  String? dispoCode;
  String? locationnew;
  HomePageScroolResquest({
    this.offset,
    this.search,
    this.portfolioId,
    this.tosValue,
    this.posValue,
    this.dispoCode,
    this.locationnew,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["offset"] = offset;
    data["search_query"] = search;
    data["portfolio_id"] = portfolioId;
    data["tos_value"] = tosValue;
    data["pos_value"] = posValue;
    data["dispo_code"] = dispoCode;
    data["location"] = locationnew;
    return data;
  }
}
