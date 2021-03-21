import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.title, this.color,this.id);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed('/category-meals',arguments: {'id':this.id,'title':this.title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.headline1,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [this.color.withOpacity(0.7), this.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );


  }
}
