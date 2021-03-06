import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SendNotificationsWidget extends StatefulWidget {
  const SendNotificationsWidget({Key? key}) : super(key: key);

  @override
  _SendNotificationsWidgetState createState() =>
      _SendNotificationsWidgetState();
}

class _SendNotificationsWidgetState extends State<SendNotificationsWidget> {
  DateTime? datePicked;
  bool? checkboxListTileValue;
  String? teamSelectValue;
  TextEditingController? shortBioController;
  TextEditingController? userNameController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'sendNotifications'});
    shortBioController = TextEditingController();
    userNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'ptxfts7r' /* Add Notes */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('SEND_NOTIFICATIONS_close_rounded_ICN_ON_');
                logFirebaseEvent('IconButton_Navigate-Back');
                context.pop();
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: TextFormField(
                            controller: userNameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'de2wj84r' /* Notification title */,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 32, 20, 12),
                            ),
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16,
                                ),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return FFLocalizations.of(context).getText(
                                  '9y9lg112' /* Field is required */,
                                );
                              }

                              if (val.length > 80) {
                                return 'Maximum 80 characters allowed, currently ${val.length}.';
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
                          child: TextFormField(
                            controller: shortBioController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                '5kakixgn' /* Enter description here... */,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 32, 20, 12),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            textAlign: TextAlign.start,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return FFLocalizations.of(context).getText(
                                  'aw8n6o4a' /* Field is required */,
                                );
                              }

                              if (val.length > 160) {
                                return 'Maximum 160 characters allowed, currently ${val.length}.';
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 22, 16, 0),
                          child: FlutterFlowDropDown(
                            options: [
                              FFLocalizations.of(context).getText(
                                'rt4p4j5i' /* Bookings */,
                              ),
                              FFLocalizations.of(context).getText(
                                'xis2q63f' /* Announcement */,
                              ),
                              FFLocalizations.of(context).getText(
                                'eb8fsf8x' /* Reminder */,
                              ),
                              FFLocalizations.of(context).getText(
                                '3ygaqska' /* Newsletter */,
                              )
                            ],
                            onChanged: (val) =>
                                setState(() => teamSelectValue = val),
                            width: double.infinity,
                            height: 60,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'r5jkai5h' /* Notification Type */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 15,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2,
                            borderColor:
                                FlutterFlowTheme.of(context).campusGrey,
                            borderWidth: 1,
                            borderRadius: 6,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(24, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SEND_NOTIFICATIONS_Container_zy60xpys_ON');
                                      logFirebaseEvent(
                                          'Container_Date-Time-Picker');
                                      await DatePicker.showDatePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked = date);
                                        },
                                        currentTime: getCurrentTimestamp,
                                        minTime: getCurrentTimestamp,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .campusGrey,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18, 5, 18, 5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                    'yMMMd', datePicked!),
                                                'Select Date',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                            Icon(
                                              Icons.date_range_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.44,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .campusGrey,
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            unselectedWidgetColor:
                                                Color(0xFF95A1AC),
                                          ),
                                          child: CheckboxListTile(
                                            value: checkboxListTileValue ??=
                                                false,
                                            onChanged: (newValue) => setState(
                                                () => checkboxListTileValue =
                                                    newValue!),
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '48bf7x8r' /* Everyone */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title3
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            tileColor: Color(0x00F5F5F5),
                                            activeColor: Color(0xFFCA350B),
                                            dense: true,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(40, 24, 30, 30),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SEND_NOTIFICATIONS_SEND_NOTIFICATION_BTN');
                              logFirebaseEvent('Button_Validate-Form');
                              if (formKey.currentState == null ||
                                  !formKey.currentState!.validate()) {
                                return;
                              }

                              if (datePicked == null) {
                                return;
                              }

                              if ((checkboxListTileValue) == true) {
                                logFirebaseEvent('Button_Backend-Call');

                                final notificationsCreateData =
                                    createNotificationsRecordData(
                                  title: userNameController!.text,
                                  sentBy: currentUserDisplayName,
                                  building: valueOrDefault(
                                      currentUserDocument?.building, ''),
                                  dateCreate: getCurrentTimestamp,
                                  urgency: teamSelectValue,
                                  sendToAll: true,
                                );
                                await NotificationsRecord.collection
                                    .doc()
                                    .set(notificationsCreateData);
                              } else {
                                logFirebaseEvent('Button_Backend-Call');

                                final notificationsCreateData =
                                    createNotificationsRecordData(
                                  title: userNameController!.text,
                                  sentBy: currentUserDisplayName,
                                  building: valueOrDefault(
                                      currentUserDocument?.building, ''),
                                  dateCreate: getCurrentTimestamp,
                                  urgency: teamSelectValue,
                                  sendToAll: false,
                                );
                                await NotificationsRecord.collection
                                    .doc()
                                    .set(notificationsCreateData);
                              }

                              logFirebaseEvent('Button_Show-Snack-Bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Announcement successfully created',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              );
                              logFirebaseEvent('Button_Navigate-To');
                              context.pushNamed('notifications');
                            },
                            text: FFLocalizations.of(context).getText(
                              '2mgjnl4w' /* Send Notification */,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
