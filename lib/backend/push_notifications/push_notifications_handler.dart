import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryColor,
          child: Center(
            child: Image.asset(
              'assets/images/campus_logo_1.png',
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.75,
              fit: BoxFit.scaleDown,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'onboarding': ParameterData.none(),
  'login': ParameterData.none(),
  'view': (data) async => ParameterData(
        allParams: {
          'completeTemp': getParameter<double>(data, 'completeTemp'),
        },
      ),
  'rules': ParameterData.none(),
  'chats': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.serializer),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'appliances': ParameterData.none(),
  'Plumbing': ParameterData.none(),
  'Furniture': ParameterData.none(),
  'Electrical': ParameterData.none(),
  'Locksmith': ParameterData.none(),
  'PestControl': ParameterData.none(),
  'Painting': ParameterData.none(),
  'Others': ParameterData.none(),
  'reviews': (data) async => ParameterData(
        allParams: {
          'jobReviews': await getDocumentParameter<MaintenanceRecord>(
              data, 'jobReviews', MaintenanceRecord.serializer),
        },
      ),
  'settings': ParameterData.none(),
  'home': ParameterData.none(),
  'messages': ParameterData.none(),
  'sendNotifications': ParameterData.none(),
  'information': (data) async => ParameterData(
        allParams: {
          'jobs': await getDocumentParameter<MaintenanceRecord>(
              data, 'jobs', MaintenanceRecord.serializer),
        },
      ),
  'notifications': ParameterData.none(),
  'addInspection': ParameterData.none(),
  'search': ParameterData.none(),
  'Communal': ParameterData.none(),
  'visitorsManagement': ParameterData.none(),
  'myVisitors': ParameterData.none(),
  'dashboard': ParameterData.none(),
  'loadshedding': ParameterData.none(),
  'eskomArea': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
