import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;
  CategoryItem(this._category);
  void _selectCatScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/category-meals',
        arguments: {'id': _category.id, 'title': _category.title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCatScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _category.color.withOpacity(0.7),
                _category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
