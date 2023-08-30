import 'package:flutter/material.dart';
import 'package:flutter_learn_20230828/src/constants/dummy/categories.dart';
import 'package:flutter_learn_20230828/src/models/category.dart';
import 'package:flutter_learn_20230828/src/models/meal.dart';
import 'package:flutter_learn_20230828/src/screens/meals_secreen.dart';
import 'package:flutter_learn_20230828/src/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(
    BuildContext context,
    Category category,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: availableMeals
              .where((meal) => meal.categories.contains(category.id))
              .toList(),
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map((category) => CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              ))
          .toList(),
    );
  }
}
