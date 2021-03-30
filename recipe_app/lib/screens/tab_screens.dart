import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screens.dart';
import '../widgets/main_drawer.dart';
import '../models/Meal.dart';

class TabScreen extends StatefulWidget {

  final List<Meal> _favouriteMeal;

  TabScreen(this._favouriteMeal);

  TabScreenState createState() {
    return TabScreenState();
  }
}

class TabScreenState extends State<TabScreen> {



  List<Map<String,Object>> listOfPages;

  @override
  initState() {
    listOfPages = [
      {'page':CategoriesScreen(),'title':'Categories'},
      {'page':FavoriteScreen(widget._favouriteMeal),'title':'Favorite'}
    ];
    super.initState();
  }

  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listOfPages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: listOfPages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
