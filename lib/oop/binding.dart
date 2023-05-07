import 'package:flutter/material.dart';

class Binding {


}
class BindingChild extends Binding{

}
class BindingPage extends StatelessWidget {
   BindingPage({Key? key}) : super(key: key);

  final Binding lateBinding =BindingChild(); /// ToDo: this will create in runTime
  final BindingChild earlyBinding =BindingChild();/// ToDo: this will create in compileTime

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 300,
          ),
          Text(lateBinding.toString()),
          Text(earlyBinding.toString()),
        ],
      ),
    );
  }
}
