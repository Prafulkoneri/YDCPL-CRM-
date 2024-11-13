class HomeListDetailsResponseModel {
  String? status;
  String? message;
  HomeListDetails? homeListDetailsdata;

  HomeListDetailsResponseModel({
    this.status,
    this.message,
    this.homeListDetailsdata,
  });
  HomeListDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    homeListDetailsdata =
        json['data'] != null ? HomeListDetails.fromJson(json['data']) : null;
  }
}

class HomeListDetails {
  CustomerDetails? customerDetails;

  HomeListDetails({
    this.customerDetails,
  });
  HomeListDetails.fromJson(Map<String, dynamic> json) {
    customerDetails = json['customer_details'] != null
        ? CustomerDetails.fromJson(json['customer_details'])
        : null;
  }
}

class CustomerDetails {
  String? customerName;
  String? loanId;
  String? product;
  String? principalOs;
  String? totalOs;
  String? lastPaymentDate;
  String? lastPayment;
  String? cycleDate;
  String? dueAmount;
  String? dueDate;
  String? createdAt;
  int? customerId;
  String? productCategoryName;
  String? productName;
  String? dispSubcode;
  String? dispoCode;
  String? paidDate;
  String? paidAmount;

  CustomerDetails({
    this.customerName,
    this.loanId,
    this.product,
    this.principalOs,
    this.totalOs,
    this.lastPaymentDate,
    this.lastPayment,
    this.cycleDate,
    this.dueAmount,
    this.dueDate,
    this.createdAt,
    this.customerId,
    this.productCategoryName,
    this.productName,
    this.dispoCode,
    this.dispSubcode,
  });
  CustomerDetails.fromJson(Map<String, dynamic> json) {
    customerName = json["customer_name"];
    loanId = json["loan_id"];
    product = json["product"];
    principalOs = json["principal_os"];
    totalOs = json["total_os"];
    lastPaymentDate = json["last_payment_date"];
    lastPayment = json["last_payment"];
    cycleDate = json["cycle_date"];
    dueAmount = json["due_amount"];
    dueDate = json["due_date"];
    createdAt = json["created_at"];
    customerId = json["customer_id"];
    productCategoryName = json["product_category_name"];
    productName = json["product_name"];
    dispoCode = json["dispo_code"];
    dispSubcode = json["dispo_subcode"];
  }
}

/////////////////////////////////Request//////////////
class ViewDetailsRequestModel {
  String? loanId;
  String? customerId;
  ViewDetailsRequestModel({
    this.loanId,
    this.customerId,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["loan_id"] = loanId;
    data["customer_id"] = customerId;
    return data;
  }
}
