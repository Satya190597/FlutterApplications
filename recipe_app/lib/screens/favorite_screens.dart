import 'package:flutter/material.dart';
import '../models/Meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {

  final List<Meal> _favouriteMeal;

  FavoriteScreen(this._favouriteMeal);

  FavoriteScreenState createState() {
    return FavoriteScreenState();
  }

}

class FavoriteScreenState extends State<FavoriteScreen> {

  String reloadFlag;
  // DIRTY METHOD TO RELOAD THE SCREEN.
  void _reload(String id) {
    setState(() {
      reloadFlag = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget._favouriteMeal.length <= 0 ?
      Text('Favorite list of meal is empty') :
      ListView.builder(itemBuilder: (ctx,item) {
        return MealItem(
          id: widget._favouriteMeal[item].id,
          title: widget._favouriteMeal[item].title,
          imageUrl: widget._favouriteMeal[item].imageUrl,
          duration: widget._favouriteMeal[item].duration,
          complexity: widget._favouriteMeal[item].complexity,
          affordability: widget._favouriteMeal[item].affordability,
          checkItemHandler: this._reload,
        );
      },itemCount: widget._favouriteMeal.length,)
    );
  }
  
}