import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviwWidget extends StatefulWidget {
  const ReviwWidget({Key key}) : super(key: key);

  @override
  _ReviwWidgetState createState() => _ReviwWidgetState();
}

class _ReviwWidgetState extends State<ReviwWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 32,
      constraints: BoxConstraints(
        maxHeight: 32,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF3124A1),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x32171717),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.rate_review_rounded,
              color: FlutterFlowTheme.tertiaryColor,
              size: 20,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              child: Text(
                'Review',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.tertiaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
