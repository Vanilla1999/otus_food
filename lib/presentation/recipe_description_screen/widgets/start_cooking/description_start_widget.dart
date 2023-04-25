import 'package:flutter/material.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/presentation/components/title_time_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_state.dart';
import 'package:otus_food/utils/extention.dart';

class DescriptionStartWidget extends StatelessWidget {
  final Recipe recipe;

  const DescriptionStartWidget({Key? key, required this.recipe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17, top: 27.6),
              child: TitleWithTimeWidget(
                  time: recipe.time.timeToStringRecipe(), name: recipe.name),
            ),
          ],
        ),
        const SizedBox(
          height: 16.28,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 17),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            clipBehavior: Clip.hardEdge,
            child: Image(
              height: 220.38,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              image: AssetImage(recipe.img),
            ),
          ),
        ),
      ],
    );
  }
}