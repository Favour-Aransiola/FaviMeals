import 'package:flutter/material.dart';
import 'package:third_practice/models/mealModel.dart';
import 'package:third_practice/screens/categories_screen.dart';
import 'package:third_practice/screens/favourite_screen.dart';
import 'package:third_practice/widgets/customDrawer.dart';

class TabScreen extends StatefulWidget {
  List<MealModel> favoriteMeals;
  static const routeName = '/tabScreen';
  TabScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals App'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favourite',
            )
          ]),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavouriteScreen(favoriteMeals: widget.favoriteMeals)
        ]),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
