import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_flutter/flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_flutter/flutter_riverpod/flutter_riverpod2.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage() ));
        },
          child: Center(child: Text("FirstPage"))),
    );
  }
}
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdPage() ));
          },
          child: Center(child: Text("SecondPage"))),
    );
  }
}
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FourPage() ));
          },
          child: Center(child: Text("ThirdPage"))),
    );
  }
}

class FourPage extends StatelessWidget {
  const FourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        body: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdPage() ));
            },
            child: CounterScreen()),
      ),
    );
  }
}


class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(authProvider);
    final counter2 = ref.watch(authProvider2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter & Auth App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: $counter',
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                // await ref.read(authProvider.notifier).login('user', 'password');
              },
              child:  Text(counter.toString()),
            ),
            ElevatedButton(
              onPressed: () async {
                await ref.read(authProvider.notifier).register('user', 'password');
              },
              child:  Text(counter2.toString()),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(authProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              ref.read(authProvider2.notifier).decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
