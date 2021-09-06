import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Widgets/NavigationWidget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      // Navigator.popAndPushNamed(context, '/details3');
      Navigator.popAndPushNamed(context, '/wrapper');
    });
    return Scaffold(
      body: Container(
        color: Color(0xff5D5FEF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/ps logo 200 x 200.png',
              height: 100,
              width: 100,
            )),
          ],
        ),
      ),
    );
  }
}
