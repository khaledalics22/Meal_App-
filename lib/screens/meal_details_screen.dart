import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details-screen';
  final Function toggleFavmeal;
  final Function isFavMeal;
  MealDetailsScreen(this.isFavMeal, this.toggleFavmeal);

  Widget buildContainer(Widget child, double height) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String;
    final selMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavMeal(id) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavmeal(id);
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop(id);
            },
            icon: Icon(Icons.delete),
          ),
        ],
        title: FittedBox(
          child: Text(selMeal.title),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Text(selMeal.ingredients[idx]);
                },
                itemCount: selMeal.ingredients.length,
              ),
              120,
            ),
            buildTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${idx + 1}'),
                        ),
                        title: Text(selMeal.steps[idx]),
                      ),
                      Divider(
                        color: Colors.black87,
                      ),
                    ],
                  );
                },
                itemCount: selMeal.steps.length,
              ),
              200,
            ),
          ],
        ),
      ),
    );
  }
}
