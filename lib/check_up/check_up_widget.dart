import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckUpWidget extends StatefulWidget {
  const CheckUpWidget({Key? key}) : super(key: key);

  @override
  _CheckUpWidgetState createState() => _CheckUpWidgetState();
}

class _CheckUpWidgetState extends State<CheckUpWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      logFirebaseEvent('CHECK_UP_PAGE_checkUp_ON_PAGE_LOAD');
      logFirebaseEvent('checkUp_Wait-Delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      if ((valueOrDefault(currentUserDocument?.role, '')) == 'Admin') {
        logFirebaseEvent('checkUp_Navigate-To');
        context.pushNamed('dashboard');
      } else {
        logFirebaseEvent('checkUp_Navigate-To');
        context.pushNamed('homePage');
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'checkUp'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                height: MediaQuery.of(context).size.width * 0.55,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/campus_logo_1.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
