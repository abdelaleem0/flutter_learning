
import 'package:flutter_bloc/flutter_bloc.dart';

part 'life_cycle_state.dart';

class LifeCycleCubit extends Cubit<LifeCycleCubitState> {
  LifeCycleCubit() : super(LifeCycleCubitInitial()){
    cubitInitState();
  }
}
void cubitInitState(){
  print('Cubit initial state');
}
