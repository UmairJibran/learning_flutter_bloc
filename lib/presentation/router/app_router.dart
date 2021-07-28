import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (ctx) => MyHomePage(
            title: 'Flutter Counter via CUBIT',
          ),
        );
      case SecondScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => SecondScreen(
            title: 'Second Screen',
            color: Colors.cyan,
          ),
        );
      case ThirdScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => ThirdScreen(
            title: 'Third Screen',
            color: Colors.indigoAccent,
          ),
        );
      default:
        return null;
    }
  }
}
