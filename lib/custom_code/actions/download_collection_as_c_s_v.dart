// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert' show utf8;
import 'package:download/download.dart';

Future downloadCollectionAsCSV(List<MaintenanceRecord>? docs) async {
  docs = docs ?? [];

  String fileContent =
      "email, issue, notes, residence, bedCode, category, status";

  docs.asMap().forEach((index, record) => fileContent = fileContent +
      "\n" +
      record.email.toString() +
      "," +
      record.issue.toString() +
      "," +
      record.notes.toString() +
      "," +
      record.residence.toString() +
      "," +
      record.bedCode.toString() +
      "," +
      record.category.toString() +
      "," +
      record.status.toString());

  final fileName =
      "CampusAfricaMaintenance" + DateTime.now().toString() + ".csv";

  // Encode the string as a List<int> of UTF-8 bytes
  var bytes = utf8.encode(fileContent);

  final stream = Stream.fromIterable(bytes);
  return download(stream, fileName);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
