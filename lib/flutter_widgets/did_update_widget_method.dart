import 'package:flutter/material.dart';

class DidUpdatePage extends StatefulWidget {
  bool textValue=true;

   DidUpdatePage({Key? key}) : super(key: key);

  @override
  State<DidUpdatePage> createState() => _DidUpdatePageState();
}

class _DidUpdatePageState extends State<DidUpdatePage> {
@override
void didUpdateWidget(covariant DidUpdatePage oldWidget) {

  print('1234567876');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: InkWell(
        onTap: () {
          setState(() {
            widget.textValue=!widget.textValue;

          });
        },
        child: DidUpdateWidget(
          value:  widget.textValue,
        )
      ),
    );
  }
}
class DidUpdateWidget extends StatefulWidget {
  bool value;
   DidUpdateWidget({Key? key, required this.value}) : super(key: key);

  @override
  State<DidUpdateWidget> createState() => _DidUpdateWidgetState();
}

class _DidUpdateWidgetState extends State<DidUpdateWidget> {
  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }
  @override
  void didUpdateWidget(covariant DidUpdateWidget oldWidget) {
    if (widget.value != oldWidget.value) {
      print('didUpdateWidget');
    }    super.didUpdateWidget(oldWidget);
  }
  @override

  Widget build(BuildContext context) {
    return  Center(
      child: Text(widget.value.toString()),
    );
  }
}
