import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/products.dart';

class ProductDetailScreen extends StatelessWidget {

  static final routeName = 'product-detail';

  final String title = 'PRODUCT DETAILS';




  @override
  Widget build(BuildContext context) {

    final Map<String,String> routeArguments = ModalRoute.of(context).settings.arguments;
    final productId = routeArguments['id'];

    final loadedProduct = Provider.of<ProductProvider>(context).findById(productId);
    
    return Scaffold(
        appBar: AppBar(title: Text(title),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(loadedProduct.imageUrl,fit: BoxFit.cover,)
              ),
              SizedBox(height: 10),
              Text('\$${loadedProduct.price}'),
              SizedBox(height: 10,),
              Text('${loadedProduct.title}',softWrap: true,textAlign: TextAlign.center,),
            ],
          ),
        )
      );

  }

}