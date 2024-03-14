import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learning_flutter/dart_json_converter/dart_to_json.dart';
import 'package:learning_flutter/new_backages/flutter_mobx/counter_store.dart';

class CounterExample extends StatelessWidget {
  const CounterExample(
      {super.key, required this.counterStore, });

  final CounterStore counterStore;

  factory CounterExample.initializeDependency() {
    return CounterExample(counterStore: CounterStore());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Observer(builder: (cnx) {
              return Column(
                children: [
                  Text(
                    '${counterStore.model.count}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'number of click ${counterStore.model.clickNumber}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              );
            }),
            GestureDetector(
                onTap: () {

                  Navigator.push(context,MaterialPageRoute(builder: (context) => SecondPage(
                    counterStore: counterStore,
                  ),));
                },
                child: const Text("to second page ")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counterStore.incrementSpecificNumber(2);

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final CounterStore counterStore;

  const SecondPage({super.key, required this.counterStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon:const Icon( Icons.backspace)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
                builder: (_) => Column(children: [
                  Text(
                    '${counterStore.model.count}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                     'number of click ${counterStore.model.clickNumber}',
                    style: const TextStyle(fontSize: 20),
                  ),

                ],)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counterStore.incrementSpecificNumber(3);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterWithNotifierExample extends StatelessWidget {
  final ValueNotifier<CounterWithoutMobx> _valueNotifier =ValueNotifier(CounterWithoutMobx());

  CounterWithNotifierExample({super.key});

  @override
  Widget build(BuildContext context) {
  // final x=  InputConverter.fromInput(InputConverter( id: '1111111111111')).toJsonWithoutNulls();
  //   print('x ${x}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ValueListenableBuilder<CounterWithoutMobx>(
              valueListenable: _valueNotifier,
              builder: (context, value, child) {
                return  Column(
                  children: [
                    Text(
                      '${_valueNotifier.value.model.count}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'number of click ${_valueNotifier.value.model.clickNumber}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                );
              },
            ),
            GestureDetector(
                onTap: () {

                  Navigator.push(context,MaterialPageRoute(builder: (context) => SecondPageWithNotifier(
                    valueNotifier: _valueNotifier,
                  ),));
                },
                child: const Text("to second page ")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _valueNotifier.value.incrementSpecificNumber(3);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
class SecondPageWithNotifier extends StatelessWidget {
  final ValueNotifier<CounterWithoutMobx> valueNotifier;
  const SecondPageWithNotifier({super.key, required this.valueNotifier});

  @override
  Widget build(BuildContext context) {
    print('SecondPageWithNotifier');
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon:const Icon( Icons.backspace)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<CounterWithoutMobx>(
              valueListenable: valueNotifier,
              builder: (context, value, child) {
                return  Column(
                  children: [
                    Text(
                      '${valueNotifier.value.model.count}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'number of click ${valueNotifier.value.model.clickNumber}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                );
              },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          valueNotifier.value.incrementSpecificNumber(3);

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


