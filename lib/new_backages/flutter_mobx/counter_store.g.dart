// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterStore on _CounterStore, Store {
  late final _$modelAtom = Atom(name: '_CounterStore.model', context: context);

  @override
  Model get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(Model value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$_CounterStoreActionController =
      ActionController(name: '_CounterStore', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementSpecificNumber(int number) {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.incrementSpecificNumber');
    try {
      return super.incrementSpecificNumber(number);
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementSpecificN1umber(int number) {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.decrementSpecificN1umber');
    try {
      return super.decrementSpecificN1umber(number);
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
