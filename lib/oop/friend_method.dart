import 'package:flutter/material.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Bar bar =Bar();

    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            bar.consumeDoSomethingSpecial();
            Foo().doSomethingSpecial();
          },

            child: Text("bar${bar.consumeDoSomethingSpecial()}")),
      ),
    );
  }
}
class Foo {
  @protected
   void doSomethingSpecial() {
    print('protectedd');
  }
}

class Bar {
  Foo foo = Foo();

  consumeDoSomethingSpecial() {

    foo.doSomethingSpecial();
  }
}