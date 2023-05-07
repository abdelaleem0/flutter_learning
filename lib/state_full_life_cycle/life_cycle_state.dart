import 'package:equatable/equatable.dart';



// abstract class LifeCycleState{}
// class InitialState extends LifeCycleState{}
// class LoadingState extends LifeCycleState{}
// class SuccessState extends LifeCycleState{}
class LifeCycleState extends Equatable {
   int value;

   LifeCycleState(this.value);
   LifeCycleState.initial():this(0);
  LifeCycleState reduce({
    int? value,
  }) {
    return LifeCycleState(value ?? this.value);
  }

  @override
  List<Object?> get props => [value];
}
