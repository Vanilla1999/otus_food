import 'package:flutter/material.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/presentation/components/styles.dart';

class IngridientsWidget extends StatelessWidget {
  final List<Ingredient> ingredients;

  const IngridientsWidget({Key? key, required this.ingredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 22.54, 16, 18),
          child: Text(
            "Ингредиенты",
            style:title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17, right: 16),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff797676), width: 5),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 18),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return _IngridientItem(
                    ingredient: ingredients[index],
                  );
                },
                itemCount: ingredients.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _IngridientItem extends StatelessWidget {
  final Ingredient ingredient;

  const _IngridientItem({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 4,
          width: 4,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black,),
              color: Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(360))),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            ingredient.name,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
        Text(ingredient.amount)
      ],
    );
  }
}
