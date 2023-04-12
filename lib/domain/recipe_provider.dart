import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/Recipe_repository.dart';
import 'package:recipe_app/domain/recipe_model.dart';

final mealProvider = FutureProvider<Recipe>((ref) {
  return RecipeRepository().getMeals();
});
