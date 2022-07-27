import 'package:flutter/material.dart';
import 'package:third_practice/dummy_data.dart';
import 'package:third_practice/models/mealModel.dart';
import 'package:third_practice/widgets/category_meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meal';
  List<MealModel> meals;
  CategoryMealScreen({required this.meals});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'] as String;
    final id = routeArgs['id'] as String;
    final filteredMeals = meals.where((element) {
      return element.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: MealItem(filteredMeals: filteredMeals),
    );
  }
}
