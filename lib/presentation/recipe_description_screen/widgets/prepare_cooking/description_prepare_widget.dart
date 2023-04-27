import 'dart:io';

import 'package:flutter/material.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/presentation/components/title_time_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_state.dart';
import 'package:otus_food/utils/extention.dart';

class DescriptionPrepareWidget extends StatelessWidget {
  final Recipe recipe;
  final RecipeDescriptionCubit cubit;

  const DescriptionPrepareWidget(
      {Key? key, required this.recipe, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          const SizedBox(
            width: 19,
          )
        ],
      ),
      const SizedBox(
        height: 16.28,
      ),
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 17),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              clipBehavior: Clip.hardEdge,
              child: Image.file(
                File(recipe.img),
                height: 220.38,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 17),
            child: CustomPaint(
              painter: _CustomFavoritePaint(2),
              child: Container(height: 220.38,width: double.infinity,),
            ),
          ),
        ],
      )
    ]);
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
            if (_color == null) {
              _color = const Color(0xffe74c3c);
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

class _CustomFavoritePaint extends CustomPainter {
  final int number;
  _CustomFavoritePaint(this.number);

  var painte = Paint()
    ..color = const Color(0xff2ecc71)
    ..style = PaintingStyle.fill;
  var path = Path();


  @override
  void paint(Canvas canvas, Size size) {
    _drawContainer(canvas,size);
    _drawNumber(canvas,size,number);
  }

  void _drawNumber(Canvas canvas,Size size,int number){
    const textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontSize: 14,
    );
    final textSpan = TextSpan(
      text: '$number',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.rtl,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 24,
    );
    textPainter.paint(canvas, Offset(size.width - 7-12,  size.height-17.46-16));
  }

  void _drawContainer(Canvas canvas,Size size){
    path.moveTo(size.width-66, size.height-13.46-23);
    path.lineTo(size.width, size.height-13.46-23);
    path.lineTo(size.width, size.height-13.46);
    path.lineTo(size.width-66, size.height-13.46);
    path.lineTo(size.width-40.62, size.height-13.46 - (23/2));
    path.lineTo(size.width-66, size.height-13.46-23);
    canvas.drawPath(path, painte);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
