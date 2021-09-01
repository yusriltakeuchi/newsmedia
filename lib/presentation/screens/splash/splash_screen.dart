import 'package:flutter/material.dart';
import 'package:newsmedia/config/constant.dart';
import 'package:newsmedia/presentation/router/route_name.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void moveToHome() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushNamed(context, routeHome);
  }

  @override
  void initState() {
    super.initState();
    this.moveToHome();
  }
  @override
  Widget build(BuildContext context) {
    /// Initialize screen utils
    setupScreenUtil(context);
    return Scaffold(
      body: _logoWidget(),
    );
  }

  Widget _logoWidget() {
    return Center(
      child: Text(
        "News Media",
        style: styleTitle.copyWith(
          fontSize: setFontSize(30)
        ),
      ),
    );
  }
}