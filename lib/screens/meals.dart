import 'package:flutter/material.dart';
import 'package:the_cookbook/screens/meal_details.dart';
import 'package:the_cookbook/widgets/meal_item.dart';
import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals,});

  void SelectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,

        ),
      ),
    );
  }

  final String? title;
  final List<Meal> meals;


  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (meal) {
          SelectMeal(context, meal);
        },
      ),
    );

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: title == null ? content : Text(title!),
      ),
      body: meals.isNotEmpty
          ? content
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Uh oh ... nothing here!',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Try selecting a different category!",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ],
              ),
            ),
    );
  }
}
