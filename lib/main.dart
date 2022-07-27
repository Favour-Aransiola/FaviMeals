import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:third_practice/dummy_data.dart';
import 'package:third_practice/models/mealModel.dart';
import 'package:third_practice/screens/category_meal_screen.dart';
import 'package:third_practice/screens/mealDetails.dart';
import 'package:third_practice/screens/settings_screen.dart';
import 'package:third_practice/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filteredValues = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<MealModel> meals = dummyMeals;
  List<MealModel> favoriteMeals = [];
  setFilterData(Map<String, bool> filteredData) {
    setState(() {
      filteredValues = filteredData;
      meals = dummyMeals.where((element) {
        if (!element.isGlutenFree && filteredValues['gluten'] == true) {
          return false;
        } else if (!element.isLactoseFree &&
            filteredValues['lactose'] == true) {
          return false;
        } else if (!element.isVegan && filteredValues['vegan'] == true) {
          return false;
        } else if (!element.isVegetarian &&
            filteredValues['vegetarian'] == true) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  addToFavourite(MealModel item) {
    setState(() {
      favoriteMeals.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          accentColor: Colors.amber,
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
      initialRoute: TabScreen.routeName,
      routes: {
        TabScreen.routeName: (context) =>
            TabScreen(favoriteMeals: favoriteMeals),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(
              meals: meals,
            ),
        MealDetails.RouteName: (context) => MealDetails(),
        SettingsScreen.routeName: (context) => SettingsScreen(
              saveFilter: setFilterData,
              currentFilters: filteredValues,
            )
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
