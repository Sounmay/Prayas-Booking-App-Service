import 'package:flutter/material.dart';

class StartService extends StatefulWidget {
  @override
  _StartServiceState createState() => _StartServiceState();
}

class _StartServiceState extends State<StartService> {
  bool started=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () {
              Navigator.pushNamed(context, '/otpscreen');
            },
          );
        }),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Service Details', style: TextStyle(color: Colors.black,),), //repeat for menu and booking
            ]
        ),
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0,),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Center(
                child: Column(
                  children: [
                    Text("Service Code"),
                    SizedBox(height: 5.0),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffCBFFF0),
                          border: Border.all(width: 1, color: Color(0xff02CF96))
                      ),
                      child: Center(
                        child:  Text("zp2260", style: TextStyle(color: Colors.black, fontSize: 20.0),),
                      )
                    )
                  ],
                ),
              )
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text("Customer Details", style: TextStyle(color: Color(0xff5D5FEF)),),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: EdgeInsets.fromLTRB(20.0, 0, 10.0, 0),
              padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffCBFFF0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/doctor.png"),
                    backgroundColor: Colors.blue,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Jay Prakash", textAlign: TextAlign.right,),
                        Text("+918249375008")
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("29/08/2021", style: TextStyle(color: Color(0xff5D5FEF)),),
                        Text("08:00AM - 10:00AM", style: TextStyle(color: Color(0xff5D5FEF)),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text("Services Availed", style: TextStyle(color: Color(0xff5D5FEF)),),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0, 10.0, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.radio_button_checked),
                          SizedBox(width: 20.0,),
                          Text("Haircut")
                        ],
                      ),
                      Text(
                          "Rs. 100"
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.radio_button_checked),
                          SizedBox(width: 20.0,),
                          Text("Haircut")
                        ],
                      ),
                      Text(
                          "Rs. 100"
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.radio_button_checked),
                          SizedBox(width: 20.0,),
                          Text("Haircut")
                        ],
                      ),
                      Text(
                          "Rs. 100"
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.radio_button_checked),
                          SizedBox(width: 20.0,),
                          Text("Haircut")
                        ],
                      ),
                      Text(
                          "Rs. 100"
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Net Amount : ", style: TextStyle(fontSize: 20),),
                            Text("Rs 400", style: TextStyle(fontSize: 20, color: Color(0xff5D5FEF)),),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(height: 40.0,),
                            Text("For 3 services (incl tax)"),

                          ],
                        )
                      ],
                    )
                  ),
                  SizedBox(height: 40.0,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Add service +',
                          style: TextStyle(color: Colors.white)),
                      style: TextButton.styleFrom(backgroundColor: Color(0xFF263238)),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff5D5FEF))
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          started=!started;
                        });
                        if(started==false){
                          Navigator.popAndPushNamed(context, '/otpscreen');
                        }
                      },
                      child: Text((started==false)?'Start Service':'Service Completed :-)',
                          style: TextStyle(color: Color(0xff5D5FEF))),
                      style: TextButton.styleFrom(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
