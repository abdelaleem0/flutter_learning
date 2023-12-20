import 'package:flutter/material.dart';

class SetStateFunctionality extends StatefulWidget {
  const SetStateFunctionality({super.key});

  @override
  State<SetStateFunctionality> createState() => _SetStateFunctionalityState();
}

class _SetStateFunctionalityState extends State<SetStateFunctionality> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.red,
          ),
          FirstChildren(),
          SecondChildren(),
          MaterialButton(onPressed: (){
            setState(() {

            });
          },
          color: Colors.brown),
          ThirdChildren(),
          FourChildren(),
          FiveChildren(),
          SexChildren(),
        ],
      ),
    );
  }
}
class FirstChildren extends StatelessWidget {
  const FirstChildren({super.key});

  @override
  Widget build(BuildContext context) {
    print('=========<FirstChildren>=============');
    return Container(
      height: 200,
      color: Colors.blue,
    );
  }
}
class SecondChildren extends StatelessWidget {
  const SecondChildren({super.key});

  @override
  Widget build(BuildContext context) {
    print('=========<SecondChildren>=============');
    return Container(
      height: 200,
      color: Colors.yellow,
    );
  }
}
class ThirdChildren extends StatelessWidget {
  const ThirdChildren({super.key});

  @override
  Widget build(BuildContext context) {
    print('=========<ThirdChildren>=============');
    return Container(
      height: 200,
      color: Colors.yellow,
    );
  }
}
class FourChildren extends StatelessWidget {
  const FourChildren({super.key});

  @override
  Widget build(BuildContext context) {
    print('=========<FourChildren>=============');
    return Container(
      height: 200,
      color: Colors.yellow,
    );
  }
}
class FiveChildren extends StatelessWidget {
  const FiveChildren({super.key});

  @override
  Widget build(BuildContext context) {
    print('=========<FiveChildren>=============');
    return Container(
      height: 200,
      color: Colors.yellow,
    );
  }
}
class SexChildren extends StatelessWidget {
  const SexChildren({super.key});

  @override
  Widget build(BuildContext context) {
    print('=========<SexChildren>=============');
    return Container(
      height: 200,
      color: Colors.yellow,
    );
  }
}

