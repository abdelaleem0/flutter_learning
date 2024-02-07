import 'package:flutter/material.dart';

abstract class Builder {
  Widget build(BuildContext context);
}

class TextView implements Builder {
  final String text;

  TextView(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class ImageView implements Builder {
  final String text;

  ImageView(this.text);

  @override
  Widget build(BuildContext context) {
    return Image.asset(text);
  }
}

class BodyView {
  final List<Model> model;

  BodyView({required this.model});

  List<Builder> get build => model.map((e) {
        return createBuilder(e);
      }).toList();

  Builder createBuilder(Model model) {
    switch (model.type) {
      case Type.text:
        return TextView(model.text);
      case Type.image:
        return ImageView(model.text);
    }
  }
}

class LiskovSubstitutionPage extends StatefulWidget {
  const LiskovSubstitutionPage({super.key});

  @override
  State<LiskovSubstitutionPage> createState() => _LiskovSubstitutionPageState();
}

class _LiskovSubstitutionPageState extends State<LiskovSubstitutionPage> {
  late final BodyView body;
  List<Model> modelList = [
    Model(type: Type.text, text: '1'),
    Model(type: Type.text, text: 'videoPath'),
    Model(type: Type.text, text: '3'),
    Model(type: Type.text, text: 'videoPath'),
    Model(type: Type.text, text: '5'),
  ];

  @override
  void initState() {
    body = BodyView(model: modelList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: body.build.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return body.build[index].build(context);
          },
        ),
      ),
    );
  }
}

class Model {
  final Type type;
  final String text;

  Model({required this.type, required this.text});
}

enum Type { text, image }
