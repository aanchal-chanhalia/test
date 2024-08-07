import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {

  static const List<String> list = <String>["One","Two","Three"];
  var dataValue =  "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropDownButton"),
      backgroundColor: Colors.blue,),
      body: Center(
        child: DropdownButton<String>(
        value: dataValue,
        onChanged: (String? value) {
          setState(() {
            dataValue = value!;
          });
          
          },
          items: list.map<DropdownMenuItem<String>>((String value){
            return DropdownMenuItem<String>(child: Text(value),
            value: value,);

        }).toList(), 
          
          ),
      ),
    );
  }
}