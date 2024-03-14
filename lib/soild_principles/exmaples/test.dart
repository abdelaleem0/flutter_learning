class File {
  final String name;

  final String hisSize;

  final String lastUpdate;

  File({
    required this.name,
    required this.hisSize,
    required this.lastUpdate,
  });
}


abstract class ManagerPrinter {
  void generateReport(File file);
  void printer(File file);
}

class A implements ManagerPrinter {
  @override
  void printer(File file) {
    print('file${file.name} ${file.hisSize}${file.lastUpdate}');
  }

  @override
  void generateReport(File file) {
    print('generate file A');
  }
}

class B implements ManagerPrinter {
  @override
  void printer(File file) {
    print('file  ${file.name}');
  }

  @override
  void generateReport(File file) {
    print('generate file B');
  }
}

class Switcher {
  ManagerPrinter switchFun(String whichImplement) {
    if (whichImplement == "A") {
      return A();
    } else {
      return B();
    }
  }
}

void main() {
  File model = File(name: "name", hisSize: "hisSize", lastUpdate: "lastUpdate");
  final Switcher switcher = Switcher();
  switcher.switchFun('A').printer(model);
  switcher.switchFun('A').generateReport(model);
}
