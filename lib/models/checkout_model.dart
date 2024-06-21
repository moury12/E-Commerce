class DeliveryChargeModel {
  String? id;
  String? firstCost;
  String? secondCost;
  String? createdAt;
  String? updatedAt;

  DeliveryChargeModel(
      {this.id,
        this.firstCost,
        this.secondCost,
        this.createdAt,
        this.updatedAt});

  DeliveryChargeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    firstCost = json['first_cost'].toString()=='null'?'':json['first_cost'].toString();
    secondCost = json['second_cost'].toString()=='null'?'':json['second_cost'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_cost'] = firstCost;
    data['second_cost'] = secondCost;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}