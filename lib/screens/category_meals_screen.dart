import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String _catTitle;
  String _catID;
  List<Meal> _categoryMeals;
  var _isInit = true;
  void _deleteMeal(String id) {
    setState(() {
      _categoryMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _catTitle = args['title'];
      _catID = args['id'];
      _categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(_catID);
      }).toList();
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            affordability: _categoryMeals[idx].affordability,
            complexity: _categoryMeals[idx].complexity,
            duration: _categoryMeals[idx].duration,
            id: _categoryMeals[idx].id,
            imageUrl: _categoryMeals[idx].imageUrl,
            title: _categoryMeals[idx].title,
            deleteMeal: _deleteMeal,
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }
}
