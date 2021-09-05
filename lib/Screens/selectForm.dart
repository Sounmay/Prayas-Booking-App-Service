import 'package:flutter/material.dart';

class selectForm extends StatefulWidget {
  @override
  _selectFormState createState() => _selectFormState();
}

class _selectFormState extends State<selectForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile', style: TextStyle(color: Colors.black),),
        leading: BackButton(
            color: Colors.black
        ),
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.0),
            InkWell(
              onTap: (){

              },
              child: Container(
                width: MediaQuery.of(context).size.width*1,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xff5D5FEF)
                            ),
                            width: 5.0,
                            height: 30.0 ,
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            child: Text(
                                'Location details'
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text('1/2'),
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Text(
                                'FORM 1'
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*1,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                color: Colors.grey
              ),
              height: 1.0,
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                width: MediaQuery.of(context).size.width*1,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xff5D5FEF)
                            ),
                            width: 5.0,
                            height: 30.0 ,
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            child: Text(
                                'About'
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text('2/2'),
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Text(
                                'FORM 1'
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*1,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  color: Colors.grey
              ),
              height: 1.0,
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                width: MediaQuery.of(context).size.width*1,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xff5D5FEF)
                            ),
                            width: 5.0,
                            height: 30.0 ,
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            child: Text(
                                'Timings'
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text('1/2'),
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Text(
                                'FORM 2'
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*1,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  color: Colors.grey
              ),
              height: 1.0,
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                width: MediaQuery.of(context).size.width*1,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xff5D5FEF)
                            ),
                            width: 5.0,
                            height: 30.0 ,
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            child: Text(
                                'Services List'
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text('2/2'),
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Text(
                                'FORM 2'
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*1,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  color: Colors.grey
              ),
              height: 1.0,
            ),
          ],
        ),
      )
    );
  }
}
