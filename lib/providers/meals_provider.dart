import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_cookbook/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
