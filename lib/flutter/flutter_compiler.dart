import 'package:flutter/material.dart';

class FlutterCompiler extends StatefulWidget {
  const FlutterCompiler({Key? key}) : super(key: key);

  @override
  State<FlutterCompiler> createState() => _FlutterCompilerState();
}

class _FlutterCompilerState extends State<FlutterCompiler> {
  bool view=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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