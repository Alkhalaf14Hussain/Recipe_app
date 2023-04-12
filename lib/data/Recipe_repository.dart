import 'dart:convert';

import '../domain/recipe_model.dart';
import 'package:http/http.dart' as http;
class RecipeRepository{

  Future<Recipe> getMeals() async{
    final url='https://www.themealdb.com/api/json/v1/1/random.php';
    final response= await http.get(Uri.parse(url));

    if(response.statusCode==200){
      return Recipe.fromJson(jsonDecode(response.body));
    }
    else
      throw Exception('failed to parse data');
  }
}

