import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: Row(children: [
        //calander date
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.greenAccent,
          ),
          child: Column(
            children: [
              const Text("MAR"),
              Text(
                "19",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.red.shade900),
              ),
              const Text("2024"),
            ],
          ),
        ),

        const SizedBox(
          width: 20,
        ),

        //note content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Note title haiuhiua iuabhdfubhaiufb oiahfiuahiuf",
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "12:30 pm",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              const Text(
                "Note Description ahiudhuahiudh iuabhdgiudhuiubiuhb iuabdiuad haiuhiua iuabhdfubhaiufb oiahfiuahiuf",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
