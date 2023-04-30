import 'package:flutter/material.dart';
import 'package:otus_food/data/model/recipe.dart';

import 'screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const home = '/';
  static const recipeListScreen = '/recipes';
  static const recipeDescriptionScreen = '/recipeDescription';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  static const initialRoute = MainNavigationRouteNames.home;

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.home:
        return MaterialPageRoute(
          builder: (_) => _screenFactory.home(),
        );
      case MainNavigationRouteNames.recipeListScreen:
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeRecipeListScreen(),
        );
      case MainNavigationRouteNames.recipeDescriptionScreen:
        final arguments = settings.arguments;
        final recipe = arguments as Recipe;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeRecipeDescriptionScreen(recipe),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
