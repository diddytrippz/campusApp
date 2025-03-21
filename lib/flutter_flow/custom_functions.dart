import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

String capitalia(String? inputtext) {
  // make a string all uppercase
  if (inputtext == null) {
    return '';
  } else
    return inputtext.toUpperCase();
}

String? initials(String? myNames) {
  // return the first letter of the word
  if (myNames == null) return null;
  final List<String> letterBag = [];
  List<String> splitNames = myNames.split(' ');
  splitNames.forEach((element) {
    letterBag.add(element[0]);
  });
  return letterBag.reduce((a, b) {
    return a + b;
  });
}

bool timeLimit() {
  // if current time is between 22:00 and 09:00 return boolean true, else return boolean false
  final DateTime now = DateTime.now();
  final DateTime start = DateTime(now.year, now.month, now.day, 22);
  final DateTime end = DateTime(now.year, now.month, now.day, 9);
  if (now.isAfter(start) || now.isBefore(end)) {
    return true;
  } else {
    return false;
  }
}

DateTime? newTime() {
  // subtract 96 hours from current date
  DateTime now = DateTime.now();
  DateTime newTime = now.subtract(Duration(hours: 96));
  return newTime;
}

String? countDays(DateTime? daysSince) {
  // count number of days since date input to todays
  if (daysSince == null) {
    return null;
  }
  var now = DateTime.now();
  var difference = now.difference(daysSince);
  var days = difference.inDays;
  return days.toString();
}

int hours(DateTime? date) {
  // calculate number of hours from date input
  if (date == null) {
    return 0;
  }
  final now = DateTime.now();
  final difference = now.difference(date);
  return difference.inHours;
}

DateTime convertTime(int? hours) {
  // convert interger (hours) into time passed (ago) i.e 24 hours would be yesterday
  final now = DateTime.now();
  final timeAgo = now.subtract(Duration(hours: hours ?? 0));
  return timeAgo;
}

String? responseTime(
  List<DateTime> date1,
  List<DateTime> date2,
) {
  //  find average number of days between the two dates input
  if (date1.length != date2.length) {
    return null;
  }

  int totalDays = 0;

  for (int i = 0; i < date1.length; i++) {
    totalDays += date2[i].difference(date1[i]).inDays.abs();
  }

  double averageDays = totalDays / date1.length;

  return averageDays.toStringAsFixed(2);
}

String? medianTime(
  List<DateTime> time1,
  List<DateTime> time2,
) {
  // find median response time from two date inputs
// Combine the two lists of DateTime objects
  final List<DateTime> combinedTimes = [...time1, ...time2];

  // Sort the combined list in ascending order
  combinedTimes.sort();

  // Calculate the middle index of the sorted list
  final int middleIndex = combinedTimes.length ~/ 2;

  // Check if the list has an odd or even number of elements
  if (combinedTimes.length % 2 == 0) {
    // If the list has an even number of elements, calculate the average of the two middle elements
    final DateTime middleTime1 = combinedTimes[middleIndex - 1];
    final DateTime middleTime2 = combinedTimes[middleIndex];
    final Duration medianDuration = middleTime2.difference(middleTime1);
    final String medianTimeString = DateFormat.Hms()
        .format(DateTime(0, 0, 0, 0, 0, medianDuration.inSeconds));
    return medianTimeString;
  } else {
    // If the list has an odd number of elements, return the middle element
    final DateTime middleTime = combinedTimes[middleIndex];
    final String medianTimeString =
        DateFormat.Hms().format(DateTime(0, 0, 0, 0, 0, middleTime.second));
    return medianTimeString;
  }
}

DateTime? newCustomFunction() {
  DateTime getTodaysDate() {
    return DateTime.now().toLocal();
  }
}
