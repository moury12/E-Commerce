class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? emailVerifiedAt;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<UserAddress>? userAddress;

  UserModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.emailVerifiedAt,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.userAddress});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    firstName = json['first_name'].toString()=='null'?'':json['first_name'].toString();
    lastName = json['last_name'].toString()=='null'?'':json['last_name'].toString();
    phone = json['phone'].toString()=='null'?'':json['phone'].toString();
    email = json['email'].toString()=='null'?'':json['email'].toString();
    emailVerifiedAt = json['email_verified_at'].toString()=='null'?'':json['email_verified_at'].toString();
    status = json['status'].toString()=='null'?'':json['status'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
    if (json['user_address'] != null) {
      userAddress = <UserAddress>[];
      json['user_address'].forEach((v) {
        userAddress!.add(UserAddress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (userAddress != null) {
      data['user_address'] = userAddress!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserAddress {
  String? id;
  String? userId;
  String? bFirstName;
  String? bLastName;
  String? bPhone;
  String? bEmail;
  String? bCityId;
  String? bCityName;
  String? bZoneId;
  String? bZoneName;
  String? bAreaId;
  String? bAreaName;
  String? bAddress;
  String? sFirstName;
  String? sLastName;
  String? sPhone;
  String? sEmail;
  String? sCityId;
  String? sCityName;
  String? sZoneId;
  String? sZoneName;
  String? sAreaId;
  String? sAreaName;
  String? sAddress;
  String? createdAt;
  String? updatedAt;

  UserAddress(
      {this.id,
        this.userId,
        this.bFirstName,
        this.bLastName,
        this.bPhone,
        this.bEmail,
        this.bCityId,
        this.bCityName,
        this.bZoneId,
        this.bZoneName,
        this.bAreaId,
        this.bAreaName,
        this.bAddress,
        this.sFirstName,
        this.sLastName,
        this.sPhone,
        this.sEmail,
        this.sCityId,
        this.sCityName,
        this.sZoneId,
        this.sZoneName,
        this.sAreaId,
        this.sAreaName,
        this.sAddress,
        this.createdAt,
        this.updatedAt});

  UserAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    userId = json['user_id'].toString()=='null'?'':json['user_id'].toString();
    bFirstName = json['b_first_name'].toString()=='null'?'':json['b_first_name'].toString();
    bLastName = json['b_last_name'].toString()=='null'?'':json['b_last_name'].toString();
    bPhone = json['b_phone'].toString()=='null'?'':json['b_phone'].toString();
    bEmail = json['b_email'].toString()=='null'?'':json['b_email'].toString();
    bCityId = json['b_city_id'].toString()=='null'?'':json['b_city_id'].toString();
    bCityName = json['b_city_name'].toString()=='null'?'':json['b_city_name'].toString();
    bZoneId = json['b_zone_id'].toString()=='null'?'':json['b_zone_id'].toString();
    bZoneName = json['b_zone_name'].toString()=='null'?'':json['b_zone_name'].toString();
    bAreaId = json['b_area_id'].toString()=='null'?'':json['b_area_id'].toString();
    bAreaName = json['b_area_name'].toString()=='null'?'':json['b_area_name'].toString();
    bAddress = json['b_address'].toString()=='null'?'':json['b_address'].toString();
    sFirstName = json['s_first_name'].toString()=='null'?'':json['s_first_name'].toString();
    sLastName = json['s_last_name'].toString()=='null'?'':json['s_last_name'].toString();
    sPhone = json['s_phone'].toString()=='null'?'':json['s_phone'].toString();
    sEmail = json['s_email'].toString()=='null'?'':json['s_email'].toString();
    sCityId = json['s_city_id'].toString()=='null'?'':json['s_city_id'].toString();
    sCityName = json['s_city_name'].toString()=='null'?'':json['s_city_name'].toString();
    sZoneId = json['s_zone_id'].toString()=='null'?'':json['s_zone_id'].toString();
    sZoneName = json['s_zone_name'].toString()=='null'?'':json['s_zone_name'].toString();
    sAreaId = json['s_area_id'].toString()=='null'?'':json['s_area_id'].toString();
    sAreaName = json['s_area_name'].toString()=='null'?'':json['s_area_name'].toString();
    sAddress = json['s_address'].toString()=='null'?'':json['s_address'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['b_first_name'] = bFirstName;
    data['b_last_name'] = bLastName;
    data['b_phone'] = bPhone;
    data['b_email'] = bEmail;
    data['b_city_id'] = bCityId;
    data['b_city_name'] = bCityName;
    data['b_zone_id'] = bZoneId;
    data['b_zone_name'] = bZoneName;
    data['b_area_id'] = bAreaId;
    data['b_area_name'] = bAreaName;
    data['b_address'] = bAddress;
    data['s_first_name'] = sFirstName;
    data['s_last_name'] = sLastName;
    data['s_phone'] = sPhone;
    data['s_email'] = sEmail;
    data['s_city_id'] = sCityId;
    data['s_city_name'] = sCityName;
    data['s_zone_id'] = sZoneId;
    data['s_zone_name'] = sZoneName;
    data['s_area_id'] = sAreaId;
    data['s_area_name'] = sAreaName;
    data['s_address'] = sAddress;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
