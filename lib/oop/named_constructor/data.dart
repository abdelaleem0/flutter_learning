import 'package:equatable/equatable.dart';
import 'package:learning_flutter/oop/named_constructor/Async.dart';

class Data extends Equatable{
  final Async<UserData> user;

  const Data({required this.user});
  @override
  List<Object?> get props => [user];

}
class UserData extends Equatable{
  final String name;
  final String age ;
  final String id;

  const UserData({required this.name, required this.age, required this.id});
  @override
  List<Object?> get props => [name,age,id];

}