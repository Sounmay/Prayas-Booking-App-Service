import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Widgets/NavigationWidget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
<<<<<<< HEAD
      Navigator.popAndPushNamed(context, '/servicekind');
=======
      Navigator.popAndPushNamed(context, '/otpscreen');
>>>>>>> 69d621b3cabde071774f617e1e4744b75859f44c
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
