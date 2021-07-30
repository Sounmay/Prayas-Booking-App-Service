import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Widgets/NavigationWidget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
<<<<<<< HEAD
      Navigator.popAndPushNamed(context, '/otpscreen');
=======
      Navigator.popAndPushNamed(context, '/servicekind');
>>>>>>> 8635c3e90a7bbeff607dfb98e6de2067b1b12c8c
      // Navigator.popAndPushNamed(context, '/servicekind');
    });
    return Scaffold(
      body: Container(
        color: Color(0xff5D5FEF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/splashLogo.png',
              height: 100,
              width: 100,
            )),
          ],
        ),
      ),
    );
  }
}
