import 'package:flutter/material.dart';
import 'package:third_practice/models/mealModel.dart';
import 'package:third_practice/screens/mealDetails.dart';

class MealItem extends StatelessWidget {
  final List<MealModel> filteredMeals;
  const MealItem({Key? key, required this.filteredMeals}) : super(key: key);
  String interpreteCompexity(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Challenging:
        return 'Challenging';
      default:
    }
    return '';
  }

  String interpreteAffordability(Affordability affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredMeals.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, MealDetails.RouteName,
                arguments: {'meal': filteredMeals[index]});
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        filteredMeals[index].imageUrl,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 20,
                        child: Container(
                            color: Colors.black.withOpacity(0.4),
                            alignment: Alignment.center,
                            width: 220,
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              filteredMeals[index].title,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            )))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            const Icon(Icons.schedule),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${filteredMeals[index].duration.toString()} minutes',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            const Icon(Icons.work),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              interpreteCompexity(
                                  filteredMeals[index].complexity),
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            const Icon(Icons.money),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              interpreteAffordability(
                                  filteredMeals[index].affordability),
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
