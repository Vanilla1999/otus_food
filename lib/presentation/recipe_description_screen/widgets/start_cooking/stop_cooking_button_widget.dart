import 'package:flutter/material.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';

class StopCookingButtonWidget extends StatelessWidget {
  final RecipeDescriptionCubit cubit;
  const StopCookingButtonWidget({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27,bottom: 90),
      child: Center(
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.fromLTRB(40, 14, 40, 13),
              side:const BorderSide(width: 4,color: const Color(0xff165932)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25), // <-- Radius
              ),
            ),
            onPressed: () {
              cubit.startCooking();
            },
            child: const Text(
              "Закончить готовить",
              maxLines: 1,
              style: TextStyle(
                  color: const Color(0xff165932), fontWeight: FontWeight.w500, fontSize: 16),
            )),
      ),
    );
  }
}
