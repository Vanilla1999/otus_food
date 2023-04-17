import 'package:flutter/material.dart';
import 'package:otus_food/data/model/ingredient.dart';

class IngridientsWidgets extends StatelessWidget {
  final List<Ingredient> ingredients;

  const IngridientsWidgets({Key? key, required this.ingredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ингредиенты"),
        SizedBox(
          height: 18,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff797676)),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 8, 18),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _IngridientItem(
                  ingredient: ingredients[index],
                );
              },
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
          height: 3,
          width: 3,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(360))),
        )
      ],
    );
  }
}
