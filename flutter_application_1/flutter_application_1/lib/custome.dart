import 'package:flutter/material.dart';

class Custome extends StatefulWidget {
  const Custome({super.key});

  @override
  State<Custome> createState() => _CustomeState();
}

class _CustomeState extends State<Custome> {
  var List = [];
  var name = TextEditingController();
  var focus = FocusNode();
  var contactnumber = TextEditingController();
  var contacfocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("custome"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: List.lenght,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
           child: Container(
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icon(Icons.star_border),
                    ),
        
                  ],
                ),
                 TextField(
                  controller: name,
                  focusNode:focus ,   
                  decoration: InputDecoration(
                    hintText: "enter name",
                    border: OutlineInputBorder(),
                  ), 
                  ),
                  TextField(
                    controller: contactnumber,
                    focusNode: contacfocus,
                    decoration: InputDecoration(
                      hintText: "enter contactnumber",
                      border: OutlineInputBorder(),
                    ),
                  )
              ],
            ),
           ));
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
              context: context,
               builder: (BuildContext context){
                return AlertDialog(
                  title: Center(
                    child: Text("dailog"),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: name,
                        focusNode: focus,
                        decoration: InputDecoration(
                          hintText: "enter name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextField(
                        controller: contactnumber,
                        focusNode: contacfocus,
                        decoration: InputDecoration(
                          hintText: "enter contacnumber",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(onPressed: (){

                      }, 
                      child: Icon(Icons.add))
                    ],
                  ),
                );
               });
              
          }),
    );
  }
}