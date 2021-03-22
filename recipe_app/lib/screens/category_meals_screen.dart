import 'package:flutter/material.dart';
import '../data/meals_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final meals = DUMMY_MEALS
        .where((element) => element.categories.contains(routeArgs['id']))
        .toList();

    print(routeArgs);
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
            itemBuilder: (ctx, item) {
              return MealItem(
                id:meals[item].id,
                title: meals[item].title,
                imageUrl: meals[item].imageUrl,
                duration: meals[item].duration,
                complexity: meals[item].complexity,
                affordability: meals[item].affordability,
              );
            },
            itemCount: meals.length,
          ),
        ),
      ),
    );
  }
}
