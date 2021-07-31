import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/User.dart';
import 'package:freelance_booking_app_service/Providers/ParlourDetailsProvider.dart';
import 'package:freelance_booking_app_service/Providers/authProvider.dart';
import 'package:freelance_booking_app_service/Providers/database.dart';
import 'package:freelance_booking_app_service/Screens/Approval.dart';
import 'package:freelance_booking_app_service/Screens/DoctorScreens/DoctorLocation.dart';
import 'package:freelance_booking_app_service/Screens/OTPScreen.dart';
import 'package:freelance_booking_app_service/Screens/ParlourScreens/DetailsThird.dart';
import 'package:freelance_booking_app_service/Screens/ParlourScreens/ParlourServices.dart';
import 'package:freelance_booking_app_service/Screens/ParlourScreens/DetailsSecond.dart';
import 'package:freelance_booking_app_service/Screens/ParlourScreens/FinalEditPage.dart';
import 'package:freelance_booking_app_service/Screens/ParlourScreens/ParlourLocation.dart';
import 'package:freelance_booking_app_service/Screens/SalonScreens/SalonLocation.dart';
import 'package:freelance_booking_app_service/Screens/Schedule.dart';
import 'package:freelance_booking_app_service/Screens/ServiceKind.dart';
import 'package:freelance_booking_app_service/Screens/SplashScreen.dart';
import 'package:freelance_booking_app_service/Screens/StartService.dart';
import 'package:freelance_booking_app_service/Screens/Wrapper.dart';
import 'package:freelance_booking_app_service/Screens/uploadImage.dart';
import 'package:freelance_booking_app_service/Utils/sharedPreferencesForm.dart';
import 'package:freelance_booking_app_service/Widgets/Login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferencesForm.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      initialData: null,
      value: AuthProvider().user,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => ParlourDetailsProvider()),
          if (FirebaseAuth.instance?.currentUser?.uid != null)
            StreamProvider<AppUserDetails>.value(
              initialData: AppUserDetails(
                  uid: FirebaseAuth.instance?.currentUser?.uid ?? ''),
              value: DatabaseService().streamUser(),
              child: Wrapper(),
            ),
        ],
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
            '/doctorlocation': (context) => DoctorLocation(),
            '/parlourlocation': (context) => ParlourLocation(),
            '/salonlocation': (context) => SalonLocation(),
            '/finalParlourPage': (context) => FinalEditPage(),
            '/details2': (context) => DetailsSecond(),
            '/details3': (context) => DetailsThird(),
            '/schedule': (context) => Schedule(),
            '/otpscreen': (context) => OTPScreen(),
            '/ps': (context) => ParlourServices(),
            '/startservice': (context) => StartService(),
            '/approval': (context) => Approval()
          },
        ),
      ),
    );
  }
}
