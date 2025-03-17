import 'package:flutter/material.dart';
import 'package:hello/pages/currency_converter.dart';

void main() {
  runApp(MyApp());
}

/*

For UI, there are 2 Widgets: 
1. StatelessWidget
2. StatefulWidget 

Mainly types of Design:
1. Material Design (Google)
2. Cupertino Design (Apple)

*/

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
       home: CurrencyConverter(),
    );
  }
}