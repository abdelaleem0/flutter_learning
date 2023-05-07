import 'package:flutter/material.dart';

class ExpansionTitleWidget extends StatefulWidget {
  const ExpansionTitleWidget({Key? key}) : super(key: key);

  @override
  ExpansionTitleWidgetState createState() => ExpansionTitleWidgetState();
}

class ExpansionTitleWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    List<String> listOfString = [
      'element =================> 1',
      'element =================> 2',
      'element =================> 3',
      'element =================> 4',
      'element =================> 5',
      'element =================> 6',
      'element =================> 7',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Tile'),
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: const Text('ExpansionTile'),
            children: listOfString.map((data) {
              return ListTile(title: Text(data));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
