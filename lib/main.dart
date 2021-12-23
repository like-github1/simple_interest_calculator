import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.lightBlueAccent,
      primarySwatch: Colors.yellow,
    ),
    title: 'Simple_interest_calculator',
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String name = "";
  List<String>_curencies= ["rupies","Dollar","Pound","others"];
  String newitemselected="rupies";
  String selectedItems="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("statefull widget"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String value) {
                setState(() {
                  name = value;
                });
              },
            ),
          DropdownButton(
              items: _curencies.map((String value){
                return DropdownMenuItem(
                  value: value,
                    child: Text(value)
                );
              }).toList(),
            onChanged: (String? newselectedItems){
                setState(() {
                  selectedItems=newselectedItems;
                });

            },
          ),

            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text("the user input is $name"),
            ),
          ],
        ),
      ),
    );
  }
}
