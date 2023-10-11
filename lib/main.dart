import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: start(),
    debugShowCheckedModeBanner: false,
  ));
}

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();

  String str = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Conveter"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),

      body: SingleChildScrollView(child:
        Column(children: [
          Container(padding: EdgeInsets.all(12),child: TextField(onTap: () {
            showCurrencyPicker(
              context: context,
              showFlag: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              onSelect: (Currency currency) {
                print('Select currency: ${currency.name}');
                t1.text = currency.code;
                setState(() {

                });
              },
            );          },cursorColor: Colors.black,controller: t1,decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),labelText: "From",labelStyle: TextStyle(color: Colors.black)),),),
          Container(padding: EdgeInsets.all(12),child: TextField(onTap: () {
            showCurrencyPicker(
              context: context,
              showFlag: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              onSelect: (Currency currency) {
                print('Select currency: ${currency.name}');
                t2.text = currency.code;
                setState(() {

                });
              },
            );
          },cursorColor: Colors.black,controller: t2,decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),labelText: "To",labelStyle: TextStyle(color: Colors.black)),),),

          Container(padding: EdgeInsets.all(12),child: TextField(cursorColor: Colors.black,controller: t3,decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),labelText: "Amount",labelStyle: TextStyle(color: Colors.black)),),),

          SizedBox(height: 20,),

          ElevatedButton.icon(style: ElevatedButton.styleFrom(primary: Colors.black),onPressed: () async {
            String From,To,Amount;
            From = t1.text;
            To = t2.text;
            Amount = t3.text;

            var url = Uri.parse('https://raydhan.000webhostapp.com/api_start.php');
            var response = await http.post(url, body: {'from': '$From', 'to': '$To', 'amount': '$Amount'});
         print("response=${response}");
            // Map m = jsonDecode(response.body);
            // str = m['Result'].toString();
            // setState(() {
            //
            // });

          }, icon: Icon(Icons.save), label: Text("Submit")),

          Text("$str"),
        ],),),
    );
  }
}