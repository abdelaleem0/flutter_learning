import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ModelEntity {
  final String name;
  final int age;
 const ModelEntity(
    this.name,
    this.age,
  );

}



class TestConstKeyWord extends StatefulWidget {
  const TestConstKeyWord({super.key});

  @override
  State<TestConstKeyWord> createState() => _TestConstKeyWordState();
}

class _TestConstKeyWordState extends State<TestConstKeyWord> {

 late final ModelEntity xx;
  @override
  void initState() {

    final ModelEntity x = ModelEntity("ahmed", 12);
    const ModelEntity y =ModelEntity("ahmed", 12);
        xx=const ModelEntity("ahmed", 12);
    print('======${x==y}');
    print('======${xx==y}');
    print('======${xx==x}');

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: const Column(
        children: [
          Text("TestConstKeyWord"),
        ],
      ),
    );
  }
}
