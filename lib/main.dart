import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/bottom_tap_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import './screens/meal_details_screen.dart';
import 'screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var availableMeals = DUMMY_MEALS;
  var filters = {
    'vegan': false,
    'vegetarian': false,
    'gluten': false,
    'lactose': false,
  };
  final List<Meal> favMeals = [];
  bool isFavMeal(String id) {
    return favMeals.any((element) => element.id == id);
  }

  void toggleFavoriteMeal(String id) {
    var idx = favMeals.indexWhere((element) => element.id == id);
    if (idx >= 0) {
      setState(() {
        favMeals.removeAt(idx);
      });
    } else {
      setState(() {
        favMeals.add(availableMeals.firstWhere((element) => element.id == id));
      });
    }
  }

  void setFilters(Map<String, Object> newfilter) {
    setState(() {
      filters = newfilter;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (newfilter['vegan'] && !meal.isVegan) return false;
        if (newfilter['vegetarian'] && !meal.isVegetarian) return false;
        if (newfilter['gluten'] && !meal.isGlutenFree) return false;
        if (newfilter['lactose'] && !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.pinkAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Quicksans',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 55, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 55, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksans',
                color: Color.fromRGBO(20, 51, 55, 1),
              ),
            ),
      ),
      initialRoute: '/', // is by default but to make sure if changed
      routes: {
        '/': (_) => BottomTapScreen(favMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(availableMeals),
        MealDetailsScreen.routeName: (_) =>
            MealDetailsScreen(isFavMeal, toggleFavoriteMeal),
        FiltersScreen.routeName: (_) => FiltersScreen(filters, setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return BottomTapScreen(favMeals);
        });
      },
    );
  }
}
