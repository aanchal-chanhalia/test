import 'package:flutter/material.dart';

class FoodItems extends StatefulWidget {
  const FoodItems({super.key});

  @override
  State<FoodItems> createState() => _FoodItemsState();
}

class _FoodItemsState extends State<FoodItems> {
  var list = [];
  var foodname = TextEditingController();
  var foodfocus = FocusNode();
  var foodprice = TextEditingController();
  var pricefocus = FocusNode();
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("FOOD ITEMS"),
      ),
      body:ListView.builder(
        itemCount: list.lenght,
        itemBuilder: (context,index){
          return Padding(
            padding:const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const  Row(
                    children: [
                      const Icon(Icons.abc),
                    ],
                  ),
                  TextField(
                    controller: foodname,
                    focusNode: foodfocus,
                    decoration:const InputDecoration(
                      hintText: "enter food name",
                      border: OutlineInputBorder()
                    ),
                  ),
                  TextField(
                    controller: foodprice,
                    focusNode: pricefocus,
                    decoration:const  InputDecoration(
                      hintText: "enter food price",
                      border: OutlineInputBorder()
                    ),
                  ),
                ],
              ),
            ),
            );
        }),
      
      
      floatingActionButton: FloatingActionButton
      (onPressed: (){
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
                    controller: foodname,
                    focusNode: foodfocus,
                    decoration: InputDecoration(
                      hintText: "enter food name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: foodprice,
                    focusNode: pricefocus,
                    decoration: InputDecoration(
                      hintText: "enter food price",
                      border: OutlineInputBorder()
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