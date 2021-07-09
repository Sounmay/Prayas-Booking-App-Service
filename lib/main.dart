import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Screens/SplashScreen.dart';
import 'package:freelance_booking_app_service/Screens/ServiceKind.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xff5D5FEF)),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/servicekind': (context) => ServiceKind()
      },
    );
  }
}
