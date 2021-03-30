import 'package:flutter/material.dart';
import '../data/meals_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static String routeName = '/category-meals';
  CategoryMealsScreenState createState() {
    return CategoryMealsScreenState();
  }
}

class CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Map<String, String> routeArgs;
  List meals;

  /**
   * initstate is called before the state loads its dependencies and for that reason no context is
   * available and you get an error for that if u use context in initstate.
   * However didChangeDependencies is called just few moments after the state loads
   * its dependencies and context is available at this moment so here you can use context.
   * However both of them are called before build is called. Only difference is that one is
   * called before the state loads its dependencies and other is called a few moments after
   * the state loads its dependencies.
   */

  @override
  void didChangeDependencies() {
    print('DID CHANGE DEPENDENCIES CALLED');
    routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    meals = DUMMY_MEALS
        .where((element) => element.categories.contains(routeArgs['id']))
        .toList();
    super.didChangeDependencies();
  }

  void checkItem(String id) {
    print('CHECK ITEM GET CALLED');
    setState(() {
      meals.removeWhere((element) => element.id == id);
    });
    print('Checked Id ${id}');
  }

  @override
  Widget build(BuildContext context) {
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
                id: meals[item].id,
                title: meals[item].title,
                imageUrl: meals[item].imageUrl,
                duration: meals[item].duration,
                complexity: meals[item].complexity,
                affordability: meals[item].affordability,
                checkItemHandler: this.checkItem,
              );
            },
            itemCount: meals.length,
          ),
        ),
      ),
    );
  }
}
