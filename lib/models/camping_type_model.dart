class CampingType {
  String? id;
  String? name;
  String? colorCode;

  CampingType({this.id, this.name, this.colorCode});

  CampingType.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    colorCode = json['color_code'].toString()=='null'?'':json['color_code'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color_code'] = colorCode;
    return data;
  }
}
