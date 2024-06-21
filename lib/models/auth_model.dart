class AuthTokenModel {
  final String token;

  AuthTokenModel({required this.token});
}
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
    id = json['id'].toString()=='null'?'':json['id'];
    firstName = json['first_name'].toString()=='null'?'':json['first_name'];
    lastName = json['last_name'].toString()=='null'?'':json['last_name'];
    phone = json['phone'].toString()=='null'?'':json['phone'];
    email = json['email'].toString()=='null'?'':json['email'];
    emailVerifiedAt = json['email_verified_at'].toString()=='null'?'':json['email_verified_at'];
    status = json['status'].toString()=='null'?'':json['status'];
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'];
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'];
    userAddress= (json['user_address'] as List<dynamic>)
        .map((address) => UserAddress.fromJson(address))
        .toList();
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
    data['user_address'] = userAddress;

    return data;
  }
}
class UserAddress {
  // Define fields for user address here
  // ...

  UserAddress();

factory UserAddress.fromJson(Map<String, dynamic> json) {
// Implement conversion from JSON to UserAddress
// ...

return UserAddress();
}}