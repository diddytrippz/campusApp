import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TessstWidget extends StatefulWidget {
  const TessstWidget({Key? key}) : super(key: key);

  @override
  _TessstWidgetState createState() => _TessstWidgetState();
}

class _TessstWidgetState extends State<TessstWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: Image.asset(
            'assets/images/Vector_(2).png',
          ).image,
        ),
      ),
    );
  }
}
