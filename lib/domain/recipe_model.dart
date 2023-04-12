class Recipe{
  final String name;
  final String id;
  final String category;
  final List<Ingredients> ingredients;
  final String steps;
  final String image;
  final String youtubeUrl;
  final String area;

  Recipe({
    required this.category,
    required this.name,
    required this.id,
    required this.area,
    required this.ingredients,
    required this.steps,
    required this.image,
    required this.youtubeUrl,
});

   Recipe.fromJson(Map<String, dynamic> json):
     id= json['meals'][0]['idMeal'],
    name= json['meals'][0]['strMeal'],
    area= json['meals'][0]['strArea'],
    youtubeUrl= json['meals'][0]['strYoutube'],
    image= json['meals'][0]['strMealThumb'],
    steps= json['meals'][0]['strInstructions'],
    category= json['meals'][0]['strCategory'],
    ingredients= List.generate(
        20, (index)=> Ingredients(
        json['meals'][0]['strIngredient${index+1}'],
        json['meals'][0]['strMeasure${index+1}']));
}

class Ingredients {
  final String name;
  final String measures;

  Ingredients(
     this.name,
     this.measures,
);
}