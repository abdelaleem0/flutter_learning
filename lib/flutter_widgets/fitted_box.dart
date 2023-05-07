import 'package:flutter/material.dart';

class FittedBoxPage extends StatelessWidget {
  const FittedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ToDo : if you remove fittedBox the page will throw Overflow
          FittedBox(
            child: Card(
              color: Colors.white,
              child: Row(
                children: [
                  const Text(
                    "Understand Without FittedBox",
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  ),
                  Image.asset("assets/download_image.jpeg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
