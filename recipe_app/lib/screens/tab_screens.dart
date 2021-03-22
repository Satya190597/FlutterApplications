import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screens.dart';

class TabScreen extends StatefulWidget {
  TabScreenState createState() {
    return TabScreenState();
  }
}

class TabScreenState extends State<TabScreen> {

  List<Widget> listOfWidget = [
    CategoriesScreen(),
    FavoriteScreen()
  ];

  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: listOfWidget[selectedPageIndex],
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
