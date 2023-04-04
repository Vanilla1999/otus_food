import 'package:flutter/material.dart';
import 'package:otus_food/data/model/recipe.dart';

class DescriptionWidget extends StatelessWidget {
  final Recipe recipeList;

  const DescriptionWidget({Key? key, required this.recipeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Expanded(child: Padding(
        //   padding: const EdgeInsets.fromLTRB(17, 27.6, 17, 23), child:,),),
      ],
    );
  }
}


