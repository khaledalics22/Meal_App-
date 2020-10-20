import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favMeals;
  FavoritesScreen(this.favMeals);
  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty)
      return Container(child: Text('you don\'nt have favorite screen '));
    else {
      return ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            affordability: favMeals[idx].affordability,
            complexity: favMeals[idx].complexity,
            duration: favMeals[idx].duration,
            id: favMeals[idx].id,
            imageUrl: favMeals[idx].imageUrl,
            title: favMeals[idx].title,
            deleteMeal: null,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}
