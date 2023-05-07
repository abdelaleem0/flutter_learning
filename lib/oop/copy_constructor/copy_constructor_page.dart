import 'package:flutter/material.dart';
import 'package:learning_flutter/oop/copy_constructor.dart';

class CopyConstructorPage extends StatefulWidget {
  const CopyConstructorPage({Key? key}) : super(key: key);

  @override
  State<CopyConstructorPage> createState() => _CopyConstructorPageState();
}

class _CopyConstructorPageState extends State<CopyConstructorPage> {
  final CopyConstructor _copyConstructor1= const CopyConstructor("Ahmed" , 24);
 late final CopyConstructor _copyConstructor2= CopyConstructor.copy(_copyConstructor1);

  @override
  void initState() {
    if (_copyConstructor1==_copyConstructor2) {
      print('true ===============');
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("new object ${_copyConstructor1.name}"),
          ),
           Padding(
            padding: const EdgeInsets.all(20.0),
             child: Text("second object ${_copyConstructor2.name}"),
          ),
          IconButton(onPressed: (){

          }, icon: Icon(Icons.add)),
        ],

      ),
    );
  }
}
