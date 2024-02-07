abstract class SolidsManger {
  void getVolume();
}


class Cube implements SolidsManger{
  final double length;

  Cube({required this.length});
  @override
  void getVolume() {
    double volume= length*length*length;
    print('volume is $volume');
  }

}
class Sphere implements SolidsManger{
  final double radius;

  Sphere({required this.radius});
  @override
  void getVolume() {
    double volume=((4/3)*(3.14)*(radius*radius*radius));
    print(' Sphere volume is $volume');
  }

}
class Cylinder implements SolidsManger{
  final double radius;
  final double height;

  Cylinder({required this.radius, required this.height});

  @override
  void getVolume() {
    double volume=((3.14)*(radius*radius)*(height));
    print(' Cylinder volume is $volume');
  }

}
class Rectangular implements SolidsManger{
  final double radius;
  final double height;
  final double width;

  Rectangular({required this.radius, required this.height, required this.width});

  @override
  void getVolume() {
    double volume=(radius*height*width);
    print(' Cylinder volume is $volume');
  }

}


class MangerUseCase {
final SolidsManger solidsManger;
MangerUseCase({required this.solidsManger}) ;
  void execute(){
    solidsManger.getVolume();
  }
}