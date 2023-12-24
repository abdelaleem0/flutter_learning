class ApiParentModel {
  ApiData? apiData;

  ApiParentModel({this.apiData});

  factory ApiParentModel.jsonToDart(Map<String, dynamic> json) {
    return ApiParentModel(apiData: ApiData.jsonToDart(json));
  }
}

class ApiData {
  ApiParent? data;

  int? code;

  bool? success;
  String? message;

  ApiData({this.data, this.code, this.message, this.success});

  factory ApiData.jsonToDart(Map<String, dynamic> json) {
    return ApiData(
      data: ApiParent.jsonToDart(json),
      code: json["code"],
      message: json["message"],
      success: json["success"],
    );
  }
}

class ApiParent {
  String? name;

  int? age;

  bool? isMarried;

  ApiParent({this.name, this.age, this.isMarried});

  factory ApiParent.jsonToDart(Map<String, dynamic> json) {
    return ApiParent(
        name: json["name"], age: json["age"], isMarried: json["isMarried"]);
  }
}
