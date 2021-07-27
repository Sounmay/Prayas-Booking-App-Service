import 'package:date_format/date_format.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  String name = "Ramesh";
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.utc(1989);
  CalendarFormat _calendarFormat = CalendarFormat.month;
  String date;
  bool a1 = true, a2 = true, a3 = true;
  int evnt = 1;
  int sb = 1, eb = 0;

  @override
  void initState() {
    super.initState();
    date = formatDate(_focusedDay, [d, ' ', MM, ', ', yyyy]);
    if (evnt != 0) a3 = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 100,
                color: Color(0xFF0F2735),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),
                          Text(
                            'Hello !!',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20))
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 35),
                          CircleAvatar(
                              radius: 25,
                              foregroundImage:
                                  AssetImage('assets/doctor 3.png')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Schedule',
                style: TextStyle(color: Color(0xFF0F2735)),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TableCalendar(
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                      weekdayStyle: TextStyle(fontWeight: FontWeight.bold)),
                  headerStyle: HeaderStyle(
                      headerMargin: EdgeInsets.only(bottom: 20),
                      titleCentered: true,
                      titleTextStyle:
                          TextStyle(color: Colors.blue[700], fontSize: 18)),
                  weekendDays: [DateTime.sunday],
                  availableCalendarFormats: {_calendarFormat: 'Month'},
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      // update `_focusedDay` here as well
                      date = formatDate(_selectedDay, [d, ' ', MM, ',', yyyy]);
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  calendarStyle: CalendarStyle(
                      weekendTextStyle: TextStyle(color: Colors.blue[700]),
                      defaultTextStyle: TextStyle(color: Colors.blue[700]),
                      todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[100],
                      ),
                      todayTextStyle: TextStyle(color: Colors.black),
                      selectedTextStyle: TextStyle(color: Colors.black),
                      selectedDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink[50],
                      ),
                      withinRangeDecoration:
                          BoxDecoration(color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              Text(date,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              a3
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16.0)),
                              child: (Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Slot booked',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.0)),
                                ],
                              )),
                            )),
                        SizedBox(width: 15.0),
                        FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16.0)),
                              child: (Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Emergency booked',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.0)),
                                ],
                              )),
                            )),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            setState(() {
                              a1 = !a1;
                              if (a1 == false) {
                                a2 = true;
                              }
                            });
                          },
                          child: a1
                              ? Container(
                                  height: 35,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: (Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Slot booked',
                                          style: TextStyle(fontSize: 12.0)),
                                    ],
                                  )),
                                )
                              : Container(
                                  height: 35,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.greenAccent[100]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Slot booked  ',
                                          style: TextStyle(fontSize: 12.0)),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff00E7A4)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '$sb',
                                            style: TextStyle(fontSize: 12.0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        ),
                        SizedBox(width: 15.0),
                        FlatButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            setState(() {
                              a2 = !a2;
                              if (a2 == false) {
                                a1 = true;
                              }
                            });
                          },
                          child: a2
                              ? Container(
                                  height: 35,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.orange),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: (Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Emergency booked',
                                          style: TextStyle(fontSize: 12.0)),
                                    ],
                                  )),
                                )
                              : Container(
                                  height: 35,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.orange),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.pink[50]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Emergency booked  ',
                                          style: TextStyle(fontSize: 12.0)),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.yellow[300]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '$eb',
                                            style: TextStyle(fontSize: 12.0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    ),
              SizedBox(height: 20),
              a3
                  ? Column(children: [
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No bookings '),
                          Text(
                            'today',
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(height: 40)
                    ])
                  : Column(
                      children: [
                        a1
                            ? SizedBox(height: 80)
                            : Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 4,
                                            color: Color(0xFF3AD48A),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                        Icons
                                                            .access_time_outlined,
                                                        color:
                                                            Color(0xFF5D5FEF)),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      '8:00 AM - 10:00 AM',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  height: 35,
                                                  width: 160,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color(
                                                              0xFF5D5FEF)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.blue[50]),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text('Services booked  ',
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              color: Color(
                                                                  0xFF5D5FEF))),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Color(
                                                                    0xFF5D5FEF)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            '1',
                                                            style: TextStyle(
                                                                fontSize: 14.0,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Color(0xFF5D5FEF),
                                                    width: 2)),
                                            child: Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: Color(0xff5D5FEF)),
                                          )
                                        ],
                                      )),
                                ],
                              )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
