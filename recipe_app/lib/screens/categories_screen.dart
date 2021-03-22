import 'package:flutter/material.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';
// Import DATA.
import '../data/categories_data.dart';


// DUMMY DATA.
class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          ...DUMMY_CATEGORIES.map((element) {
            return CategoryItem(element.title, element.color, element.id);
          }).toList(),
        ],
      ),
    );
  }
}
