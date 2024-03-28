import 'package:flutter/material.dart';
import 'package:learning_flutter/local_dataBase/notes_app/domain/models/note_model.dart';

class NoteItem extends StatelessWidget {
  final NotesModel note;
  final void Function()? onPressed;

  const NoteItem(
      {super.key, required this.note,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border:
                  Border(bottom: BorderSide(color: Colors.black12, width: 3))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(note.title),
                      Text(note.description),
                    ],
                  ),
                  Text(note.color.name,style: TextStyle(
                      color: note.color.name.map().setColor
                  ),),
                ],
              ),
            ),
          ),

          IconButton(onPressed: onPressed, icon:  const Icon(Icons.delete,
            color: Colors.red,),)
        ],
      ),
    );
  }
}
