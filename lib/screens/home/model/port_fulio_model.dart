class PortfolioResponseModel {
  String? status;
  String? message;
  List<PortfolioListData>? portfoliodata;

  PortfolioResponseModel({
    this.status,
    this.message,
    this.portfoliodata,
  });
  PortfolioResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json["data"] != null) {
      portfoliodata = <PortfolioListData>[];
      json["data"].forEach((v) {
        portfoliodata!.add(PortfolioListData.fromJson(v));
      });
    }
  }
}

class PortfolioListData {
  int? id;
  String? portfolioName;

  PortfolioListData({
    this.id,
    this.portfolioName,
  });
  PortfolioListData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    portfolioName = json["portfolio_name"];
  }
}
