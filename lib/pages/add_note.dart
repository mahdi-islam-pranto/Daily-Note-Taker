import 'package:daily_note/database/sqlite_service.dart';
import 'package:daily_note/models/note.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add your Note"), actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: _insertNote,
            icon: const Icon(Icons.done),
          ),
        )
      ]),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Add Note Title"),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: TextField(
                controller: _description,
                maxLines: 50,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Add Note Description"),
              ),
            )
          ],
        ),
      ),
    );
  }

  _insertNote() async {
    final note = Note(
        title: _title.text,
        description: _description.text,
        createdAt: DateTime.now());
    await NoteRepo().insert(note: note);
    print(await _description);
  }
}
