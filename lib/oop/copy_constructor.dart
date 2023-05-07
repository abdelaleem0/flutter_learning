import 'package:equatable/equatable.dart';

class CopyConstructor extends Equatable{
  final String name;
  final  int age;

  const CopyConstructor(this.name, this.age);
  CopyConstructor.copy(CopyConstructor other) :this(
    other.name,
    other.age,
  );

  @override
  List<Object?> get props =>[name ,age];
}