import 'package:flutter/material.dart';
import 'package:learning_flutter/local_dataBase/notes_app/domain/models/note_model.dart';
import 'package:learning_flutter/local_dataBase/notes_app/ui/add_note_page.dart';
import 'package:learning_flutter/local_dataBase/notes_app/ui/note_item.dart';
import 'package:learning_flutter/local_dataBase/sql_dataBase.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final SqlDataBase sqlDataBase = SqlDataBase();
  List<NotesModel> data = [];

  Future<void> getData() async {
    data.clear();
    final response = await sqlDataBase.readData();
    response.map((e) {
      data.add(NotesModel.fromDataBase(e));
    }).toList();

    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        leadingWidth: 1,
        backgroundColor: const Color(0xffefb7ff),
        title: const Center(
            child: Text(
          'Notes app',
        )),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
             _deleteTable();
            },
            child: const Text(
              'delete dataBase',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return NoteItem(
                    note: NotesModel(
                        id: data[index].id,
                        title: data[index].title,
                        description: data[index].description,
                        color: data[index].color),
                    onPressed: () {
                      _deleteItemFromDataBase(data[index].id ?? 0, index);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNotePage(),
              ));
        },
      ),
    );
  }

  void _deleteItemFromDataBase(int id, int index) async {
    final response = await sqlDataBase.deleteData(id: id);
    if (response != 0) {
      // item deleted successfully
      _deleteItem(index);
    } else {
      print('error in data base ');
    }
  }

  void _deleteItem(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  void _deleteTable()async {
    await sqlDataBase.deleteTable(tableName: 'notes.db');
      getData();
  }
}
