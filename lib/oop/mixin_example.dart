import 'package:flutter/material.dart';

class Employee{
  // Employee();
  void checkIn(){
    print('check in');
  }
}
mixin Medical{
  // Medical();
  void takeTemperature(){
    print(' my temperature is 37');
  }
}



class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> with Employee , Medical {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton(onPressed: (){
          checkIn();
          takeTemperature();
        }, child: const Text("click")),
      ),
    );
  }
}
