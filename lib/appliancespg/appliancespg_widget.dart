import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/submitted_icon_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AppliancespgWidget extends StatefulWidget {
  const AppliancespgWidget({Key key}) : super(key: key);

  @override
  _AppliancespgWidgetState createState() => _AppliancespgWidgetState();
}

class _AppliancespgWidgetState extends State<AppliancespgWidget> {
  String budgetValue;
  TextEditingController textController1;
  TextEditingController reasonController;
  String uploadedFileUrl = '';
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    reasonController = TextEditingController();
    textController1 = TextEditingController(text: uploadedFileUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          'Back',
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    'Appliances',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22,
                        ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          elevation: 2,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final selectedMedia = await selectMediaWithSourceBottomSheet(
            context: context,
            allowPhoto: true,
          );
          if (selectedMedia != null &&
              validateFileFormat(selectedMedia.storagePath, context)) {
            showUploadMessage(
              context,
              'Uploading file...',
              showLoading: true,
            );
            final downloadUrl = await uploadData(
                selectedMedia.storagePath, selectedMedia.bytes);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            if (downloadUrl != null) {
              setState(() => uploadedFileUrl = downloadUrl);
              showUploadMessage(
                context,
                'File Uploaded!',
              );
            } else {
              showUploadMessage(
                context,
                'Failed to upload media',
              );
              return;
            }
          }
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.perm_media_rounded,
          color: Color(0xFFE2E3E7),
          size: 24,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  elevation: 40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 5, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(18, 25, 0, 0),
                            child: Text(
                              'Issue',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          FlutterFlowDropDown(
                            options: [
                              'Stove not working',
                              'Oven not working',
                              'Microwave not working',
                              'Fridge not working'
                            ].toList(),
                            onChanged: (val) =>
                                setState(() => budgetValue = val),
                            width: MediaQuery.of(context).size.width * 0.98,
                            height: 70,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintText: 'Please select...',
                            icon: FaIcon(
                              FontAwesomeIcons.pen,
                              color: FlutterFlowTheme.of(context).campusGrey,
                              size: 16,
                            ),
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 8,
                            borderColor: Color(0x00FFFFFF),
                            borderWidth: 2,
                            borderRadius: 8,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 12, 0),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: textController1,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Uploaded File URL',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .campusGrey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .campusGrey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6, 4, 12, 0),
                                  child: AutoSizeText(
                                    uploadedFileUrl,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: reasonController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Description •',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC5C5C5),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC5C5C5),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 40, 24, 0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            keyboardType: TextInputType.name,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 30, 16, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (!formKey.currentState.validate()) {
                                        return;
                                      }

                                      if (budgetValue == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Field is required',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        );
                                        return;
                                      }

                                      final maintenanceCreateData =
                                          createMaintenanceRecordData(
                                        issue: budgetValue,
                                        status: 'Submitted',
                                        email: currentUserEmail,
                                        createdTime: getCurrentTimestamp,
                                        displayName: currentUserDisplayName,
                                        room: currentUserDocument?.room,
                                        building: currentUserDocument?.building,
                                        notes: reasonController.text,
                                        rating: 0,
                                        uid: currentUserUid,
                                        category: 'Appliances',
                                        isDone: false,
                                        assigned: 'Maintenace Team',
                                        photoUrl: uploadedFileUrl,
                                      );
                                      await MaintenanceRecord.collection
                                          .doc()
                                          .set(maintenanceCreateData);
                                      await AirtableCall.call(
                                        user: currentUserEmail,
                                        issue: budgetValue,
                                        room: currentUserDocument?.room,
                                        building: currentUserDocument?.building,
                                        status: 'Submitted',
                                        created: dateTimeFormat(
                                            'd/M/y', getCurrentTimestamp),
                                      );
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x64F5F5F5),
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: SubmittedIconWidget(),
                                          );
                                        },
                                      );
                                    },
                                    text: 'Submit form',
                                    icon: FaIcon(
                                      FontAwesomeIcons.edit,
                                      size: 20,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 7,
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
            ],
          ),
        ),
      ),
    );
  }
}
