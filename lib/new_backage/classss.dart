import 'package:learning_flutter/oop/friend_method.dart';

class Tester{
  Foo foo = Foo();
   testers(){
    foo.doSomethingSpecial();
  }

}
class Bar {
  Foo foo = Foo();

  consumeDoSomethingSpecial() {

    foo.doSomethingSpecial();
  }
}
