import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChsseWidget extends StatefulWidget {
  const ChsseWidget({Key key}) : super(key: key);

  @override
  _ChsseWidgetState createState() => _ChsseWidgetState();
}

class _ChsseWidgetState extends State<ChsseWidget> {
  String choiceChipsValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 220,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFDBE2E7),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: FlutterFlowChoiceChips(
              initialOption: choiceChipsValue ??= 'Personal',
              options: [ChipData('Personal'), ChipData('Building')],
              onChanged: (val) => setState(() => choiceChipsValue = val),
              selectedChipStyle: ChipStyle(
                backgroundColor: Color(0xFF262D34),
                textStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 16,
                ),
                iconColor: Colors.white,
                iconSize: 18,
                labelPadding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                elevation: 4,
              ),
              unselectedChipStyle: ChipStyle(
                backgroundColor: Color(0xFFDBE2E7),
                textStyle: FlutterFlowTheme.bodyText2.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF262D34),
                  fontSize: 16,
                ),
                iconColor: Color(0xFF262D34),
                iconSize: 18,
                labelPadding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                elevation: 0,
              ),
              chipSpacing: 8,
            ),
          ),
        ),
      ],
    );
  }
}
