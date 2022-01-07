import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Lottie.network(
            'https://assets2.lottiefiles.com/packages/lf20_aZTdD5.json',
            width: 150,
            height: 130,
            fit: BoxFit.cover,
            animate: true,
          ),
        ),
      ),
    );
  }
}
