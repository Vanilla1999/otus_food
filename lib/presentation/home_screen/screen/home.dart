import 'package:flutter/material.dart';
import 'package:otus_food/navigation/screen_factory.dart';
import 'package:otus_food/presentation/account_screen/screen/account_screen.dart';
import 'package:otus_food/utils/colors.dart';
import 'package:otus_food/utils/flutter-icons-1f06c6de/my_flutter_app_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static  final List<Widget> _widgetOptions = <Widget>[
    ScreenFactory().makeRecipeListScreen(),
    ScreenFactory().makeAccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.defaultBackground,
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize:10 ,
          unselectedFontSize:10 ,
          selectedItemColor: const Color(0xff2ecc71),
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.only(bottom: 3),
                child: Icon(
                    MyFlutterApp.pizza_slice
                ),
              ),
              label: 'Рецепты',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.only(bottom: 3),
                child: Icon(
                    Icons.person
                ),
              ),
              label: 'Вход',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
