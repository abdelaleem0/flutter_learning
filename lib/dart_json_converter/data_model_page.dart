import 'package:flutter/material.dart';
import 'package:learning_flutter/dart_json_converter/json_to_dart.dart';

class DataModelPage extends StatefulWidget {
  const DataModelPage({super.key});

  @override
  State<DataModelPage> createState() => _DataModelPageState();
}

class _DataModelPageState extends State<DataModelPage> {
  late final DataModel model;
  Map<String, dynamic> map = {
    "id": "1",
    "name": "Abdelaleem",
    "age": "25",
    "children": {
      "id": "2",
      "name": "Medo",
      "isBoy": true,
    },
  };
  late Map<String, dynamic> map2;

  @override
  void initState() {
    model = DataModel.fromJson(map);
    map2 = DataModel.fromInput(model).toJson();

    print('map2===${map2}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(model.id),
            Text(model.name),
            Text(model.age),
            Text(model.children.name),
            Text(model.children.id),
            Text(model.children.isBoy.toString()),
          ],
        ),
      ),
    );
  }
}
