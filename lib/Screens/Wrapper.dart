import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/User.dart';
import 'package:freelance_booking_app_service/Screens/Authenticate.dart';
import 'package:freelance_booking_app_service/Screens/ServiceKind.dart';
import 'package:freelance_booking_app_service/Widgets/NavigationWidget.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isLoading = true;
  bool isRegistered = false;

  _loadUserInfO() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get();
      if (data['serviceRegistered'] == true) {
        setState(() {
          isLoading = false;
          isRegistered = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadUserInfO();
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<AppUserDetails>(context);

    final user = Provider.of<AppUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return isLoading == true
          ? Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                ),
              ),
            )
          : userDetails.isRegistered == false
              ? ServiceKind()
              : BottomNavBar();
    }
  }
}
