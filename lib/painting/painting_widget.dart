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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaintingWidget extends StatefulWidget {
  const PaintingWidget({Key key}) : super(key: key);

  @override
  _PaintingWidgetState createState() => _PaintingWidgetState();
}

class _PaintingWidgetState extends State<PaintingWidget> {
  String budgetValue;
  String uploadedFileUrl = '';
  TextEditingController textController1;
  TextEditingController reasonController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'painting'});
    reasonController = TextEditingController();
    textController1 = TextEditingController(text: currentUserDisplayName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 54,
          icon: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            logFirebaseEvent('IconButton-ON_TAP');
            logFirebaseEvent('IconButton-Navigate-Back');
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Painting',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 5, 12, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                            color: Color(0x00C70707),
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                          ),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent('Column-ON_TAP');
                              logFirebaseEvent('Column-Upload-Photo-Video');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                final downloadUrls = await Future.wait(
                                    selectedMedia.map((m) async =>
                                        await uploadData(
                                            m.storagePath, m.bytes)));
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                if (downloadUrls != null) {
                                  setState(() =>
                                      uploadedFileUrl = downloadUrls.first);
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
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        uploadedFileUrl,
                                        'https://static.vecteezy.com/system/resources/previews/004/968/473/original/upload-or-add-a-picture-jpg-file-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-etc-vector.jpg',
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: AuthUserStreamWidget(
                        child: TextFormField(
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: ' ',
                            hintText: currentUserDisplayName,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).alternate,
                            suffixIcon: Icon(
                              FFIcons.kuser,
                              color: Color(0xFF757575),
                              size: 18,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          maxLines: 1,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: FlutterFlowDropDown(
                        options: [
                          'Ceiling needs to be painted',
                          'Door frame needs to be painted',
                          'Skirting needs to be painted',
                          'Walls needs to be painted',
                          'Window frames needs to be painted'
                        ].toList(),
                        onChanged: (val) => setState(() => budgetValue = val),
                        width: MediaQuery.of(context).size.width * 0.98,
                        height: 70,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                        hintText: 'Please select...',
                        icon: FaIcon(
                          FontAwesomeIcons.pen,
                          color: FlutterFlowTheme.of(context).campusGrey,
                          size: 16,
                        ),
                        fillColor: FlutterFlowTheme.of(context).alternate,
                        elevation: 8,
                        borderColor: Color(0x00FFFFFF),
                        borderWidth: 2,
                        borderRadius: 8,
                        margin: EdgeInsetsDirectional.fromSTEB(20, 0, 12, 0),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 40, 12, 0),
                      child: TextFormField(
                        controller: reasonController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Description ',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 40, 24, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Open Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                        textAlign: TextAlign.start,
                        maxLines: 5,
                        keyboardType: TextInputType.name,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Field is required';
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 50, 16, 50),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('Button-ON_TAP');
                          logFirebaseEvent('Button-Validate-Form');
                          if (!formKey.currentState.validate()) {
                            return;
                          }

                          if (budgetValue == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Field is required',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            );
                            return;
                          }

                          logFirebaseEvent('Button-Backend-Call');
                          await AirtableCall.call(
                            user: currentUserEmail,
                            issue: budgetValue,
                            room: currentUserDocument?.room,
                            building: currentUserDocument?.building,
                            status: 'Submitted',
                            created:
                                dateTimeFormat('d/M/y', getCurrentTimestamp),
                          );
                          logFirebaseEvent('Button-Backend-Call');

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
                            category: 'Painting',
                            isDone: false,
                            assigned: 'Maintenance Team',
                            photoUrl: uploadedFileUrl,
                          );
                          await MaintenanceRecord.collection
                              .doc()
                              .set(maintenanceCreateData);
                          logFirebaseEvent('Button-Bottom-Sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0x64F5F5F5),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: SubmittedIconWidget(),
                              );
                            },
                          );
                        },
                        text: 'Submit',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 55,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).title3.override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFFE2E3E7),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
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
            ),
          ),
        ),
      ),
    );
  }
}
