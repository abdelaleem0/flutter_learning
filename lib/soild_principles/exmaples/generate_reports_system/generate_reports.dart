class DataEntity {
  final String content;

  DataEntity({required this.content});
}
abstract class DataSource {
  Future<DataEntity> fetchData();
}

abstract class ReportFormat {
  void generateReport(DataEntity data);
}
class SQLDataSource implements DataSource {
  @override
  Future<DataEntity> fetchData() async {
    return DataEntity(content: "Data from SQL Database");
  }
}

class RESTfulDataSource implements DataSource {
  @override
  Future<DataEntity> fetchData() async {
    return DataEntity(content: "Data from RESTful Service");
  }
}

class StaticFileDataSource implements DataSource {
  @override
  Future<DataEntity> fetchData() async {
    return DataEntity(content: "Data from Static File");
  }
}
class PDFReport implements ReportFormat {
  @override
  void generateReport(DataEntity data) {
    print("Generating PDF report: ${data.content}");
  }
}

class HTMLReport implements ReportFormat {
  @override
  void generateReport(DataEntity data) {
    print("Generating HTML report: ${data.content}");
  }
}

class ExcelReport implements ReportFormat {
  @override
  void generateReport(DataEntity data) {
    print("Generating Excel report: ${data.content}");
  }
}
class ReportGeneratorSystem {
  final DataSource dataSource;
  final ReportFormat reportFormat;

  ReportGeneratorSystem({required this.dataSource, required this.reportFormat});

  Future<void> generateReport() async {
    DataEntity data = await dataSource.fetchData();
    reportFormat.generateReport(data);
  }
}
void main() async {
  DataSource dataSource = SQLDataSource();
  ReportFormat reportFormat = PDFReport();

  ReportGeneratorSystem reportSystem = ReportGeneratorSystem(dataSource: dataSource, reportFormat: reportFormat);
  await reportSystem.generateReport();
}
