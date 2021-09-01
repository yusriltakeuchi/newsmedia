
import 'package:flutter/material.dart';
import 'package:newsmedia/presentation/router/route_name.dart';
import 'package:newsmedia/presentation/screens/home/home_screen.dart';
import 'package:newsmedia/presentation/screens/splash/splash_screen.dart';

class RouterGenerator {

  /// Generating route for screen
  Route? generate(RouteSettings settings) {
    switch(settings.name) {
      
      case routeSplash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen()
        );

      case routeHome:
        return MaterialPageRoute(
          builder: (_) => HomeScreen()
        );
      default:
        return null;
    }
  }
}