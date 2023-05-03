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
        return _createRoute(_screenFactory.makeRecipeListScreen());
      case MainNavigationRouteNames.recipeDescriptionScreen:
        final arguments = settings.arguments;
        final recipe = arguments as Recipe;
        return _createRoute(_screenFactory.makeRecipeDescriptionScreen(recipe));
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }

  Route<Object> _createRoute(Widget widget) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 1500),
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin1 = Offset(1.0, 0.0);
        const end1 = Offset(-0.03, 0.0);
        const begin2 = Offset(-0.03, 0.0);
        const end2 = Offset(0.0, 0.0);
        final tween = Tween(begin: 0.0, end: 1.0);
        final scaleAnimation = TweenSequence(
          <TweenSequenceItem<Offset>>[
            TweenSequenceItem<Offset>(
              tween: Tween(begin: begin1, end: end1)
                  .chain(CurveTween(curve: Curves.ease)),
              weight: 50.0,
            ),
            TweenSequenceItem<Offset>(
              tween: Tween(begin: begin2, end: end2)
                  .chain(CurveTween(curve: Curves.ease)),
              weight: 50.0,
            ),
          ],
        );
        if (animation.status == AnimationStatus.reverse) {
          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        } else {
          return SlideTransition(
            position: animation.drive(scaleAnimation),
            child: child,
          );
        }
      },
    );
  }
}
