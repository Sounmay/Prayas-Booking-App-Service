import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ParlourBookings.dart';
import 'package:freelance_booking_app_service/Models/User.dart';
import 'package:freelance_booking_app_service/Providers/database.dart';
import 'package:freelance_booking_app_service/Screens/Authenticate.dart';
import 'package:freelance_booking_app_service/Screens/Schedule.dart';
import 'package:freelance_booking_app_service/Screens/ServiceKind.dart';
import 'package:freelance_booking_app_service/Widgets/NavigationWidget.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isRegistered = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _loadUserInfO();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return MultiProvider(providers: [
        StreamProvider<AppUserDetails>.value(
          initialData: AppUserDetails(uid: user.uid),
          value: DatabaseService().streamUser(),
          child: SelectePage(),
        ),
      ], child: SelectePage());
    }
  }
}

class SelectePage extends StatefulWidget {
  const SelectePage({Key key}) : super(key: key);

  @override
  _SelectePageState createState() => _SelectePageState();
}

class _SelectePageState extends State<SelectePage> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<AppUserDetails>(context);
    if (userDetails.name != "") {
      setState(() {
        isLoading = false;
      });
    }
    return isLoading == true
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            ),
          )
        : userDetails.isRegistered == true
            ? BottomNavBar()
            : ServiceKind();
  }
}
