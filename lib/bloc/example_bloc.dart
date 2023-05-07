import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() :super(ExampleState.initial());

  void setValueOfX() {
    int newValue = state.x;
    List<int> newList = [...state.list];
    newList.add(99);
    print('newValue${newValue.hashCode}');
    print('list in state${state.list.hashCode}');
    emit(state.reduce(list: newList));
    newValue += 100;
    emit(state.reduce(x: newValue));
  }

}