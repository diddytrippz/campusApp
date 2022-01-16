import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UibtnWidget extends StatefulWidget {
  const UibtnWidget({Key key}) : super(key: key);

  @override
  _UibtnWidgetState createState() => _UibtnWidgetState();
}

class _UibtnWidgetState extends State<UibtnWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.primaryColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x411D2429),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
        child: FFButtonWidget(
          onPressed: () async {
            Navigator.pop(context);
          },
          text: 'Proceed to Checkout',
          options: FFButtonOptions(
            width: 150,
            height: 60,
            color: FlutterFlowTheme.primaryColor,
            textStyle: FlutterFlowTheme.title3.override(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
            elevation: 0,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: 50,
          ),
        ),
      ),
    );
  }
}
