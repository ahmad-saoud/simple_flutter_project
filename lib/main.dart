
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/Login.dart';

void main (){
  runApp(MyApp()) ;
}

class MyApp extends StatefulWidget{
  const MyApp({super.key}) ;
  @override
  State<MyApp> createState() {
    return _MyAppState() ;
  }
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home : Login()

    ) ;
  }
}