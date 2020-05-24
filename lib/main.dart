import 'package:flutter/material.dart';
import './ui/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'exampleBloc',
      theme: ThemeData(
        primarySwatch: Colors.green,
       visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Bloc Demo'),
    );
  }
}

