import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/state_full_life_cycle/life_cycle_cubit.dart';
import 'package:learning_flutter/state_full_life_cycle/life_cycle_state.dart';

class ParentPage extends StatelessWidget {
  const ParentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FirstLifeCyclePage();
  }
}

class FirstLifeCyclePage extends StatefulWidget {
  const FirstLifeCyclePage({super.key});

  @override
  State<FirstLifeCyclePage> createState() => _FirstLifeCyclePageState();
}

class _FirstLifeCyclePageState extends State<FirstLifeCyclePage> {
  final PlayerEntity firstPlayer =
      const PlayerEntity(name: "Abdelaleem", age: 25, married: true);
  final PlayerEntity secondPlayer =
      const PlayerEntity(name: "medo", age: 10, married: false);
  bool isFirstPlayer = true;

  void getPlayer() {
    isFirstPlayer = !isFirstPlayer;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: LifeCyclePage(
              player: isFirstPlayer ? firstPlayer : secondPlayer,
            ),
          ),
          MaterialButton(onPressed: getPlayer, color: Colors.black),
        ],
      ),
    );
  }
}

class LifeCyclePage extends StatefulWidget {
  final PlayerEntity player;

  const LifeCyclePage({Key? key, required this.player}) : super(key: key);

  @override
  LifeCyclePageState createState() => LifeCyclePageState();
}

class LifeCyclePageState extends State<LifeCyclePage> {
  late final BuildContext contextInit;
  late final BuildContext contextDependencies;

  @override
  void initState() {
    //ToDo context=> created
    //ToDo : LifeCyclePage(dirty, state: LifeCyclePageState#c74e8(lifecycle state: created);
    // ToDo :context is created but in initialized yet , can't use context
    // print(Theme.of(context));           // ERROR
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //ToDo context=> initialized
    //ToDo : LifeCyclePage(dirty, state: LifeCyclePageState#c74e8(lifecycle state: initialized);
    // ToDo :context is initialized , can use context
    // print(Theme.of(context));           // OK
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LifeCyclePage oldWidget) {
    print('didUpdateWidget=========');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate ');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose in ');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //ToDo : LifeCyclePage(dirty, state: LifeCyclePageState#c74e8)
    return Column(
      children: [
        Text(widget.player.name),
        Text(widget.player.age.toString()),
        Text(widget.player.married.toString()),
      ],
    );
  }
}
class PlayerEntity extends Equatable{
  final String name;
  final int age;
  final bool married;

  const PlayerEntity({required this.name, required this.age, required this.married});

  @override
  List<Object?> get props => [name,age,married];
}