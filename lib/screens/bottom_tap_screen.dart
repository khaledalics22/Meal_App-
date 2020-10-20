import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';

class BottomTapScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  BottomTapScreen(this.favoriteMeals);
  @override
  _BottomTapScreenState createState() => _BottomTapScreenState();
}

class _BottomTapScreenState extends State<BottomTapScreen> {
  List<Map<String, Object>> _widgets;
  int _selectedIdx = 0;
  void _selectPage(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }

  @override
  void initState() {
    _widgets = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites'
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // here we just return scaffold without defautlTapController

    return Scaffold(
      appBar: AppBar(
        title: Text(_widgets[_selectedIdx]['title']),
      ),
      drawer: MainDrawer(),
      body: _widgets[_selectedIdx]['page'],
      bottomNavigationBar: BottomNavigationBar(
        // here we should handle wich view to open manually
        onTap: _selectPage,
        unselectedItemColor: Theme.of(context).primaryColorLight,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType
            .shifting, // this addes some animation to when tapped but we need to define each item's background color below
        currentIndex:
            _selectedIdx, // to tell the bottom navigation which idx is selected to recolor the taps
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
