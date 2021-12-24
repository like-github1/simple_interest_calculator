import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'silple interest calculator app',
    home: Calculatop(),

   theme: ThemeData(
     colorScheme: ColorScheme.fromSwatch
       (primarySwatch: Colors.indigo).
      copyWith(secondary: Colors.indigoAccent),

   ),
  ));
}
class Calculatop extends StatefulWidget {
  const Calculatop({Key? key}) : super(key: key);

  @override
  _CalculatopState createState() => _CalculatopState();
}

class _CalculatopState extends State<Calculatop> {
  final _minimummPadding=5.0;
  final List<String>_listitems=['rupies','dollar','others'];
  TextEditingController principalController= TextEditingController();
  TextEditingController termController= TextEditingController();
  TextEditingController rateofinterestController= TextEditingController();
  String result="";
  String firstitem="";
  final _formKey= GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstitem= _listitems[0];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle= Theme.of(context).textTheme.subtitle1;
    return Scaffold(
      //resizeToAvoidBottomInset: false, it does not work for lareg number of widget
      //for small screen size the Widget maybe hiden
      appBar: AppBar(title: const Text("calculator"),centerTitle: true,),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: ListView(
            children: <Widget>[
              getimage(),
              Padding(
                padding:  EdgeInsets.only(top: _minimummPadding,bottom: _minimummPadding),
                child: TextFormField(
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "please enter Principal amount";
                    }
                  },
                   controller: principalController,
                  keyboardType:TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0.0-9.0]')),
                ],
                  decoration: InputDecoration(
                    labelText: 'Principa',
                    labelStyle:textStyle,
                    hintText: "Enter principal e.g 1200",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(top: _minimummPadding,bottom: _minimummPadding),
                child: TextFormField(
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Rate of Inters";
                    }
                  },
                  controller: rateofinterestController,
                  keyboardType:TextInputType.number,

                  style: textStyle,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0.0-9.0]")),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Rate of Inters',
                    labelStyle:textStyle,
                    hintText: "Enter principal e.g 1200",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: _minimummPadding,bottom: _minimummPadding),
                child: Row(

                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        validator: (String? value){
                          if(value!.isEmpty){
                            return "Please Provide Term";
                          }
                        },
                        controller: termController,
                        keyboardType:TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[0.0-9.0]")),
                        ],
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                          labelText: 'Term',
                          labelStyle:textStyle,
                          hintText: "Enter principal e.g 1200",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: _minimummPadding*5),
                    Expanded(
                      child: DropdownButton(

                        value: firstitem,
                        onChanged: (String? newitem){
                          setState(() {
                            firstitem=newitem!;
                          });
                        },
                        items: _listitems.map((String value){
                          return DropdownMenuItem(
                              child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ),
                    ),


                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: _minimummPadding,bottom: _minimummPadding),
                child: Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){
                       setState(() {
                         if(_formKey.currentState!.validate()){
                           result= _CalculateTotalReturn();
                         }
                       });
                      },
                      child: const Text("Calculate",textScaleFactor: 1.5,),
                    ),
                    SizedBox(width: _minimummPadding*6,),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _reset();
                        });
                      },
                      child: const Text(
                          "Reset",
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
             Padding(
                padding: EdgeInsets.only(top: _minimummPadding,bottom: _minimummPadding),
                child:Text(result),
              )



            ],
          ),
        ),
      ),
    );
  }


  Widget getimage() {
    AssetImage assetImage= const AssetImage('assetss/interest.png');
    Image image= Image(image: assetImage,width: 250,height: 250,);
    return Container(
      margin: EdgeInsets.all(_minimummPadding*10),
        width: 250,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.black,
          image: const DecorationImage(
              image:AssetImage('assetss/interest.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: Colors.green,
            width: 2,
          )
        ),

    );


  }

  String _CalculateTotalReturn() {
    double principal= double.parse(principalController.text);
    double rate= double.parse(rateofinterestController.text);
    double term= double.parse(termController.text);
    double totalamoutPay= principal+(principal*rate*term)/100;
    String results = "After $term Year, your Investement will be $totalamoutPay$firstitem";
    return results;

  }

  void _reset() {
    principalController.text="";
    rateofinterestController.text="";
    termController.text="";
    result="";
    firstitem=_listitems[0];

  }
}
