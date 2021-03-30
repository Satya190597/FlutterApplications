import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tab_screens.dart';
import 'screens/filter_screen.dart';

import './models/Meal.dart';
import './data/meals_data.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatefulWidget {
  @override
  RecipeAppState createState() {
    return RecipeAppState();
  }
}

class RecipeAppState extends State<RecipeApp>
{

  List<Meal> _availabelMeal = DUMMY_MEALS;

  Map<String,bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void setFilters(Map<String,bool> filterData) {
    _availabelMeal = DUMMY_MEALS.where((meal) {
      _filters = filterData;
      if(_filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if(_filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if(_filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if(_filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    print(filterData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      home: TabScreen(),
      routes: {
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(this._availabelMeal),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.route_name: (context) => FilterScreen(this.setFilters,this._filters)
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CategoriesScreen(),

    );
  }
}