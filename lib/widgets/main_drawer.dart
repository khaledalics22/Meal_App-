import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildItemTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Quicksand',
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 120,
              color: Theme.of(context).primaryColor,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Meals For Everyone!',
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            buildItemTile(
              'Home',
              Icons.restaurant,
              () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            buildItemTile(
              'settings',
              Icons.settings,
              () {
                Navigator.of(context).pushNamed(FiltersScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
