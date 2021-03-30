import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';


class FilterScreen extends StatelessWidget {

  static const String route_name = '/filter-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
      body: Text('Hello World !'),
    );
  }
}