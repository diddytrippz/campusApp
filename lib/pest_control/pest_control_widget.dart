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

class PestControlWidget extends StatefulWidget {
  const PestControlWidget({Key? key}) : super(key: key);

  @override
  _PestControlWidgetState createState() => _PestControlWidgetState();
}

class _PestControlWidgetState extends State<PestControlWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  String? budgetValue;
  TextEditingController? reasonController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PEST_CONTROL_PestControl_ON_LOAD');
      logFirebaseEvent('PestControl_update_local_state');
      setState(() {
        FFAppState().stepper1 = false;
        FFAppState().stepper2 = false;
        FFAppState().stepper3 = false;
      });
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PestControl'});
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
            logFirebaseEvent('PEST_CONTROL_arrow_back_sharp_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'ctsohp9i' /* Pest Control */,
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
                                  '4d9h6gdl' /* 1 */,
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
                                'cyzedgny' /* Ticket */,
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
                                            'mrji6w0d' /* Bed bugs */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'y0mts8m5' /* Cockroaches in my room/unit */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'ummqz3se' /* Fumigation required */,
                                          )
                                        ],
                                        onChanged: (val) async {
                                          setState(() => budgetValue = val);
                                          logFirebaseEvent(
                                              'PEST_CONTROL_budget_ON_FORM_WIDGET_SELEC');
                                          logFirebaseEvent(
                                              'budget_update_local_state');
                                          FFAppState().update(() {
                                            FFAppState().stepper1 = true;
                                          });
                                        },
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.98,
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
                                          'scmqufl9' /* Please select... */,
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
                                                  'PEST_CONTROL_PAGE_Text_s9oakxaq_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_validate_form');
                                              if (formKey.currentState ==
                                                      null ||
                                                  !formKey.currentState!
                                                      .validate()) {
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
                                                'xb2dtomc' /* CONTINUE */,
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
                                    '7hix49jw' /* 2 */,
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
                                  'iq4m7el3' /* Description */,
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
                                            'nnp8rcw2' /* Describe your Issue */,
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
                                                  'PEST_CONTROL_PAGE_Text_5c0mk2p8_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_validate_form');
                                              if (formKey.currentState ==
                                                      null ||
                                                  !formKey.currentState!
                                                      .validate()) {
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
                                                'vyy868yq' /* CONTINUE */,
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
                                                    'PEST_CONTROL_PAGE_Text_fgf1i3ls_ON_TAP');
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
                                                  'pviiw42u' /* PREVIOUS */,
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
                                    'ecv6832q' /* 3 */,
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
                                  'zu5a0xl6' /* Upload Image (Optional) */,
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
                                          20, 0, 20, 0),
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
                                                  'PEST_CONTROL_PAGE_Column_5h489num_ON_TAP');
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
                                                  'PEST_CONTROL_PAGE_Text_vhlgnhkm_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_update_local_state');
                                              setState(() {
                                                FFAppState().stepper3 = true;
                                              });
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'xhvvti7y' /* CONTINUE */,
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
                                                    'PEST_CONTROL_PAGE_Text_5wmpst4x_ON_TAP');
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
                                                  '2d7b66qp' /* PREVIOUS */,
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
                                  'PEST_CONTROL_PAGE_SUBMIT_BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              final maintenanceCreateData =
                                  createMaintenanceRecordData(
                                issue: budgetValue,
                                status: 'Submitted',
                                email: currentUserEmail,
                                createdTime: getCurrentTimestamp,
                                displayName: currentUserDisplayName,
                                notes: reasonController!.text,
                                rating: 0,
                                uid: currentUserUid,
                                category: 'Pest Control',
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
                              '0ab4f6ky' /* SUBMIT */,
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
