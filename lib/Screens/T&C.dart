import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TC extends StatefulWidget {
  @override
  _TCState createState() => _TCState();
}

class _TCState extends State<TC> {

  String data = '';
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('assets/T&C.txt');
    setState(() {
      data = responseText;
    });
  }

  @override
  void initState(){
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Terms and Conditions', style: TextStyle(color: Colors.black),),
        leading: BackButton(
            color: Colors.black
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(data),
          ],
        ),
      ),
    );
  }
}
