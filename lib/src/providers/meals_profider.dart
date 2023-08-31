import 'package:flutter_learn_20230828/src/constants/dummy/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
