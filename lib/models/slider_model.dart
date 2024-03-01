class BannerModel {
  String? id;
  String? image;
  String? slug;
  String? campNameId;
  String? createdAt;
  String? updatedAt;

  BannerModel(
      {this.id,
        this.image,
        this.slug,
        this.campNameId,
        this.createdAt,
        this.updatedAt});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?"": json['id'].toString();
    image = json['image'].toString()=='null'?"": json['image'].toString();
    slug = json['slug'].toString()=='null'?"": json['slug'].toString();
    campNameId = json['camp_name_id'].toString()=='null'?"": json['camp_name_id'].toString();
    createdAt = json['created_at'].toString()=='null'?"": json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?"": json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['slug'] = slug;
    data['camp_name_id'] = campNameId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class CampaignModel {
  final int? id;
  final String? cpName;
  final String? colorCode;
  final int? status;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  CampaignModel({
     this.id,
     this.cpName,
     this.colorCode,
     this.status,
     this.image,
     this.createdAt,
     this.updatedAt,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'],
      cpName: json['cp_name'],
      colorCode: json['color_code'],
      status: json['status'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
