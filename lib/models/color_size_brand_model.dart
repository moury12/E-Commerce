class ColorSizeModel {
  String? id;
  String? name;
  String? status;
  bool? selected= false;
  String? createdAt;
  String? updatedAt;

  ColorSizeModel(
      {this.id, this.name, this.status, this.createdAt, this.updatedAt, this.selected});

  ColorSizeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    selected =false;
    status = json['status'].toString()=='null'?'':json['status'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class BrandModel {
  String? id;
  String? name;
  String? image;
  String? status;
  bool? selected= false;
  String? createdAt;
  String? updatedAt;

  BrandModel(
      {this.id,
        this.name,
        this.image,
        this.status,
        this.selected,
        this.createdAt,
        this.updatedAt});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    selected =false;
    image = json['image'].toString()=='null'?'':json['image'].toString();
    status = json['status'].toString()=='null'?'':json['status'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
