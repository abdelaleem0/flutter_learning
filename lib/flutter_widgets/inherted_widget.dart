import 'package:flutter/material.dart';

class Tester extends StatefulWidget {
  const Tester({Key? key}) : super(key: key);

  @override
  State<Tester> createState() => _TesterState();
}

class _TesterState extends State<Tester> {
  int x = 20;

  @override
  Widget build(BuildContext context) {
    return InheritedPage(
      x: x,
      child: Scaffold(
        appBar: AppBar(),
        body: Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        x++;
                      });
                    },
                    icon: const Icon(Icons.add)),
                const SecondPage(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        x--;
                      });
                    },
                    icon: const Icon(Icons.remove)),
              ],
            );
          },
        ),
      ),
    );
  }
}

class InheritedPage extends InheritedWidget {
  const InheritedPage(
      { this.x,
        Key? key,
        required Widget child,
      }) : super(key: key, child: child);
  final int? x;

  static InheritedPage of(BuildContext context) {
    final InheritedPage? result =
    context.dependOnInheritedWidgetOfExactType<InheritedPage>();
    assert(result != null, 'No InheritedPage found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedPage oldWidget) {
    return oldWidget != this.x;
  }
}
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedPage(
      child: Center(
        child: Text(InheritedPage.of(context).x.toString()),
      ),
    );
  }
}
