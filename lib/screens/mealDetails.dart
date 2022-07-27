import 'package:flutter/material.dart';
import 'package:third_practice/models/mealModel.dart';

class MealDetails extends StatelessWidget {
  static const RouteName = '/mealDetail';

  @override
  Widget build(BuildContext context) {
    final item =
        ModalRoute.of(context)!.settings.arguments as Map<String, MealModel>;
    final meal = item['meal'];
    return Scaffold(
      appBar: AppBar(
        title: Text(meal!.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Ingredents',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 0, left: 15),
                height: 200,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: meal.ingredients
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(e),
                              ],
                            ),
                          ))
                      .toList(),
                )),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 0, left: 15),
                height: 200,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: meal.steps
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Text(e, softWrap: true)),
                              ],
                            ),
                          ))
                      .toList(),
                ))
          ],
        ),
      ),
    );
  }
}
