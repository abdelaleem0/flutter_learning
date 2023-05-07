import 'package:flutter/material.dart';
import 'package:learning_flutter/oop/named_constructor/Async.dart';
import 'package:learning_flutter/oop/named_constructor/data.dart';

class AsyncPage extends StatefulWidget {
  const AsyncPage({Key? key}) : super(key: key);

  @override
  AsyncPageState createState() => AsyncPageState();
}

class AsyncPageState extends State<AsyncPage> {
  final Data state = const Data(
      user: Async.success(UserData(
    age: '20',
    id: '1',
    name: 'ahmed',
  )));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          state.user.data?.age.toString() ??''
        ),
      ),
    );
  }
}
