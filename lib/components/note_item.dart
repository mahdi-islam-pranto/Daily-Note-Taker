import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        //calander date
        Container(
          color: Colors.greenAccent,
          child: const Column(
            children: [
              Text("March"),
              Text("19"),
              Text("2024"),
            ],
          ),
        ),

        const SizedBox(
          width: 20,
        ),

        //note content
        Container(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Note title"),
              Text("Here is the Note Description ........")
            ],
          ),
        )
      ]),
    );
  }
}
