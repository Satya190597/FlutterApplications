import 'package:flutter/material.dart';

void main() {
  runApp(ShoppingApp());
}

class  ShoppingApp extends StatefulWidget {

  @override
  ShoppingAppState createState() {
    return ShoppingAppState();
  }

}

class ShoppingAppState extends State<ShoppingApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      home: Home(),
     );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Hello World !'),),
    );
  }
}