import 'package:flutter/material.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/navigation/main_navigation.dart';

import '../../components/required_time_widget.dart';

class RecipeListWidget extends StatelessWidget {
  final List<Recipe> recipeList;

  const RecipeListWidget({Key? key, required this.recipeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _RecipeItem(
            recipe: recipeList[index],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 22,
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
    return Card(
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 136,
        child: Stack(
          children: [
            Row(
              children: [
                Image(
                  height: double.infinity,
                  width: 149,
                  fit: BoxFit.cover,
                  image: AssetImage(recipe.img),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 23, 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          recipe.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        RequiredTimeWidget(
                          time: recipe.time,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => {
                  Navigator.of(context).pushNamed(
                      MainNavigationRouteNames.recipeDescriptionScreen,
                      arguments: recipe)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
