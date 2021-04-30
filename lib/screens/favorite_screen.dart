import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Container(
            child: Center(
              child: Text('not favorite meals'),
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                  id: favoriteMeals[index].id,
                  title: favoriteMeals[index].title,
                  imageUrl: favoriteMeals[index].imageUrl,
                  affordability: favoriteMeals[index].affordability,
                  complexity: favoriteMeals[index].complexity,
                  duration: favoriteMeals[index].duration);
            },
            itemCount: favoriteMeals.length,
          );
  }
}
