import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsmedia/injector.dart';
import 'package:newsmedia/logic/bloc/news_bloc.dart';
import 'package:newsmedia/presentation/router/route_name.dart';
import 'package:newsmedia/presentation/router/router_generator.dart';

void main() {
  /// Initialize injector
  setupInjector();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsBloc(),
        )
      ],
      child: MaterialApp(
        title: "News Media",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "DMSans"
        ),
        onGenerateRoute: routerGenerator.generate,
        initialRoute: routeSplash,
      ),
    );
  }
}