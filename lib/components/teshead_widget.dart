import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TesheadWidget extends StatefulWidget {
  const TesheadWidget({Key key}) : super(key: key);

  @override
  _TesheadWidgetState createState() => _TesheadWidgetState();
}

class _TesheadWidgetState extends State<TesheadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            color: Color(0x2F1D2429),
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/seed/277/600',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Main Header',
                    style: FlutterFlowTheme.subtitle1,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'I’ll be working on a few different proposals, let me know when you’ve got time to go over them before the weekend.',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
