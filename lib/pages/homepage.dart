import 'package:daily_note/components/note_item.dart';
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
      body: ListView(
        padding: EdgeInsets.all(15),
        children: const <Widget>[
          NoteItem(),
          SizedBox(height: 10),
          NoteItem(),
          SizedBox(height: 10),
          NoteItem(),
          SizedBox(height: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddNote();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
