import 'package:flutter/material.dart';

class FlutterCompilerPage extends StatefulWidget {
  const FlutterCompilerPage({Key? key}) : super(key: key);

  @override
  State<FlutterCompilerPage> createState() => _FlutterCompilerPageState();
}

class _FlutterCompilerPageState extends State<FlutterCompilerPage> {
  bool view=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            setState(() {
              view=!view;
            });
          }, child: Text("change")),
        ],
      ),
      body:view? FirstConditionPage() :SecondConditionPage(),
    );
  }
}




class FirstConditionPage extends StatelessWidget {

  const FirstConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FirstCondition');
    return const Center(child: Text("FirstCondition "));
  }
}
class SecondConditionPage extends StatelessWidget {
  const SecondConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SecondCondition');

    return const Center(child: Text("SecondCondition"));
  }
}