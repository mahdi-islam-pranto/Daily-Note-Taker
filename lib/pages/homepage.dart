import 'package:daily_note/components/note_item.dart';
import 'package:daily_note/database/sqlite_service.dart';
import 'package:daily_note/pages/add_note.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Notes"),
      ),
      drawer: Drawer(
        child: ListView(children: const [
          ListTile(title: Text("First Item")),
          ListTile(title: Text("First Item")),
        ]),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: NoteRepo().getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No Notes Created"),
              );
            }
            return ListView(
              padding: const EdgeInsets.all(15),
              children: [
                for (var note in snapshot.data!)
                  const NoteItem(
                    note: note,
                  )
              ],
            );
          }

          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const AddNote();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
