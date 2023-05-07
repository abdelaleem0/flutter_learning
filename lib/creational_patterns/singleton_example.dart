import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SingletonClass {
  int singletonCount = 0;
  static final SingletonClass _singleton = SingletonClass._();

  static SingletonClass get instance => _singleton;

  Future<int> incrementCount() async {
    singletonCount = singletonCount + 1;
    return singletonCount;
  }

  SingletonClass._();
}

class SingletonPage extends StatefulWidget {
  const SingletonPage({Key? key}) : super(key: key);

  @override
  State<SingletonPage> createState() => _SingletonPageState();
}

class _SingletonPageState extends State<SingletonPage> {
  final SingletonClass singletonObject1 = SingletonClass.instance;
  final SingletonClass singletonObject2 = SingletonClass.instance;

  Future<int> functionOne() {
    return singletonObject1.incrementCount();
  }

  Future<int> functionTwo() {
    return singletonObject2.incrementCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
              onTap: () {
                functionOne();
                if (kDebugMode) {
                  print(
                    'singleton Object Value=====================>${singletonObject1.singletonCount}');
                }

                functionTwo();
                if (kDebugMode) {
                  print(
                    'singleton Object Value=====================>${singletonObject1.singletonCount}');
                }
              },
              child: const Text("Singleton Example"))),
    );
  }
}
