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
  String initialSelectedItem="rupies";

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
            //Dropdown Button in flutter
            DropdownButton(
                items: _curencies.map((String value){
                  return DropdownMenuItem(
                     child: Text(value),
                      value: value,
                  );
                }).toList(),
                onChanged: (String? items){
                  setState(() {
                    initialSelectedItem=items!;
                  });
                },
                value:initialSelectedItem ,
                icon:const Icon(Icons.arrow_drop_down_circle),
                hint:const Text("this is hint"),
              style:const TextStyle(
                fontSize: 20,
                color: Colors.yellow,
                fontWeight: FontWeight.w700,
              ),
              alignment: Alignment.center,
              elevation: 6,
              iconSize: 20,
              iconEnabledColor: Colors.green,
              disabledHint: const Text("this is disabled colors"),
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
