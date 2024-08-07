import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model_data.dart';
import 'package:flutter_application_1/database_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ListviewBuilder extends StatefulWidget {
  const ListviewBuilder({super.key});

  @override
  State<ListviewBuilder> createState() => _ListviewBuilderState();
}

class _ListviewBuilderState extends State<ListviewBuilder> {
  DatabaseProvider databaseProvider = DatabaseProvider();
  var foodname = TextEditingController();
  var focuce = FocusNode();
  var price = TextEditingController();
  var priefocus = FocusNode();
  var list = <Model>[];
  void instate(){
    super.initState();
    getdata();
  }
  void getdata()async{
    list = await databaseProvider.getList();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("list view builder"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.red,
            child: 
           Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(Icons.abc_rounded),
                  Expanded(child: Text(
                    list[index].id.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
                  Expanded(child: Text(
                    list[index].foodName.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
                  Expanded(child: Text(
                    list[index].price.toString()
                  )),
                  GestureDetector(
                    onTap: () {
                      showDialog(context: context,
                       builder: (BuildContext context){
                          return AlertDialog(
                            title:Center(
                              child: Text(list[index].id.toString()),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField( 
                controller: foodname,
                focusNode: focuce,
                decoration: InputDecoration(
                  hintText: "enter food name",
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                controller: price,
                focusNode: priefocus,
                decoration: InputDecoration(
                  hintText: "enter price",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {});
                if(foodname.text.toString().isEmpty){
                  Fluttertoast.showToast(msg: "enter foodname");
                }else if(price.text.toString().isEmpty){
                  Fluttertoast.showToast(msg: "enter price");
                }else{
                  var model= Model(
                    id: list[index].id,
                    foodName: foodname.text.toString(),
                    price: double.parse(price.text)                
                     );
                     databaseProvider.updateTodo(model);
                     setState(() {});
                     getdata();
                }
                foodname.clear();
                Navigator.of(context).pop();
                
              },

               child:const Icon(Icons.edit),
               ),
               GestureDetector(
                onTap: () {
                setState(() {}); 
                databaseProvider.deleteTodo(list[index].id??0); 
                setState(() { });
                getdata();
                },
                child: Icon(Icons.delete),
               )
              

                              ],
                            ),

                          );
                        });
                    },
                  )
                ],
              ),
              // TextField( 
              //   controller: foodname,
              //   focusNode: focuce,
              //   decoration: InputDecoration(
              //     hintText: "enter food name",
              //     border: OutlineInputBorder()
              //   ),
              // ),
              // TextField(
              //   controller: price,
              //   focusNode: priefocus,
              //   decoration: InputDecoration(
              //     hintText: "enter price",
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // ElevatedButton(onPressed: (){
              //   setState(() {});
              //   if(foodname.text.toString().isEmpty){
              //     Fluttertoast.showToast(msg: "enter foodname");
              //   }else if(price.text.toString().isEmpty){
              //     Fluttertoast.showToast(msg: "enter price");
              //   }else{
              //     var model= Model(
              //       id: list[index].id,
              //       foodName: foodname.text.toString(),
              //       price: double.parse(price.text)                
              //        );
              //        databaseProvider.updateTodo(model);
              //        setState(() {});
              //        getdata();
              //   }
              //   foodname.clear();
              //   Navigator.of(context).pop();
                
              // },

              //  child:const Icon(Icons.edit),
              //  ),
              //  GestureDetector(
              //   onTap: () {
                  
              //   },
              //  )
              
              
            ],

          ),
          
          ),
         
          );
          
        }),
        floatingActionButton: FloatingActionButton(onPressed: (){
         showDialog(
          context: context,
           builder: (BuildContext context){
            return AlertDialog(
              title: Text("dialog"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: foodname,
                    focusNode: focuce,
                    decoration: InputDecoration(
                      hintText: "enter food name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: price,
                    focusNode: priefocus,
                    decoration: InputDecoration(
                      hintText: "enter price",
                      border: OutlineInputBorder(),

                    ),
                  ),
                  ElevatedButton(onPressed:(){
                    setState(() {});
                    var model =Model(
                      foodName: foodname.text.toString(),
                      price: double.parse(price.text));
                    databaseProvider.insertTodo(model);
                    Navigator.of(context).pop();
                    print("model:${model.price}");
                    foodname.clear();
                    getdata();
                    
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








