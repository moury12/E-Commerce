
import 'package:get/get.dart';

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
class MultilevelCategoryModel {
  String? id;
  String? name;
  String? slug;
  RxBool? selected =false.obs;
  List<SubItems>? subItems;

  MultilevelCategoryModel({this.id, this.name, this.slug, this.subItems,this.selected});

  MultilevelCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    slug = json['slug'].toString()=='null'?'':json['slug'].toString();
    selected =false.obs;
    if (json['sub_items'] != null) {
      subItems = <SubItems>[];
      json['sub_items'].forEach((v) {
        subItems!.add(SubItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (subItems != null) {
      data['sub_items'] = subItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubItems {
  String? id;
  String? categoryId;
  String? name;
  String? slug;
  RxBool? selected =false.obs;

  List<SubItems>? subSubItems;

  SubItems({this.id, this.categoryId, this.name, this.slug, this.subSubItems,this.selected});

  SubItems.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    categoryId = json['category_id'].toString()=='null'?'':json['category_id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    slug = json['slug'].toString()=='null'?'':json['slug'].toString();
    selected = false.obs;
    if (json['sub_sub_items'] != null) {
      subSubItems = <SubItems>[];
      json['sub_sub_items'].forEach((v) {
        subSubItems!.add(SubItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['slug'] = slug;
    if (subSubItems != null) {
      data['sub_sub_items'] = subSubItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
