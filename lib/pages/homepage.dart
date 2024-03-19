import 'package:daily_note/components/note_item.dart';
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
          children: const <Widget>[NoteItem(), NoteItem(), NoteItem()],
        ));
  }
}
