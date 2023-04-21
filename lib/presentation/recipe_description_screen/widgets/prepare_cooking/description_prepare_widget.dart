import 'package:flutter/material.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/presentation/components/title_time_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_state.dart';
import 'package:otus_food/utils/extention.dart';

class DescriptionPrepareWidget extends StatelessWidget {
  final Recipe recipe;
  final RecipeDescriptionCubit cubit;

  const DescriptionPrepareWidget({Key? key, required this.recipe, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 17, top: 27.6),
                child: TitleWithTimeWidget(
                    time: recipe.time.timeToStringRecipe(), name: recipe.name),
              ),
            ),
            _FavoriteRecipe(
              cubit: cubit,
            ),
            SizedBox(width: 19,)
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

class _FavoriteRecipe extends StatefulWidget {
  final RecipeDescriptionCubit cubit;

  const _FavoriteRecipe({Key? key, required this.cubit}) : super(key: key);

  @override
  State<_FavoriteRecipe> createState() => _FavoriteRecipeState();
}

class _FavoriteRecipeState extends State<_FavoriteRecipe> {
  Color? _color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            if(_color == null) {
              _color = Color(0xffe74c3c);
            } else {
              _color = null;
            }
          });
        },
        icon: Icon(
          Icons.favorite,
          size: 30,
          color: _color,
        ));
  }
}
