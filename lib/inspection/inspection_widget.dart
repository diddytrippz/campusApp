import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class InspectionWidget extends StatefulWidget {
  const InspectionWidget({Key key}) : super(key: key);

  @override
  _InspectionWidgetState createState() => _InspectionWidgetState();
}

class _InspectionWidgetState extends State<InspectionWidget> {
  String radioButtonValue1;
  String radioButtonValue2;
  String radioButtonValue3;
  String radioButtonValue4;
  String radioButtonValue5;
  String radioButtonValue6;
  String radioButtonValue7;
  String radioButtonValue8;
  String radioButtonValue9;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: AuthUserStreamWidget(
          child: Text(
            currentUserDocument?.building,
            style: FlutterFlowTheme.of(context).title1.override(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 16,
                ),
          ),
        ),
        actions: [
          Icon(
            Icons.drive_file_rename_outline,
            color: Colors.black,
            size: 24,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(22, 0, 16, 0),
            child: Icon(
              Icons.file_copy,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down_circle,
                                    color:
                                        FlutterFlowTheme.of(context).campusGrey,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Windows',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Icon(
                                      Icons.info_outlined,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .campusGrey,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: FlutterFlowRadioButton(
                      options: ['Good', 'Fair', 'Dirty', 'Repair', 'Replace'],
                      onChanged: (value) {
                        setState(() => radioButtonValue1 = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).campusRed,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).campusGrey,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down_circle,
                                    color:
                                        FlutterFlowTheme.of(context).campusGrey,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Door locks',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Icon(
                                      Icons.info_outlined,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .campusGrey,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: FlutterFlowRadioButton(
                      options: ['Good', 'Fair', 'Dirty', 'Repair', 'Replace'],
                      onChanged: (value) {
                        setState(() => radioButtonValue2 = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).campusRed,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).campusGrey,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down_circle,
                                    color:
                                        FlutterFlowTheme.of(context).campusGrey,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Plugs',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Icon(
                                      Icons.info_outlined,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .campusGrey,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: FlutterFlowRadioButton(
                      options: ['Good', 'Fair', 'Dirty', 'Repair', 'Replace'],
                      onChanged: (value) {
                        setState(() => radioButtonValue3 = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).campusRed,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).campusGrey,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down_circle,
                                    color:
                                        FlutterFlowTheme.of(context).campusGrey,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Study table & Desk',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Icon(
                                      Icons.info_outlined,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .campusGrey,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: FlutterFlowRadioButton(
                      options: ['Good', 'Fair', 'Dirty', 'Repair', 'Replace'],
                      onChanged: (value) {
                        setState(() => radioButtonValue4 = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).campusRed,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).campusGrey,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down_circle,
                                    color:
                                        FlutterFlowTheme.of(context).campusGrey,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Fridge',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Icon(
                                      Icons.info_outlined,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .campusGrey,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: FlutterFlowRadioButton(
                      options: ['Good', 'Fair', 'Dirty', 'Repair', 'Replace'],
                      onChanged: (value) {
                        setState(() => radioButtonValue5 = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).campusRed,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).campusGrey,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down_circle,
                                    color:
                                        FlutterFlowTheme.of(context).campusGrey,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Bathroom mirror',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Icon(
                                      Icons.info_outlined,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .campusGrey,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: FlutterFlowRadioButton(
                      options: ['Good', 'Fair', 'Dirty', 'Repair', 'Replace'],
                      onChanged: (value) {
                        setState(() => radioButtonValue6 = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).campusRed,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).campusGrey,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down_circle,
                                    color:
                                        FlutterFlowTheme.of(context).campusGrey,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Wardrobe',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Icon(
                                      Icons.info_outlined,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .campusGrey,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: FlutterFlowRadioButton(
                      options: ['Good', 'Fair', 'Dirty', 'Repair', 'Replace'],
                      onChanged: (value) {
                        setState(() => radioButtonValue7 = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).campusRed,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).campusGrey,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down_circle,
                                    color:
                                        FlutterFlowTheme.of(context).campusGrey,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Bed',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Icon(
                                      Icons.info_outlined,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .campusGrey,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: FlutterFlowRadioButton(
                      options: ['Good', 'Fair', 'Dirty', 'Repair', 'Replace'],
                      onChanged: (value) {
                        setState(() => radioButtonValue8 = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).campusRed,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).campusGrey,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down_circle,
                                    color:
                                        FlutterFlowTheme.of(context).campusGrey,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Carpet',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Icon(
                                      Icons.info_outlined,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .campusGrey,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: FlutterFlowRadioButton(
                      options: ['Good', 'Fair', 'Dirty', 'Repair', 'Replace'],
                      onChanged: (value) {
                        setState(() => radioButtonValue9 = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).campusRed,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).campusGrey,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
