import 'package:bloc/bloc.dart';
import 'package:learning_flutter/state_full_life_cycle/life_cycle_state.dart';


class LifeCycleCubit extends Cubit<LifeCycleState> {
  LifeCycleCubit() : super( LifeCycleState.initial());



int x=10;
  void add(){
    x+=122;
    emit(state.reduce(value: x));
  }
}
