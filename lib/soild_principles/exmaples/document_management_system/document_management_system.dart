class DocumentEntity{
  final String name;
  final String content;

  DocumentEntity({required this.name, required this.content});
}
abstract class PrinterManger{
  void printDocument(DocumentEntity document);
}
class ClassicPrinter implements PrinterManger{
  @override
  void printDocument(DocumentEntity document) {
    print('ClassicPrinter print document which his name ${document.name} ');
  }



}
abstract class StoreManger{
  void storeDocument(DocumentEntity document);
}
class ClassicStore implements StoreManger{
  @override
  void storeDocument(DocumentEntity document) {
    print('i store document which his name ${document.name}');
  }

}
class SystemActionUseCase{
  final PrinterManger printerManger;
  final StoreManger storeManger;

  SystemActionUseCase({required this.printerManger, required this.storeManger});
  void printAndStoreDocument(DocumentEntity document){
    printDocument(document);
    storeDocument(document);

  }
  void printDocument(DocumentEntity document){
    printerManger.printDocument(document);

  }
  void storeDocument(DocumentEntity document){
    storeManger.storeDocument(document);

  }
}
void main() {
  ClassicPrinter printer = ClassicPrinter();
  ClassicStore store = ClassicStore();
  SystemActionUseCase object =SystemActionUseCase(printerManger: printer, storeManger: store);
  DocumentEntity document=DocumentEntity(name: 'pdf ', content: 'solid principles');
  object.printAndStoreDocument(document);
}