import 'package:flutter/material.dart';

// not implemented

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case feedRoute:
        return MaterialPageRoute(builder: (_) => Feed());
      case detailsRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Details(data));
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => Settings());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}