import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FoodApp extends StatefulWidget {
  const FoodApp({super.key});

  @override
  State<FoodApp> createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  int myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FOOD APP"),
        backgroundColor: Colors.amberAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.reorder_rounded),label:"order"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize_sharp),label: "customize"),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood_outlined),label: "food")
        ]),
    );
  }
}