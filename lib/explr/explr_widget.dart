import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplrWidget extends StatefulWidget {
  const ExplrWidget({Key key}) : super(key: key);

  @override
  _ExplrWidgetState createState() => _ExplrWidgetState();
}

class _ExplrWidgetState extends State<ExplrWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0x00FFBA00),
      body: SafeArea(
        child: FlutterFlowWebView(
          url:
              'https://campusafrica.co.za/announcements/?filtertype=notice-board',
          bypass: true,
          verticalScroll: true,
          horizontalScroll: false,
        ),
      ),
    );
  }
}
