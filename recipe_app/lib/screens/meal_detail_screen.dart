import 'package:flutter/material.dart';
import '../data/meals_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Function isMealMarkedAsFavourite;
  Function toggleFavouriteHandler;

  MealDetailScreen(this.toggleFavouriteHandler,this.isMealMarkedAsFavourite);

  // Builder method to build -  Section Title.
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  // Builder method.
  Widget buildContainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final argId = ModalRoute.of(context).settings.arguments.toString();



    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == argId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal ${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(color: Colors.grey),
            //       borderRadius: BorderRadius.circular(10)),
            //   margin: EdgeInsets.all(10),
            //   padding: EdgeInsets.all(10),
            //   height: 150,
            //   width: 300,
            //   child: ListView.builder(
            //     itemBuilder: (ctx, index) {
            //       return Card(
            //         color: Theme.of(context).accentColor,
            //         child: Padding(
            //           padding:
            //               EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //           child: Text(selectedMeal.ingredients[index]),
            //         ),
            //       );
            //     },
            //     itemCount: selectedMeal.ingredients.length,
            //   ),
            // ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:  this.isMealMarkedAsFavourite(selectedMeal.id) ?  Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () {
          // -- Example for backward navigation - Navigator.of(context).pop(selectedMeal.id);
          this.toggleFavouriteHandler(selectedMeal.id);
        },
      ),
    );
  }
}
