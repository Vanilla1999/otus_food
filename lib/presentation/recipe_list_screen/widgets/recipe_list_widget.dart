import 'package:flutter/material.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_state.dart';

class RecipeListWidget extends StatelessWidget {
  final List<Recipe> recipeList;

  const RecipeListWidget({Key? key, required this.recipeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return _RecipeItem(
            recipe: recipeList[index],
          );
        },
        separatorBuilder:(context, index) {
          return SizedBox(
            height: 24,
          );
        },
        itemCount: recipeList.length);
  }
}

class _RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const _RecipeItem({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.green,
      child: Container(
        height:136 ,
        width: 396,
        child: Stack(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () =>{},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
