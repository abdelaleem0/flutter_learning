class A {
  final String name;
  final String age;

  A({required this.name, required this.age});

  bool isUserDeveloper() {
    if(name=='Abdelaleem'){
      return true;
    }
    return false;

  }
}

class B {
 late final A objectA;

 void getUser(String name ){
   objectA=A(name: name, age: '');

 }
 void checker(){
   objectA.isUserDeveloper();
 }

}
