import 'package:flutter/material.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';

class StartCookingWidget extends StatelessWidget {
  final RecipeDescriptionCubit cubit;
  const StartCookingWidget({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(106, 27, 90, 81),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff165932),
            minimumSize: const Size(232,48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25), // <-- Radius
            ),
          ),
          onPressed: () {
            cubit.startCooking();
          },
          child: const Text(
            "Начать готовить",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          )),
    );
  }
}
