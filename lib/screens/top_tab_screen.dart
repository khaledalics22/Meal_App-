import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';

// this is to add tap at bottom of appbar , check out the bottom_tab_screen.dart file
class TopTabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

String appTitle = 'Categories';
final catViewName = 'Categories';
final favViewName = 'Favorites';

class _TabScreenState extends State<TopTabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // add a drawer in the scaffold widget takes a wdiget like any other widget
        appBar: AppBar(
          title: Text(appTitle),
          bottom: TabBar(
            onTap: (value) {
              setState(() {
                if (value == 0)
                  appTitle = catViewName;
                else
                  appTitle = favViewName;
              });
            },
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: catViewName,
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: favViewName,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavoritesScreen(null)],
        ),
      ),
    );
  }
}
