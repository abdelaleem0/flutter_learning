import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/example_bloc.dart';
import 'package:learning_flutter/bloc/example_state.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ExampleCubit(), child: const ExampleWidget());
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber.withOpacity(0.5),

      body: BlocBuilder<ExampleCubit, ExampleState>(

          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("value of x= ${state.x}", style: const TextStyle(
                      color: Colors.red,
                      fontSize: 30
                  ),),

                ),                IconButton(
                    onPressed: () {
                      BlocProvider.of<ExampleCubit>(context).setValueOfX();
                    },
                    icon: const Icon(Icons.add)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (cont) {
                            return BlocProvider.value(
                              value: BlocProvider.of<ExampleCubit>(context),
                              child: const SecondPage(),
                            );
                          },
                        ),
                      );
                    },
                    child: const Text("scond page")),
              ],
            );
          }
      )

    );
  }
}

/// this Example to use BlocProvider by BlocProvider.value ;

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExampleCubit, ExampleState>(
      builder: (context, state) =>
          Scaffold(
            backgroundColor: Colors.blue.withOpacity(0.5),
            appBar: AppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("value of x= ${state.x}", style: const TextStyle(
                      color: Colors.red,
                      fontSize: 30
                  ),),



                ),

                IconButton(
                    onPressed: () {
                      BlocProvider.of<ExampleCubit>(context).setValueOfX();
                    },
                    icon: const Icon(Icons.add)),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (cont) =>
                      ThirdPage(
                        buildContext: context,
                      ),));
                }, child: const Text("third Page"))
              ],
            ),
          ),
    );
  }
}
//TODO :this Example to use BlocProvider by Context ;
/// but this solution not be able to use BlocBuilder in build
class ThirdPage extends StatelessWidget {
  final BuildContext buildContext;
  const ThirdPage({Key? key, required this.buildContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    backgroundColor: Colors.red,
      body: Center(
        child: Text("the value of x is ${BlocProvider
            .of<ExampleCubit>(buildContext)
            .state
            .x}"),
      ),
    );
  }
}
