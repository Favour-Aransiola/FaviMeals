import 'package:flutter/material.dart';
import 'package:third_practice/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: dummyCategories
            .map((e) => CategoryItem(
                  title: e.title,
                  color: e.color,
                  id: e.id,
                ))
            .toList(),
      ),
    );
  }
}
