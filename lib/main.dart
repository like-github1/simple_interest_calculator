
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main(){
  runApp( MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.indigoAccent),
    ),
     title: 'silple_interest_Calculator_app',
      home: const Myapp(),

  ));
}
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}
class _MyappState extends State<Myapp> {
  TextEditingController Principal= TextEditingController();
  TextEditingController Rateofinterest= TextEditingController();
  TextEditingController terms= TextEditingController();
  final double _minpadding=5.0;
  String dispaly="";
  final List<String>_curencies= ["rupies","dollar","birr"];
  String Initialvalue= "";
  final _formkey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Initialvalue=_curencies[0];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Calculate interest"),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                 getimage(),
                Padding(
                  padding: EdgeInsets.only(top:_minpadding,bottom: _minpadding ),
                  child: TextFormField(
                    validator: (String? validate){
                      if(validate!.isEmpty){
                        return "please enter your principal value";
                      }
                    },
                    controller: Principal,
                    maxLength: 12,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    decoration: const InputDecoration(
                      labelText: "Principal",
                      hintText: "please enter principal",
                    ),

                  ),
                ),
                const SizedBox(height: 9,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String? validate){
                      if(validate!.isEmpty){
                        return "please enter your Rateofinterest";
                      }
                    },
                    controller: Rateofinterest,
                    maxLength: 12,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    decoration: const InputDecoration(
                      labelText: "interest",
                      hintText: "please enter interest rate",
                    ),

                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        validator: (String? validate){
                          if(validate!.isEmpty){
                            return "please enter your interest";
                          }
                        },
                        controller: terms,
                        maxLength: 12,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        decoration: const InputDecoration(
                          counterText: "",
                          labelText: "Term",
                          hintText: "please enter your Term",
                        ),

                      ),
                    ),

                    Expanded(
                      child: DropdownButton(
                        value: Initialvalue,
                       onChanged: (String? items){
                        setState(() {
                          Initialvalue=items!;
                        });

                       },
                          items:_curencies.map((String value) {
                            return DropdownMenuItem(
                                child: Text(value),
                              value: value,
                            );
                          }).toList(),

                      ),
                    ),


                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                          onPressed: (){
                       setState(() {
                         if(_formkey.currentState!.validate()){
                           dispaly= _calculateTotalInterest();
                         }

                       });
                          },
                          child:const Text("Calculate"),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            _reset();
                          });
                        },
                        child:const Text("reset"),
                      ),
                    ),
                  ],
                ),
                Text(dispaly),


              ],
            ),
          ),
        ),
      ),

    );
  }

   Widget getimage() {
    AssetImage assetImage= const AssetImage('assetss/interest.png');
    Image image= Image(image: assetImage);
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        color: Colors.red,
        child: image,
      ),
    );

   }

 _calculateTotalInterest() {
   double principal= double.parse(Principal.text);
   double interest= double.parse(Rateofinterest.text);
   double term= double.parse(terms.text);
   double result= principal+ principal*interest*term/100;
   return "you interest after $term Terms are $result $Initialvalue";
  }

  void _reset() {
    Principal.text="";
    Rateofinterest.text="";
    terms.text="";
    Initialvalue=_curencies[0];
    dispaly="";

  }
}

