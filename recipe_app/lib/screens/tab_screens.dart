import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screens.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  TabScreenState createState() {
    return TabScreenState();
  }
}

class TabScreenState extends State<TabScreen> {

  List<Map<String,Object>> listOfPages = [
    {'page':CategoriesScreen(),'title':'Categories'},
    {'page':FavoriteScreen(),'title':'Favorite'}
  ];

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
