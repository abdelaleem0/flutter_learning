class InputConverter {
  final String? name;
  final String id;

  InputConverter({
     this.name,
    required this.id,
  });

  factory InputConverter.fromInput(InputConverter input) {
    return InputConverter(name: input.name, id: input.id);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'id': id,
      };

  Map<String, dynamic> toJsonWithoutNulls() {
    Map<String, dynamic> newMap = {};
    toJson().forEach((key, value) {
      if (value != null) {
        newMap[key] = value;
      }
    });
    return newMap;
  }
}
