import 'package:flutter/material.dart';
import 'package:otus_food/utils/colors.dart';
import 'package:otus_food/utils/images.dart';

class AppbarDescriptionStart extends StatelessWidget implements PreferredSizeWidget {
  const AppbarDescriptionStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff2ECC71),
      title: const Text("Рецепт",
          style: TextStyle(
              color: Color(0xff165932),
              fontSize: 20,
              fontWeight: FontWeight.w400)),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          changeSystemColor(ColorsApp.defaultBackground);
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      actions: [
        InkResponse(
          borderRadius: BorderRadius.circular(40),
          radius: 40,
          child: const Image(
            image: AssetImage(Images.megaphone),
          ),
          onTap: () {},
        ),
      ],
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
