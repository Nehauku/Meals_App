import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen({this.favoriteMeals});
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _page;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _page = [
      {
        'page': CategoriesScreen(),
        'title': 'Category',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Favorite',
      },
    ];
    super.initState();
  }
  // void _selectPage(int index) {
  //   setState(() {
  //     _selectedPageIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _page[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
