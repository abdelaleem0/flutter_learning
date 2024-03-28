// import 'package:flutter/material.dart';
// import 'package:learning_flutter/local_dataBase/data_base_model.dart';
// import 'package:learning_flutter/local_dataBase/notes_app/domain/models/note_model.dart';
// import 'package:learning_flutter/local_dataBase/sql_dataBase.dart';
//
// class DummyDataBasePage extends StatefulWidget {
//   const DummyDataBasePage({super.key});
//
//   @override
//   State<DummyDataBasePage> createState() => _DummyDataBasePageState();
// }
//
// class _DummyDataBasePageState extends State<DummyDataBasePage> {
//   final SqlDataBase sqlDataBase = SqlDataBase();
//   List<NotesModel> data = [];
//
//   Future<void> getData() async {
//     data.clear();
//     final response = await sqlDataBase.readData();
//     response.map((e) {
//       data.add(NotesModel.fromDataBase(e));
//       print('data is ${e.toString()}');
//     }).toList();
//   }
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//           child: Column(
//         children: [
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("(name : ${data[index].title} ,"),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Text("age : ${data[index].description} , "),
//                     Text("gender : ${data[index].age})"),
//                   ],
//                 ),
//               );
//             },
//           ),
//           const SizedBox(
//             height: 200,
//           ),
//           MaterialButton(
//             color: Colors.green,
//             onPressed: () async {
//               await sqlDataBase.insertData("Abdelaleem", "25", Gender.male);
//               getData().then((value) => setState(() {}));
//             },
//             child: const Text("insert "),
//           ),
//           MaterialButton(
//             color: Colors.red,
//             onPressed: () {
//               sqlDataBase.deleteData("${data.length}");
//               getData().then((value) => setState(() {}));
//             },
//             child: const Text("delete "),
//           ),
//           MaterialButton(
//             color: Colors.red,
//             onPressed: () async {
//               await sqlDataBase.deleteAllTable();
//               setState(() {
//                 data.clear();
//               });
//             },
//             child: const Text("delete Table "),
//           ),
//         ],
//       )),
//     );
//   }
// }
