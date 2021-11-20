import 'dart:collection';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance_booking_app_service/Models/ParlourBookings.dart';
import 'package:freelance_booking_app_service/Models/User.dart';
import 'package:freelance_booking_app_service/Utils/Events.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  var kEvents;

  Map<DateTime, List<Event>> _kEventSource = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  var kToday;
  var kFirstDay;
  var kLastDay;

  String name = "";
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.utc(1989);
  CalendarFormat _calendarFormat = CalendarFormat.month;
  String date, timesl;
  bool a1 = true, a2 = true, a3 = true;
  int evnt = 0;
  int sb = 1, eb = 0;

  ValueNotifier<List<Event>> _selectedEvents;

  Map<DateTime, List<dynamic>> finaleventList = {};

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  // List<Event> _getEventsForRange(DateTime start, DateTime end) {
  //   // Implementation example
  //   final days = daysInRange(start, end);

  //   return [
  //     for (final d in days) ..._getEventsForDay(d),
  //   ];
  // }
  bool isLoad = true;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      date = formatDate(_selectedDay, [d, ' ', MM, ',', yyyy]);

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  _loadEvents() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('ServiceProviders')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get();

      List _eventList = data['event'];
      _kEventSource = {};

      kToday = DateTime.now();
      kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
      kLastDay = DateTime(kToday.year, kToday.month + 1, kToday.day);

      _eventList.forEach((element) {
        Timestamp mytimestamp = element['date'];
        DateTime _date = mytimestamp.toDate();
        if (_kEventSource
            .containsKey(DateTime.utc(_date.year, _date.month, _date.day))) {
          _kEventSource[DateTime.utc(_date.year, _date.month, _date.day)].add(
              Event(
                  customerName: element['name'],
                  serviceNames: element['serviceName'],
                  shopName: element['shopName'],
                  timeSlot: element['timeslot'],
                  subtotal: element['amount'],
                  id: element['id'],
                  address: element['address'],
                  uid: element['serviceId'],
                  otp: element['otp'],
                  price: element['price'],
                  timeList: element['serviceTimeList'],
                  day: element['date'],
                  time: element['serviceTime'],
                  isApproved: element['isApproved']));
        } else {
          _kEventSource[DateTime.utc(_date.year, _date.month, _date.day)] = [
            Event(
                customerName: element['name'],
                shopName: element['shopName'],
                serviceNames: element['serviceName'],
                timeSlot: element['timeslot'],
                subtotal: element['amount'],
                address: element['address'],
                uid: element['serviceId'],
                otp: element['otp'],
                id: element['id'],
                price: element['price'],
                timeList: element['serviceTimeList'],
                day: element['date'],
                time: element['serviceTime'],
                isApproved: element['isApproved'])
          ];
        }
      });

      kEvents = LinkedHashMap<DateTime, List<Event>>(
        equals: isSameDay,
        hashCode: getHashCode,
      )..addAll(_kEventSource);

      _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));

      setState(() {
        isLoad = false;
      });
    } catch (e) {
      print(e.toString());
    }
    _refreshController.refreshCompleted();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    date = formatDate(_focusedDay, [d, ' ', MM, ', ', yyyy]);

    _loadEvents();

    if (evnt != 0) a3 = false;
  }

  Widget build(BuildContext context) {
    final userDetails = Provider.of<AppUserDetails>(context);
    name = userDetails.name;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return isLoad
        ? Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()])))
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                backgroundColor: Color(0xFF0F2735),
                title: Text(
                    'Hello !!\n${name[0].toUpperCase()}${name.substring(1).toLowerCase()}'),
                actions: [
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profilepage',
                          arguments: {"userDetails": userDetails});
                    },
                    child: new Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(top: 4, right: 5),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: userDetails.image,
                          fit: BoxFit.fitHeight,
                          height: 40,
                          width: 40,

                          // placeholder: (context, url) =>
                          //     new Image.asset('assets/doctor.png'),
                          errorWidget: (context, url, error) => new Stack(
                            fit: StackFit.expand,
                            children: [
                              Icon(Icons.hide_image, size: 40),
                              ClipRRect(
                                // Clip it cleanly.
                                child: Container(
                                  color: Colors.grey[100].withOpacity(0.1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: false,
              header: ClassicHeader(
                completeIcon: Icon(Icons.done, color: Colors.green),
                refreshingIcon: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: Colors.blue,
                  ),
                ),
              ),
              onRefresh: () => _loadEvents(),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          // print(bookingList);
                        },
                        child: Text(
                          'Schedule',
                          style: TextStyle(color: Color(0xFF0F2735)),
                        ),
                      ),
                      SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TableCalendar(
                          daysOfWeekStyle: DaysOfWeekStyle(
                              weekendStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                              weekdayStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          headerStyle: HeaderStyle(
                              headerMargin: EdgeInsets.only(bottom: 20),
                              titleCentered: true,
                              titleTextStyle: TextStyle(
                                  color: Colors.blue[700], fontSize: 18)),
                          weekendDays: [DateTime.sunday],
                          availableCalendarFormats: {_calendarFormat: 'Month'},
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: _focusedDay,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: _onDaySelected,

                          //  (selectedDay, focusedDay) {
                          //   setState(() {
                          //     _selectedDay = selectedDay;
                          //     _focusedDay = focusedDay;
                          //     // update `_focusedDay` here as well

                          //   });
                          // },
                          eventLoader: _getEventsForDay,
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
                              weekendTextStyle:
                                  TextStyle(color: Colors.blue[700]),
                              defaultTextStyle:
                                  TextStyle(color: Colors.blue[700]),
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
                      SizedBox(height: 25),
                      Text(date,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      ValueListenableBuilder<List<Event>>(
                        valueListenable: _selectedEvents,
                        builder: (context, value, _) {
                          if (value.length < 1)
                            return Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlatButton(
                                      padding: EdgeInsets.all(0.0),
                                      onPressed: () {},
                                      child: Container(
                                        height: height * 0.05,
                                        width: width * 0.27,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(16.0)),
                                        child: (Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Slot booked',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12.0)),
                                          ],
                                        )),
                                      )),
                                  SizedBox(width: 15.0),
                                  FlatButton(
                                      padding: EdgeInsets.all(0.0),
                                      onPressed: () {},
                                      child: Container(
                                        height: height * 0.05,
                                        width: width * 0.30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(16.0)),
                                        child: (Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Emergency booked',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12.0)),
                                          ],
                                        )),
                                      )),
                                ],
                              ),
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
                            ]);
                          else
                            return Column(
                              children: [
                                Row(
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
                                      child: Container(
                                        height: height * 0.05,
                                        width: width * 0.27,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.green),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.greenAccent[100]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Slot booked  ',
                                                style:
                                                    TextStyle(fontSize: 12.0)),
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xff00E7A4)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '${value.length}',
                                                  style:
                                                      TextStyle(fontSize: 12.0),
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
                                        child: Container(
                                          height: height * 0.05,
                                          width: width * 0.30,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.orange),
                                              borderRadius:
                                                  BorderRadius.circular(16.0)),
                                          child: (Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Emergency booked',
                                                  style: TextStyle(
                                                      fontSize: 12.0)),
                                            ],
                                          )),
                                        )),
                                  ],
                                ),
                                SizedBox(height: 20),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: value.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 4.0,
                                        ),
                                        child: Column(children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Row(children: [
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
                                                            color: Color(
                                                                0xFF5D5FEF)),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          '${value[index].timeSlot}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                              BorderRadius
                                                                  .circular(20),
                                                          color:
                                                              Colors.blue[50]),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              'Services booked  ',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  color: Color(
                                                                      0xFF5D5FEF))),
                                                          Container(
                                                            decoration: BoxDecoration(
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
                                                                    fontSize:
                                                                        14.0,
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
                                              FlatButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/approval',
                                                      arguments: {
                                                        "date": date,
                                                        "timesl":
                                                            "${value[index].timeSlot}",
                                                        "event": value[index]
                                                      });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color:
                                                              Color(0xFF5D5FEF),
                                                          width: 2)),
                                                  child: Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                      color: Color(0xff5D5FEF)),
                                                ),
                                              )
                                            ])
                                            /*ListTile(
                                            onTap: () => print('${value[index]}'),
                                            title: Text('${value[index].service}'),
                                          )*/
                                            ,
                                          )
                                        ]));
                                  },
                                ),
                              ],
                            );
                        },
                      ),
                      // if (finaleventList[_selectedDay] != null)
                      //   ...finaleventList[_selectedDay]?.map((e) => Text(e.name)),
                      // SizedBox(height: 20),

                      // a3
                      //     ? Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           FlatButton(
                      //               padding: EdgeInsets.all(0.0),
                      //               onPressed: () {},
                      //               child: Container(
                      //                 padding: EdgeInsets.all(10),
                      //                 decoration: BoxDecoration(
                      //                     border: Border.all(color: Colors.grey),
                      //                     borderRadius: BorderRadius.circular(16.0)),
                      //                 child: (Row(
                      //                   mainAxisAlignment: MainAxisAlignment.center,
                      //                   children: [
                      //                     Text('Slot booked',
                      //                         style: TextStyle(
                      //                             color: Colors.grey, fontSize: 12.0)),
                      //                   ],
                      //                 )),
                      //               )),
                      //           SizedBox(width: 15.0),
                      //           FlatButton(
                      //               padding: EdgeInsets.all(0.0),
                      //               onPressed: () {},
                      //               child: Container(
                      //                 padding: EdgeInsets.all(10),
                      //                 decoration: BoxDecoration(
                      //                     border: Border.all(color: Colors.grey),
                      //                     borderRadius: BorderRadius.circular(16.0)),
                      //                 child: (Row(
                      //                   mainAxisAlignment: MainAxisAlignment.center,
                      //                   children: [
                      //                     Text('Emergency booked',
                      //                         style: TextStyle(
                      //                             color: Colors.grey, fontSize: 12.0)),
                      //                   ],
                      //                 )),
                      //               )),
                      //         ],
                      //       )
                      //     : Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           FlatButton(
                      //             padding: EdgeInsets.all(0.0),
                      //             onPressed: () {
                      //               setState(() {
                      //                 a1 = !a1;
                      //                 if (a1 == false) {
                      //                   a2 = true;
                      //                 }
                      //               });
                      //             },
                      //             child: a1
                      //                 ? Container(
                      //                     height: 35,
                      //                     width: 80,
                      //                     decoration: BoxDecoration(
                      //                         border: Border.all(color: Colors.green),
                      //                         borderRadius: BorderRadius.circular(16.0)),
                      //                     child: (Row(
                      //                       mainAxisAlignment: MainAxisAlignment.center,
                      //                       children: [
                      //                         Text('Slot booked',
                      //                             style: TextStyle(fontSize: 12.0)),
                      //                       ],
                      //                     )),
                      //                   )
                      //                 : Container(
                      //                     height: 35,
                      //                     width: 120,
                      //                     decoration: BoxDecoration(
                      //                         border: Border.all(color: Colors.green),
                      //                         borderRadius: BorderRadius.circular(20),
                      //                         color: Colors.greenAccent[100]),
                      //                     child: Row(
                      //                       mainAxisAlignment: MainAxisAlignment.center,
                      //                       children: [
                      //                         Text('Slot booked  ',
                      //                             style: TextStyle(fontSize: 12.0)),
                      //                         Container(
                      //                           decoration: BoxDecoration(
                      //                               shape: BoxShape.circle,
                      //                               color: Color(0xff00E7A4)),
                      //                           child: Padding(
                      //                             padding: const EdgeInsets.all(8.0),
                      //                             child: Text(
                      //                               '$sb',
                      //                               style: TextStyle(fontSize: 12.0),
                      //                             ),
                      //                           ),
                      //                         )
                      //                       ],
                      //                     ),
                      //                   ),
                      //           ),
                      //           SizedBox(width: 15.0),
                      //           FlatButton(
                      //             padding: EdgeInsets.all(0.0),
                      //             onPressed: () {
                      //               setState(() {
                      //                 a2 = !a2;
                      //                 if (a2 == false) {
                      //                   a1 = true;
                      //                 }
                      //               });
                      //             },
                      //             child: a2
                      //                 ? Container(
                      //                     height: 35,
                      //                     width: 120,
                      //                     decoration: BoxDecoration(
                      //                         border: Border.all(color: Colors.orange),
                      //                         borderRadius: BorderRadius.circular(16.0)),
                      //                     child: (Row(
                      //                       mainAxisAlignment: MainAxisAlignment.center,
                      //                       children: [
                      //                         Text('Emergency booked',
                      //                             style: TextStyle(fontSize: 12.0)),
                      //                       ],
                      //                     )),
                      //                   )
                      //                 : Container(
                      //                     height: 35,
                      //                     width: 160,
                      //                     decoration: BoxDecoration(
                      //                         border: Border.all(color: Colors.orange),
                      //                         borderRadius: BorderRadius.circular(20),
                      //                         color: Colors.pink[50]),
                      //                     child: Row(
                      //                       mainAxisAlignment: MainAxisAlignment.center,
                      //                       children: [
                      //                         Text('Emergency booked  ',
                      //                             style: TextStyle(fontSize: 12.0)),
                      //                         Container(
                      //                           decoration: BoxDecoration(
                      //                               shape: BoxShape.circle,
                      //                               color: Colors.yellow[300]),
                      //                           child: Padding(
                      //                             padding: const EdgeInsets.all(8.0),
                      //                             child: Text(
                      //                               '$eb',
                      //                               style: TextStyle(fontSize: 12.0),
                      //                             ),
                      //                           ),
                      //                         )
                      //                       ],
                      //                     ),
                      //                   ),
                      //           ),
                      //         ],
                      //       ),
                      // SizedBox(height: 20),
                      // a3
                      //     ? Column(children: [
                      //         SizedBox(height: 40),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text('No bookings '),
                      //             Text(
                      //               'today',
                      //               style: TextStyle(color: Colors.red),
                      //             )
                      //           ],
                      //         ),
                      //         SizedBox(height: 40)
                      //       ])
                      //     : Column(
                      //         children: [
                      //           a1
                      //               ? SizedBox(height: 80)
                      //               : Column(
                      //                   children: [
                      //                     Container(
                      //                         padding: EdgeInsets.all(10),
                      //                         child: Row(
                      //                           children: [
                      //                             Container(
                      //                               height: 80,
                      //                               width: 4,
                      //                               color: Color(0xFF3AD48A),
                      //                             ),
                      //                             SizedBox(width: 10),
                      //                             Expanded(
                      //                               child: Column(
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Row(
                      //                                     children: [
                      //                                       Icon(
                      //                                           Icons
                      //                                               .access_time_outlined,
                      //                                           color: Color(0xFF5D5FEF)),
                      //                                       SizedBox(width: 10),
                      //                                       Text(
                      //                                         '8:00 AM - 10:00 AM',
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight.bold,
                      //                                             fontSize: 16),
                      //                                       )
                      //                                     ],
                      //                                   ),
                      //                                   SizedBox(height: 10),
                      //                                   Container(
                      //                                     height: 35,
                      //                                     width: 160,
                      //                                     decoration: BoxDecoration(
                      //                                         border: Border.all(
                      //                                             color:
                      //                                                 Color(0xFF5D5FEF)),
                      //                                         borderRadius:
                      //                                             BorderRadius.circular(
                      //                                                 20),
                      //                                         color: Colors.blue[50]),
                      //                                     child: Row(
                      //                                       mainAxisAlignment:
                      //                                           MainAxisAlignment.center,
                      //                                       children: [
                      //                                         Text('Services booked  ',
                      //                                             style: TextStyle(
                      //                                                 fontSize: 14.0,
                      //                                                 color: Color(
                      //                                                     0xFF5D5FEF))),
                      //                                         Container(
                      //                                           decoration: BoxDecoration(
                      //                                               shape:
                      //                                                   BoxShape.circle,
                      //                                               color: Color(
                      //                                                   0xFF5D5FEF)),
                      //                                           child: Padding(
                      //                                             padding:
                      //                                                 const EdgeInsets
                      //                                                     .all(8.0),
                      //                                             child: Text(
                      //                                               '1',
                      //                                               style: TextStyle(
                      //                                                   fontSize: 14.0,
                      //                                                   color:
                      //                                                       Colors.white),
                      //                                             ),
                      //                                           ),
                      //                                         )
                      //                                       ],
                      //                                     ),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                             Container(
                      //                               padding: EdgeInsets.all(2),
                      //                               decoration: BoxDecoration(
                      //                                   shape: BoxShape.circle,
                      //                                   border: Border.all(
                      //                                       color: Color(0xFF5D5FEF),
                      //                                       width: 2)),
                      //                               child: Icon(
                      //                                   Icons.arrow_forward_ios_outlined,
                      //                                   color: Color(0xff5D5FEF)),
                      //                             )
                      //                           ],
                      //                         )),
                    ],
                  ),
                ),
              ),
            ));
  }
}
