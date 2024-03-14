// counter_store.dart
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  Model model =const Model(count: 0, clickNumber: 0);


  @action
  void increment() {
    model.modify(clickNumber: model.count+1);
  }

  @action
  void decrement() {
    model.modify(clickNumber: model.count-1);
  }
  @action
void incrementSpecificNumber(int number){
    model=model.modify(count: model.count+number,
    clickNumber: model.clickNumber+1);

  }
  @action
  void decrementSpecificN1umber(int number){
    model=model.modify(count: model.count-number);
    model=model.modify(clickNumber: model.count-number);
  }
}




class CounterWithoutMobx {
  Model model =const Model(count: 0, clickNumber: 0);

  void increment() {
    model.modify(clickNumber: model.count+1);

  }

  void decrement() {
    model.modify(clickNumber: model.count-1);
  }
  void incrementSpecificNumber(int number){
    print('before ${model.count}');
    model=model.modify(count: model.count+number,
        clickNumber: model.clickNumber+1);
    print('after ${model.count}');

  }
  void decrementSpecificN1umber(int number){
    model=model.modify(count: model.count-number);
    model=model.modify(clickNumber: model.count-number);
  }
}


class Model extends Equatable{
  final int count ;
  final int clickNumber;

  const Model({required this.count, required this.clickNumber});


  Model modify({
    int? count ,
    int? clickNumber,
}){
    return Model(count: count??this.count, clickNumber: clickNumber??this.clickNumber);
  }

  @override
  List<Object?> get props => [count,clickNumber];
}
