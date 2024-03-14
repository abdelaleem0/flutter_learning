class DataModel {
  final String name;
  final String id;
  final String age;
  final Children children;

  DataModel(
      {required this.name,
      required this.id,
      required this.age,
      required this.children});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json["name"],
        id: json["id"],
        age: json["age"],
        children: Children.fromJson(json["children"]));
  }

  factory DataModel.fromInput(DataModel model) {
    return DataModel(
        name: model.name,
        id: model.id,
        age: model.age,
        children: Children.fromInput(model.children));
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "age": age,
        "children": children.toJson(),
      };
}

class Children {
  final String name;
  final String id;
  final bool isBoy;

  Children({required this.name, required this.id, required this.isBoy});

  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(name: json["name"], id: json["id"], isBoy: json["isBoy"]);
  }

  factory Children.fromInput(Children model) {
    return Children(name: model.name, id: model.id, isBoy: model.isBoy);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "isBoy": isBoy,
      };
}
