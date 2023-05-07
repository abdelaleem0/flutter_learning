import 'package:flutter/material.dart';

class MyClass {

}
class MyClass2{
  MyClass myClass =MyClass();
}


class TypeOfFunctions extends StatefulWidget {
  const TypeOfFunctions({Key? key}) : super(key: key);

  @override
  TypeOfFunctionsState createState() => TypeOfFunctionsState();
}

class TypeOfFunctionsState extends State<TypeOfFunctions> {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  genericMethod([1000]);
                  // var x=checked;
                  var y=checked();
                  // print('x${x.runtimeType}');
                  // print('y${y.runtimeType}');
                  // print('add=${ calculate(add, 2, 3)}');
                  // print('subtract=${ calculate(subtract, 5, 2)}');
                },
                child: Text("try $x")),
          ),
        ],
      ),
    );
  }

  T genericMethod<T>(List<T> lst){
    T first = lst[0]; //
    first=1 as T;// Generic type as local variable

    print('yfirst${first}');
    return first;
  }
  checked() {
    setState(() {
      x++;
      print('====================');
    });
    return '';
  }

  int add(int a, int b) {
    return a + b;
  }

  int subtract(int a, int b) {
    return a - b;
  }
  int calculate(int Function(int, int) operation, int a, int b) {
    return operation(a, b);
  }



}
