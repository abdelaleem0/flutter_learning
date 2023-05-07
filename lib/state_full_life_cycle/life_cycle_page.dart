import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/state_full_life_cycle/life_cycle_cubit.dart';
import 'package:learning_flutter/state_full_life_cycle/life_cycle_state.dart';

class Parent extends StatelessWidget {
  const Parent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LifeCycleCubit(),
      child: const LifeCyclePage(),
    );
  }
}

class LifeCyclePage extends StatefulWidget {

  const LifeCyclePage({Key? key}) : super(key: key);

  @override
  LifeCyclePageState createState() => LifeCyclePageState();
}

class LifeCyclePageState extends State<LifeCyclePage> {
  @override
  void initState() {
    print('initState in first page');
    super.initState();
  }




  @override
  void dispose() {
    print('dispose in first page');

    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LifeCycleCubit, LifeCycleState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const LifeCycleSecondPage() ,));
                },

                  child: Text(state.value.toString()))),
            ],
          );
        },
      ),
    );
  }
}
class LifeCycleSecondPage extends StatefulWidget {
  const LifeCycleSecondPage({Key? key}) : super(key: key);

  @override
  State<LifeCycleSecondPage> createState() => _LifeCycleSecondPageState();
}

class _LifeCycleSecondPageState extends State<LifeCycleSecondPage> {
  @override
  void initState() {
    print('initState second page ');
    super.initState();
  }
  @override
  void dispose() {
    print('dispose in second page');
    super.dispose();
  }
  @override
  void deactivate() {
    print('deactivate in second page');
    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
    );
  }
}

