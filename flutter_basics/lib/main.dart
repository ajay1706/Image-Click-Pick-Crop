import 'package:flutter/material.dart';
import './home.dart';



void main()=> runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
      
    );
  }
}




