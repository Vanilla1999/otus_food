import 'package:flutter/material.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';

class StartCookingButtonWidget extends StatelessWidget {
  final RecipeDescriptionCubit cubit;
  const StartCookingButtonWidget({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27,bottom: 90),
      child: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff165932),
              padding: const EdgeInsets.fromLTRB(50, 14, 50, 13),
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
      ),
    );
  }
}
