import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class AsynchronousExecution extends StatefulWidget {
  const AsynchronousExecution({super.key});

  @override
  State<AsynchronousExecution> createState() => _AsynchronousExecutionState();
}

class _AsynchronousExecutionState extends State<AsynchronousExecution> {
  void function()  {
    print('welcome');
    Future.delayed(const Duration(seconds: 10))
        .then((value) => print('print after 10s'));
    Future.delayed(const Duration(microseconds: 0))
        .then((value) => print('print after 0s'));
    print('end');

  }

  void firstFunction() {
    for (int i = 0; i < 10000; i++) {
      print('for');
    }
    print('print===>>');
  }

  void secondFunction() {
    print('secondFunction');
  }

  void doAllFunction() async {
    firstFunction();
    secondFunction();
  }

  @override
  void initState() {
    function();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          const Center(child: Text("Asynchronous Execution & Multithreading")),
    );
  }
}
