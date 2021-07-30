import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String name;
  final String service;
  final String amount;
  final String timeslot;

  const Event({this.name, this.service, this.amount, this.timeslot});

  // @override
  // String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
