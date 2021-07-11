import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/User.dart';
import 'package:freelance_booking_app_service/Providers/authProvider.dart';
import 'package:freelance_booking_app_service/Screens/ServiceKind.dart';
import 'package:freelance_booking_app_service/Screens/SplashScreen.dart';
import 'package:freelance_booking_app_service/Screens/Wrapper.dart';
import 'package:freelance_booking_app_service/Screens/uploadImage.dart';
import 'package:freelance_booking_app_service/Widgets/Login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      initialData: null,
      value: AuthProvider().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(0xff5D5FEF)),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/wrapper': (context) => Wrapper(),
          '/login': (context) => Login(),
          '/servicekind': (context) => ServiceKind(),
          '/uploadImage': (context) => UploadImage(),
        },
      ),
    );
  }
}
