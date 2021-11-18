import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Providers/authProvider.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthProvider _auth = AuthProvider();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  String name = '';
  String password = '';
  String error = '';
  String number = '';

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return loading
        ? Container(
            color: Color(0xff5D5FEF),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            ]),
          )
        : MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                    color: Color(0xff5D5FEF),
                    height: deviceHeight,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Logo (Service app) bl (200 x 200).png',
                            height: 120,
                            width: 120,
                          ),
                          SizedBox(
                            height: deviceHeight * 0.025,
                          ),
                          Flexible(
                            child: Text(
                              "Create a service account",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              SizedBox(height: 15.0),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Row(children: [
                                    Text(
                                      "Enter Your Name",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ])),
                              TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Name',
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                    ),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                  ),
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter your Name' : null,
                                  onChanged: (val) {
                                    setState(() => name = val);
                                  }),
                              SizedBox(height: 18.0),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Row(children: [
                                    Text(
                                      "Enter Phone Number",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ])),
                              TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Phone Number',
                                    prefixIcon: Icon(
                                      Icons.call_outlined,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                  ),
                                  validator: (val) {
                                    Pattern pattern = r'^[6-9]{1}[0-9]{9}$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(val))
                                      return 'Enter Valid Phone Number';
                                    else
                                      return null;
                                  },
                                  onChanged: (val) {
                                    setState(() => number = val);
                                  }),
                              SizedBox(height: 18.0),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Row(children: [
                                    Text(
                                      "Enter Password",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ])),
                              TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Password',
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                  ),
                                  validator: (val) =>
                                      val.length < 1 ? 'Enter password' : null,
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  }),
                              SizedBox(height: 18.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: TextButton(
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 25),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFF0F2735),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      print(name);
                                      print(number);
                                      print(password);
                                      dynamic result = await _auth
                                          .registerWithEmailAndPassword(
                                              name, false, number, password);
                                      if (result == null) {
                                        setState(() {
                                          error = 'please supply a valid email';
                                          loading = false;
                                        });
                                      }
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Or, If you have an account, ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        widget.toggleView();
                                      },
                                      child: Text('Login',
                                          style: TextStyle(
                                              color: Colors.red[800],
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    )
                                  ])
                            ]),
                          ),
                        ])),
              ),
            ),
          );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
