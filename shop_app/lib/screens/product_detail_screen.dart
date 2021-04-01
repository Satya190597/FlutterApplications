import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {

  static final routeName = 'product-detail';

  final String title = 'PRODUCT DETAILS';

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(title: Text(title),),
        body: Container(
          child: Center(
            child: Text('PRODUCT DETAILS SCREEN.'),
          ),
        ),
      );

  }

}