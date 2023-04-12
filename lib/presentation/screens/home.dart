import 'package:flutter/material.dart';
import 'package:recipe_app/colors.dart';
import 'package:recipe_app/presentation/screens/recipe_screen.dart';
import 'package:recipe_app/utils.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/meal.jpeg'),
          fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height*0.45,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Feeling Hungry?',style: textStyle(30,Colors.black,FontWeight.w700),),
                SizedBox(height: 25,),
                TextButton(style: TextButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RecipeScreen()));
                }, child: Text('Show a recipe',style: textStyle(22,Colors.black,FontWeight.w600),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
