import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintPage extends StatefulWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  @override
  State<CustomPaintPage> createState() => _CustomPaintPageState();
}

class _CustomPaintPageState extends State<CustomPaintPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color:    Colors.black,

        child: CustomPaintWidget(),
      )
    );
  }
}

class CustomPaintWidget extends StatefulWidget {
  const CustomPaintWidget({Key? key}) : super(key: key);

  @override
  State<CustomPaintWidget> createState() => _CustomPaintWidgetState();
}

class _CustomPaintWidgetState extends State<CustomPaintWidget> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Transform.rotate(
          angle: -pi/2,
          child: CustomPaint(
            painter: ClockPaintWidget(),
          ),
        ),
      ),
    );
  }
}

class ClockPaintWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var data =DateTime.now() ;
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    Paint paintGreyCircle = Paint()..color = Colors.grey;
    Paint paintGreyOutCircle = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth=2
      ..shader = const RadialGradient(colors: [Colors.blue, Colors.white])
          .createShader(Rect.fromCircle(center: center, radius: radius));


    Paint paintWhiteCircle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    Paint paintWhiteCircleInCenter = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    Paint paintOrangeLine = Paint()
      ..color = Colors.orange
      ..strokeCap = StrokeCap.round
    ..strokeWidth=14
      ..shader = const RadialGradient(colors: [Colors.orange, Colors.white])
          .createShader(Rect.fromCircle(center: center, radius: radius));

    Paint paintBlueLine = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth=6
      ..shader = const RadialGradient(colors: [Colors.blue, Colors.white])
          .createShader(Rect.fromCircle(center: center, radius: radius));


    Paint paintBlueWithBinkLine = Paint()
      // ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 9
      ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, paintGreyCircle);
    canvas.drawCircle(center, radius + 10, paintWhiteCircle);

    var hourHandX=centerX +60 * cos((data.hour *30 +data.minute*0.5)*pi/180);
    var hourHandY=centerX +60 * sin((data.hour *30 +data.minute*0.5)*pi/180);


    canvas.drawLine(center, Offset(hourHandX, hourHandY), paintOrangeLine);


    var minuteHandX=centerX +80 * cos((data.minute *6 +data.minute*0.5)*pi/180);
    var minuteHandY=centerX +80 * sin((data.minute *6 +data.minute*0.5)*pi/180);


    canvas.drawLine(center, Offset(minuteHandX,minuteHandY), paintBlueWithBinkLine);



    var secondHandX=centerX +80 * cos((data.second *6 +data.minute*0.5)*pi/180);
    var secondHandY=centerX +80 * sin((data.second *6 +data.minute*0.5)*pi/180);


    canvas.drawLine(center,  Offset(secondHandX, secondHandY), paintBlueLine);





    canvas.drawCircle(center, radius - 95, paintWhiteCircleInCenter);
   var outerCircleRadius=radius;
   var innerCircleRadius=radius-10;
    for(double i=0;i<360;i+=30 ){
      var x1=centerX +outerCircleRadius*cos(i*pi/180);
      var y1=centerX +outerCircleRadius*sin(i*pi/180);


      var x2=centerX +innerCircleRadius*cos(i*pi/180);
      var y2=centerX +innerCircleRadius*sin(i*pi/180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paintGreyOutCircle);

    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomPainterDrawing extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.33, size.height * 0.25);
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.3, size.height * 0.5);
    path.lineTo(size.width * 0.25, size.height);
    path.lineTo(size.width * 0.5, size.height * 0.6);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(size.width * 0.66, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width * 0.66, size.height * 0.25);

    path.close();
    Paint paint = Paint()..color = Colors.red;
    Paint paint2 = Paint()..color = Colors.black;
    Paint paint3 = Paint()..color = Colors.blue;
    final paint4 = Paint()
      ..strokeWidth = 4
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
    const offset = Offset(210, 210);
    const offset2 = Offset(210, 210);
    canvas.drawCircle(offset, 22, paint2);
    Rect rect = Rect.fromLTRB(30, 40, 60, 80);
    canvas.drawOval(rect, paint3);
    canvas.drawRect(rect, paint3);
    const circleRadius = 90.0;
    const circleCenter = Offset(210, 0);
    canvas.drawCircle(circleCenter, circleRadius, paint4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
