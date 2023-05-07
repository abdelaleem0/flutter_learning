import 'package:equatable/equatable.dart';

class ExampleState extends Equatable {
  final List<int> list;
  final int x;

  const ExampleState( this.list,this.x,);

   ExampleState.initial() : this([],0);

  ExampleState reduce({
    List<int>? list,
    int? x,
  }) {
    return ExampleState( list ??this.list ,x ?? this.x );
  }

  @override
  List<Object?> get props => [list,x];
}
