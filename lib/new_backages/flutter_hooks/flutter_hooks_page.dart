import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FlutterHooksPage extends HookWidget {
  const FlutterHooksPage({super.key});
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> count = useState(1);

    useEffect(() {
      print('<<<<<<<useEffect>>>>>>>==<<<<<<<<initState>>>>>>>>');
      final timer = Timer.periodic(Duration(seconds: 1), (timer) {
        //   count.value=timer.tick;
        // print("Timer is :" + timer.tick.toString());

      });
      return timer.cancel;
    }, []);

    void countIncrement() {
      count.value++;
    }

    void resetCount() {
      count.value = 0;
    }

    void counterDecrease() {
      count.value--;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter_hooks package"),
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "hello hooks count: ${count.value.toString()}",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: countIncrement, icon: Icon(Icons.add)),
              TextButton(
                onPressed: resetCount,
                child: Text(
                  "reset",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              IconButton(
                  onPressed: counterDecrease,
                  icon: Icon(Icons.indeterminate_check_box_outlined)),
            ],
          ),

          // this button to know that the useEffect() work like dispose()
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Text(
              "Click to Navigator",
              style:
                  TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
          ChildrenPage(),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FlutterHooksPage()));
          },
          child: Center(
            child: Text(
              "Click to BacK",
              style:
                  TextStyle(color: Colors.red,fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}

class ChildrenPage extends StatelessWidget {
  const ChildrenPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('=====ChildrenPage========');
    return Container(color: Colors.red,
    height: 200,);
  }
}
