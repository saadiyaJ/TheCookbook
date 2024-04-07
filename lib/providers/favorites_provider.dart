import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {

  FavoriteMealsNotifier() : super([]);

  bool toggleMealFvoriteStatus(Meal meal) {

    final mealIsFavorite = state.contains(meal);

      //non favorited meal
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      //favorited meals
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
