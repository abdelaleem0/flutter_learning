import 'package:flutter/material.dart';

class AnimatedBuilderDemo extends StatefulWidget {
  const AnimatedBuilderDemo({super.key});

  @override
  AnimatedBuilderDemoState createState() => AnimatedBuilderDemoState();
}

class AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {

 late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =  AnimationController(
      duration: const Duration(seconds: 50),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        title: const Text("Flutter AnimatedBuilder Widget Demo"),
      ),
      body: Center(
        child: AnimatedBuilder(
          builder: (context, child)  {
            return Transform.rotate(
              angle: _controller.value * 2.2 * 90,
              child: child,
            );
          },
          animation: _controller,
          child: SizedBox(
            width: 300.0,
            height: 200.0,
            child: Image.asset("assets/download_image.jpeg"),
          ),

        ),
      ),
    );
  }
}
