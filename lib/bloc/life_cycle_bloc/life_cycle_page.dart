import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/life_cycle_bloc/life_cycle_cubit.dart';

class LifeCycleCubitPage extends StatefulWidget {
  const LifeCycleCubitPage({Key? key}) : super(key: key);

  @override
  LifeCycleCubitPageState createState() => LifeCycleCubitPageState();
}

class LifeCycleCubitPageState extends State<LifeCycleCubitPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(BlocProvider.of<LifeCycleCubit>(context).toString()),
      ),
    );
  }
}
