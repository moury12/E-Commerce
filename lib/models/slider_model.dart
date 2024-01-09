class SliderModel {
  String? id;
  String? bigImage;
  String? smallImage;
  String? createdAt;
  String? updatedAt;

  SliderModel(
      {this.id,
        this.bigImage,
        this.smallImage,
        this.createdAt,
        this.updatedAt});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    bigImage = json['big_image'].toString()=='null'?'':json['big_image'].toString();
    smallImage = json['small_image'].toString()=='null'?'':json['small_image'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['big_image'] = this.bigImage;
    data['small_image'] = this.smallImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
