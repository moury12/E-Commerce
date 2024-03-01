class CategoryModel {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.id,
        this.name,
        this.slug,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    slug = json['slug'].toString()=='null'?'':json['slug'].toString();
    image = json['image'].toString()=='null'?'':json['image'].toString();
    status = json['status'].toString()=='null'?'':json['status'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at']
        .toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at']
        .toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
