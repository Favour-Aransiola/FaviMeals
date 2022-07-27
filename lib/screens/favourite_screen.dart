import 'package:flutter/material.dart';
import 'package:third_practice/models/mealModel.dart';

class FavouriteScreen extends StatelessWidget {
  List<MealModel> favoriteMeals;
  FavouriteScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteMeals.isEmpty
          ? Text('You dont have any Favourite yet')
          : Column(
              children: [],
            ),
    );
  }
}
