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
    Navigator.pushNamedAndRemoveUntil(context, routeHome, (route) => false);
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor),
              shape: BoxShape.circle
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.location_city, 
                color: primaryColor, 
                size: 80,
              ),
            ),
          ),
          SizedBox(height: setHeight(20)),
          Text(
            "News Media",
            style: styleTitle.copyWith(
              fontSize: setFontSize(50)
            ),
          ),
        ],
      ),
    );
  }
}