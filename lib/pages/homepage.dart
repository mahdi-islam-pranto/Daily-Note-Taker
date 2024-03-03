import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initial Selected Value
  String dropdownvalue = 'Login';

  // List of items in our dropdown menu
  var items = [
    'Login',
    'Prayer',
    'Lunch Break',
    'Short Break',
    'Office Time Over',
    'Meeting',
    'Available',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(title: Text("First Item")),
          ListTile(title: Text("First Item")),
          ListTile(title: Text("First Item")),
          DropdownButton(
            autofocus: false,
            // Initial Value
            value: dropdownvalue,
            
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ]),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
