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
          }, child: const Text("setState",style: TextStyle(
            color: Colors.yellow
          ),)),
        ],
      ),
      body:view ? const FirstConditionPage():const SecondConditionPage(),
    );
  }
}




class FirstConditionPage extends StatelessWidget {

  const FirstConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('First Condition');
    return const Center(child: Text("First Condition "));
  }
}
class SecondConditionPage extends StatelessWidget {
  const SecondConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Second Condition');

    return const Center(child: Text("Second Condition"));
  }
}