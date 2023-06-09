import 'package:flutter/material.dart';
import 'screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const recipeListScreen = '/';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  static const initialRoute = MainNavigationRouteNames.recipeListScreen;

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.recipeListScreen:
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeRecipeListScreen(),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
