import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/domain/recipe_provider.dart';
import 'package:recipe_app/utils.dart';
class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final meals= ref.watch(mealProvider);
    return  Scaffold(
      body: meals.when(
          data: (data){
            data.ingredients.removeWhere
              ((element) => element.name==null || element.name=="");
            return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*0.45,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image:NetworkImage(data.image),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.name,style: textStyle(35,Colors.black,FontWeight.w700),),
                        SizedBox(height: 2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                chips(text: data.category, color: Colors.yellowAccent,),
                                SizedBox(width: 10,),
                                chips(text: data.area, color: Colors.deepOrangeAccent,),
                              ],
                            ),
                            TextButton(style: TextButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)
                            ),
                                onPressed: (){},
                                child: Text('YouTube',style:
                                textStyle(18,Colors.white,FontWeight.w700),))
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text('Ingredients',style: textStyle(25,Colors.black,FontWeight.w600),),
                        SizedBox(height: 15,),
                        SingleChildScrollView(scrollDirection: Axis.horizontal,
                          child: Row(
                            children:data.ingredients.map((ingredient) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Column(
                                  children: [
                                    Image(
                                        width:100,
                                        height: 100,fit: BoxFit.cover,
                                        image: NetworkImage("https://www.themealdb.com/images/ingredients/${ingredient.name}.png")),
                                    SizedBox(height: 10,),
                                    Text(ingredient.name,style: textStyle(20,Colors.black,FontWeight.w700),),
                                    SizedBox(height: 7,),
                                    Text(ingredient.measures,style: textStyle(16,Colors.grey,FontWeight.w700),)
                                  ],
                                ),
                              );
                            }).toList()
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Instructions',style: textStyle(25,Colors.black,FontWeight.w600),),
                        SizedBox(height: 15,),
                        Text(data.steps,style: textStyle(18,Colors.black,FontWeight.w400),),
                        SizedBox(height: 15,),

                      ],
                    ),
                  ),
                )
              ],
            ),
          );},
          error: (error,_)=>Text('Error'),
          loading: ()=>CircularProgressIndicator())

    );
  }
}

class chips extends StatelessWidget {
  const chips({
    Key? key, required this.text, required this.color,
  }) : super(key: key);
  final String text;
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return Chip(
        label: Container(height: 25,
        child: Center(child: Text(text,style: textStyle(18,Colors.black,FontWeight.w600),),)),
      backgroundColor: color,
    );
  }
}
