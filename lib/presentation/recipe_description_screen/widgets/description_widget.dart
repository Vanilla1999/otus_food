import 'package:flutter/material.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/presentation/components/title_time_widget.dart';

class DescriptionWidget extends StatelessWidget {
  final Recipe recipe;

  const DescriptionWidget({Key? key, required this.recipe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       TitleWithTimeWidget(time: recipe.time, name: recipe.name)
      ],
    );
  }
}


