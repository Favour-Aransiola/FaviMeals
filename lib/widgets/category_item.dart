import 'package:flutter/material.dart';
import 'package:third_practice/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {Key? key, required this.id, required this.title, required this.color})
      : super(key: key);

  selectCategory(ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      onTap: () => selectCategory(context),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
