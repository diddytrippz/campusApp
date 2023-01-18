import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/submitted_icon_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:styled_divider/styled_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlumbingWidget extends StatefulWidget {
  const PlumbingWidget({Key? key}) : super(key: key);

  @override
  _PlumbingWidgetState createState() => _PlumbingWidgetState();
}

class _PlumbingWidgetState extends State<PlumbingWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  String? issueValue;
  TextEditingController? reasonController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PLUMBING_PAGE_Plumbing_ON_PAGE_LOAD');
      logFirebaseEvent('Plumbing_update_local_state');
      setState(() {
        FFAppState().stepper1 = false;
        FFAppState().stepper2 = false;
        FFAppState().stepper3 = false;
      });
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Plumbing'});
    reasonController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    reasonController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 54,
          icon: Icon(
            Icons.arrow_back_sharp,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            logFirebaseEvent('PLUMBING_arrow_back_sharp_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'jc590b1w' /* Plumbing */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 30, 15, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: FFAppState().stepper0 == false
                                  ? FlutterFlowTheme.of(context)
                                      .secondaryBackground
                                  : Color(0xFFFFD113),
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  't10bkp7f' /* 1 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FFAppState().stepper0 == false
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'a6y9hrd1' /* Ticket */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      if (FFAppState().stepper0)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 130,
                              child: StyledVerticalDivider(
                                width: 35,
                                thickness: 2,
                                indent: 5,
                                lineStyle: DividerLineStyle.dashed,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 20, 10, 0),
                                      child: FlutterFlowDropDown<String>(
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            '2vc9ngr1' /* Damaged toilet sit */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'do6oxews' /* Damaged basin/sink */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '8mr0zlbr' /* Blocked urinal */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '09gy5buh' /* Blocked toilet */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'i79m2u0p' /* Blocked shower drain */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '8fa9zgzp' /* Low water pressure */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'umf56x2z' /* No cold water */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'vyirhvv7' /* No hot water */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'm6jbubx3' /* Shower head needs to be replac... */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'umlmwydw' /* Leaking gyser */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'k43129b3' /* Burst pipes */,
                                          )
                                        ],
                                        onChanged: (val) async {
                                          setState(() => issueValue = val);
                                          logFirebaseEvent(
                                              'PLUMBING_Issue_ON_FORM_WIDGET_SELECTED');
                                          logFirebaseEvent(
                                              'Issue_update_local_state');
                                          FFAppState().update(() {
                                            FFAppState().stepper1 = true;
                                          });
                                        },
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'ozwvoy59' /* Please select... */,
                                        ),
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 28,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .alternate,
                                        elevation: 8,
                                        borderColor: Color(0x00FFFFFF),
                                        borderWidth: 2,
                                        borderRadius: 8,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 12, 0),
                                        hidesUnderline: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 30, 20, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PLUMBING_PAGE_Text_dxvdjc81_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_validate_form');
                                              if (formKey.currentState ==
                                                      null ||
                                                  !formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }

                                              if (issueValue == null) {
                                                return;
                                              }

                                              logFirebaseEvent(
                                                  'Text_update_local_state');
                                              setState(() {
                                                FFAppState().stepper1 = true;
                                              });
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ez4u6ntv' /* CONTINUE */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    color: Color(0xFFFFD113),
                                                    fontWeight: FontWeight.w600,
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
                          ],
                        ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: FFAppState().stepper1 == false
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : Color(0xFFFFD113),
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'fdyas7pw' /* 2 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FFAppState().stepper1 == false
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'kfu13ryy' /* Description */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (FFAppState().stepper1)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 210,
                              child: StyledVerticalDivider(
                                width: 35,
                                thickness: 2,
                                indent: 5,
                                lineStyle: DividerLineStyle.dashed,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: TextFormField(
                                        controller: reasonController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '5warzutq' /* Describe your Issue */,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00C5C5C5),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00C5C5C5),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC00000),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC00000),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 40, 24, 0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: 5,
                                        keyboardType: TextInputType.name,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return FFLocalizations.of(context)
                                                .getText(
                                              'mpuocf3e' /* Field is required */,
                                            );
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 30, 20, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PLUMBING_PAGE_Text_ol50wl23_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_validate_form');
                                              if (formKey.currentState ==
                                                      null ||
                                                  !formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }

                                              if (issueValue == null) {
                                                return;
                                              }

                                              logFirebaseEvent(
                                                  'Text_update_local_state');
                                              setState(() {
                                                FFAppState().stepper2 = true;
                                              });
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'uie1r7ic' /* NEXT */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    color: Color(0xFFFFD113),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PLUMBING_PAGE_Text_9m8o1hmn_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_update_local_state');
                                                setState(() {
                                                  FFAppState().stepper1 = false;
                                                  FFAppState().stepper2 = false;
                                                });
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6tfj8vrq' /* BACK */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
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
                          ],
                        ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: FFAppState().stepper2 == false
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : Color(0xFFFFD113),
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'up841yek' /* 3 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FFAppState().stepper2 == false
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '2cogiv1q' /* Upload Image (Optional) */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (FFAppState().stepper2)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 280,
                              child: StyledVerticalDivider(
                                width: 35,
                                thickness: 2,
                                indent: 5,
                                lineStyle: DividerLineStyle.dashed,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Color(0x00C70707),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PLUMBING_PAGE_Column_y9sn9utb_ON_TAP');
                                              logFirebaseEvent(
                                                  'Column_upload_media_to_firebase');
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() =>
                                                    isMediaUploading = true);
                                                var downloadUrls = <String>[];
                                                try {
                                                  showUploadMessage(
                                                    context,
                                                    'Uploading file...',
                                                    showLoading: true,
                                                  );
                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  isMediaUploading = false;
                                                }
                                                if (downloadUrls.length ==
                                                    selectedMedia.length) {
                                                  setState(() =>
                                                      uploadedFileUrl =
                                                          downloadUrls.first);
                                                  showUploadMessage(
                                                      context,
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'z40c2u6r' /* File Uploaded! */,
                                                      ));
                                                } else {
                                                  setState(() {});
                                                  showUploadMessage(context,
                                                      'Failed to upload media');
                                                  return;
                                                }
                                              }
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (uploadedFileUrl != null &&
                                                    uploadedFileUrl != '')
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          uploadedFileUrl,
                                                          'https://static.vecteezy.com/system/resources/previews/004/968/473/original/upload-or-add-a-picture-jpg-file-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-etc-vector.jpg',
                                                        ),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.3,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                if (uploadedFileUrl == null ||
                                                    uploadedFileUrl == '')
                                                  Icon(
                                                    FFIcons.kimage,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 150,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 30, 20, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PLUMBING_PAGE_Text_o55fj993_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_update_local_state');
                                              setState(() {
                                                FFAppState().stepper3 = true;
                                              });
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zptzjea0' /* NEXT */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    color: Color(0xFFFFD113),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PLUMBING_PAGE_Text_5vuxgwju_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_update_local_state');
                                                setState(() {
                                                  FFAppState().stepper2 = false;
                                                  FFAppState().stepper3 = false;
                                                });
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'n52gxogb' /* BACK */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
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
                          ],
                        ),
                    ],
                  ),
                  if (FFAppState().stepper3)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 10, 20, 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PLUMBING_PAGE_SUBMIT_BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              final maintenanceCreateData =
                                  createMaintenanceRecordData(
                                issue: issueValue,
                                status: 'Submitted',
                                email: currentUserEmail,
                                createdTime: getCurrentTimestamp,
                                displayName: currentUserDisplayName,
                                notes: reasonController!.text,
                                rating: 0,
                                uid: currentUserUid,
                                category: 'Plumbing',
                                assigned: 'Maintenance Team',
                                photoUrl: uploadedFileUrl,
                                userRec: currentUserReference,
                                residence: valueOrDefault(
                                    currentUserDocument?.residence, ''),
                                cellNumber: valueOrDefault(
                                    currentUserDocument?.cellNumber, ''),
                                bedCode: valueOrDefault(
                                    currentUserDocument?.bedCode, ''),
                                ticketRef: random_data.randomString(
                                  9,
                                  9,
                                  true,
                                  true,
                                  true,
                                ),
                              );
                              await MaintenanceRecord.collection
                                  .doc()
                                  .set(maintenanceCreateData);
                              logFirebaseEvent('Button_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Color(0x64F5F5F5),
                                isDismissible: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: SubmittedIconWidget(),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            text: FFLocalizations.of(context).getText(
                              'sgc93anu' /* SUBMIT */,
                            ),
                            options: FFButtonOptions(
                              width: 120,
                              height: 35,
                              color: Color(0xFFCD350B),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(4),
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
