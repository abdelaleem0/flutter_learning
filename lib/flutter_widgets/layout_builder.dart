import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child:  LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
            print('constraints ${constraints.maxHeight}');
            print('MediaQuery  ${MediaQuery.of(context).size.height}');
            print('constraints ${constraints.maxWidth}');
            print('MediaQuery  ${MediaQuery.of(context).size.width}');

            if (constraints.maxWidth >= 480) {
              return const Center(child: Text("Big"));

            }else{
              return const Center(child: Text("Small"));
            }
          },),
        ),
      )
    );
  }
}
