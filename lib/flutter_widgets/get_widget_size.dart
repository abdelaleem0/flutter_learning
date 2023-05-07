import 'package:flutter/material.dart';

class Constraints extends StatefulWidget {
  const Constraints({Key? key}) : super(key: key);

  @override
  State<Constraints> createState() => _ConstraintsState();
}

class _ConstraintsState extends State<Constraints> {
 late String x;
  @override
  void initState() {
    super.initState();
  }
  void checked(){
    List<String> x=['ahmed',
    'abdo',
    ''];
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SizedBox(
        height: 300,
        width: 100,
        child: Builder(
          builder: (context) =>
           GestureDetector(
             onTap: (){
               x= context.size.toString();
               print('x=========================>>>>>>>>>>>>>${x}');

             },
             child: const Center(
              child: Text("sdf"),
          ),
           ),
        ),
      ),
    );
  }
}
