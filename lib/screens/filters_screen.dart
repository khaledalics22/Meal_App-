import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, Object> filters;
  final Function reloadFilteredMeals;
  FiltersScreen(this.filters, this.reloadFilteredMeals);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.filters['gluten'];
    _isLactoseFree = widget.filters['lactose'];
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  void updateFilters() {
    final filters = {
      'vegan': _isVegan,
      'vegetarian': _isVegetarian,
      'lactose': _isLactoseFree,
      'gluten': _isGlutenFree,
    };
    widget.reloadFilteredMeals(filters);
  }

  Widget _buildSwitchItem(
      String title, String description, bool newValue, Function updateValue) {
    return SwitchListTile(
        value: newValue,
        onChanged: updateValue,
        title: Text(title),
        subtitle: Text(
          description,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'manage your filters',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchItem('Gluten-free meal ',
                  'includes onley Gluten-free meals ', _isGlutenFree, (value) {
                setState(() {
                  _isGlutenFree = value;
                  updateFilters();
                });
              }),
              _buildSwitchItem(
                  'Lactose-free meal ',
                  'includes onley Lactose-free meals ',
                  _isLactoseFree, (value) {
                setState(() {
                  _isLactoseFree = value;
                  updateFilters();
                });
              }),
              _buildSwitchItem('Vegan-free meal ',
                  'includes onley Vegan-free meals ', _isVegan, (value) {
                setState(() {
                  _isVegan = value;
                  updateFilters();
                });
              }),
              _buildSwitchItem(
                  'Vegetarian-free meal ',
                  'includes onley Vegetarian-free meals ',
                  _isVegetarian, (value) {
                setState(() {
                  _isVegetarian = value;
                  updateFilters();
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
