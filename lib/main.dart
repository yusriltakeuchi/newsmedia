import 'package:flutter/material.dart';
import 'package:newsmedia/presentation/router/route_name.dart';
import 'package:newsmedia/presentation/router/router_generator.dart';

void main() {
  runApp(MyApp(
    routerGenerator: RouterGenerator(),
  ));
}

class MyApp extends StatelessWidget {
  final RouterGenerator routerGenerator;
  MyApp({
    required this.routerGenerator
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News Media",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: routerGenerator.generate,
      initialRoute: routeSplash,
    );
  }
}