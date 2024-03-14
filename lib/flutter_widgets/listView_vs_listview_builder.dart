import 'package:flutter/material.dart';

class ListsTypes extends StatefulWidget {
  const ListsTypes({Key? key}) : super(key: key);

  @override
  State<ListsTypes> createState() => _ListsTypesState();
}

class _ListsTypesState extends State<ListsTypes> {
  List<Widget> widgets =[

  ];
  @override

  void initState() {
    for(int i=0; i<600; i++){
      widgets.add( const Containers());
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return widgets[index];
        },
      )
    );
  }
}
class Containers extends StatelessWidget {
  const Containers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print( '<Build>');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        width: MediaQuery.of(context).size.width,
        height:700 ,
        child: const Text("SizedBox"),
      ),
    );
  }
}
