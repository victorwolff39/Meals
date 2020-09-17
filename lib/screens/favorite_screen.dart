import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  FavoriteScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição como favorita.'),
      );
    } else {
      return ListView.builder(
        itemCount: _favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(_favoriteMeals[index]);
        },
      );
    }
  }
}
