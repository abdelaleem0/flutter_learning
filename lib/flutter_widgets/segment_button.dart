import 'package:flutter/material.dart';

class SegmentButtonPage extends StatefulWidget {
  const SegmentButtonPage({super.key});

  @override
  State<SegmentButtonPage> createState() => _SegmentButtonPageState();
}

class _SegmentButtonPageState extends State<SegmentButtonPage> {
  List<ButtonSegment<Component>> children = [];
  Set<Component> selected = {};

  @override
  void initState() {
    children = [
      const ButtonSegment(
        value: Component(), enabled: false, label: Text("first"),),
      const ButtonSegment(
          value: Component(), enabled: true, label: Text("second")),
      const ButtonSegment(
          value: Component(), enabled: true, label: Text("third")),
      const ButtonSegment(
          value: Component(), enabled: true, label: Text("four")),
    ];
    selected = {children.last.value};

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SegmentedButton(
          segments: children,
          selected: selected,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),),
        ),
      ),
    );
  }
}

class Component extends StatelessWidget {
  const Component({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: const Text('data'),
    );
  }
}
