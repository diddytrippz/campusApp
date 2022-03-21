import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../onboarding/onboarding_widget.dart';
import '../../login_page/login_page_widget.dart';
import '../../verification/verification_widget.dart';
import '../../rules_book/rules_book_widget.dart';
import '../../more_info/more_info_widget.dart';
import '../../chat_page/chat_page_widget.dart';
import '../../edit_profile/edit_profile_widget.dart';
import '../../students/students_widget.dart';
import '../../plumbing/plumbing_widget.dart';
import '../../furniture/furniture_widget.dart';
import '../../appliances/appliances_widget.dart';
import '../../electrical/electrical_widget.dart';
import '../../locksmith/locksmith_widget.dart';
import '../../painting/painting_widget.dart';
import '../../pestcontrol/pestcontrol_widget.dart';
import '../../others/others_widget.dart';
import '../../users_search/users_search_widget.dart';
import '../../appliances_copy/appliances_copy_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
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
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/campus_logo_1.png',
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.75,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'onboarding': (data) async => OnboardingWidget(),
  'loginPage': (data) async => LoginPageWidget(),
  'verification': (data) async => VerificationWidget(),
  'settingsPage': (data) async => NavBarPage(initialPage: 'SettingsPageWidget'),
  'viewPage': (data) async => NavBarPage(initialPage: 'ViewPageWidget'),
  'rulesBook': (data) async => RulesBookWidget(),
  'moreInfo': (data) async => MoreInfoWidget(
        jobStatus: await getDocumentParameter(
            data, 'jobStatus', MaintenanceRecord.serializer),
      ),
  'ChatPage': (data) async => ChatPageWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'editProfile': (data) async => EditProfileWidget(),
  'MessagesPage': (data) async => NavBarPage(initialPage: 'MessagesPageWidget'),
  'students': (data) async => StudentsWidget(),
  'Plumbing': (data) async => PlumbingWidget(),
  'Furniture': (data) async => FurnitureWidget(),
  'Appliances': (data) async => AppliancesWidget(),
  'Electrical': (data) async => ElectricalWidget(),
  'Locksmith': (data) async => LocksmithWidget(),
  'painting': (data) async => PaintingWidget(),
  'Pestcontrol': (data) async => PestcontrolWidget(),
  'Others': (data) async => OthersWidget(),
  'usersSearch': (data) async => UsersSearchWidget(),
  'AppliancesCopy': (data) async => AppliancesCopyWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

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
