import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learning_flutter/local_dataBase/notes_app/domain/models/note_model.dart';
import 'package:learning_flutter/local_dataBase/notes_app/ui/notes_page.dart';
import 'package:learning_flutter/local_dataBase/sql_dataBase.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final colorList = [];
  ColorEnum dropdownValue = ColorEnum.white;
  final _formKey = GlobalKey<FormState>();
  final  sqlDataBase = SqlDataBase();

  void _collectColor() {
    ColorEnum.values.map((e) {
      colorList.add(e.name);
    }).toList();
  }

  @override
  void initState() {
    _collectColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                title: "Title",
                controller: titleController,

              ),
              AppTextField(
                title: "description",
                controller: descriptionController,
              ),
              Row(
                children: [
                  const Text(
                    'Color ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    width: 200,
                  ),
                  DropdownButton(
                    value: dropdownValue,
                    items: ColorEnum.values.map((e) {
                      return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name,
                            style: TextStyle(color: e.setColor),
                          ));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          dropdownValue = value;
                        }
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                color: const Color(0xffefb7ff),
                onPressed: () async{
                  if (_formKey.currentState!.validate()) {
                    _push();

                  }
                },
                child: const Text(
                  "add note",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<int> _insertItem() async {
    final response = await sqlDataBase.insertData(NotesModel(
        title: titleController.text,
        description: descriptionController.text,
        color: dropdownValue));

    return response;
  }
  void _push()async{
  final isAdded= await _insertItem();
  if(isAdded!=0){
    if(mounted){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const NotesPage(),));

    }else{
    }


  }
  }
}

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final void Function(String)? onChanged;

  const AppTextField(
      {super.key,
      required this.controller,
      required this.title,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChanged,
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'text is Empty';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}


