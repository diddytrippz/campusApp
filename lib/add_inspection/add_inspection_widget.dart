import '../backend/firebase_storage/storage.dart';
import '../components/side_nav_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddInspectionWidget extends StatefulWidget {
  const AddInspectionWidget({Key? key}) : super(key: key);

  @override
  _AddInspectionWidgetState createState() => _AddInspectionWidgetState();
}

class _AddInspectionWidgetState extends State<AddInspectionWidget> {
  bool isMediaUploading1 = false;
  String uploadedFileUrl1 = '';

  bool isMediaUploading2 = false;
  String uploadedFileUrl2 = '';

  bool isMediaUploading3 = false;
  String uploadedFileUrl3 = '';

  String? radioButtonValue1;
  TextEditingController? textController1;
  bool isMediaUploading4 = false;
  String uploadedFileUrl4 = '';

  bool isMediaUploading5 = false;
  String uploadedFileUrl5 = '';

  bool isMediaUploading6 = false;
  String uploadedFileUrl6 = '';

  String? radioButtonValue2;
  TextEditingController? textController2;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'addInspection'});
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController1?.dispose();
    textController2?.dispose();
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
            logFirebaseEvent('ADD_INSPECTION_arrow_back_sharp_ICN_ON_T');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'hc0sgg24' /* PROPERTY INSPECTION */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 16,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
            ))
              SideNavWidget(
                nav1Color: FlutterFlowTheme.of(context).primaryText,
                nav2Color: FlutterFlowTheme.of(context).primaryText,
                nav3Color: FlutterFlowTheme.of(context).primaryText,
                nav4Color: FlutterFlowTheme.of(context).primaryText,
                nav5Color: FlutterFlowTheme.of(context).primaryText,
                nav6Color: FlutterFlowTheme.of(context).primaryText,
                nav7Color: FlutterFlowTheme.of(context).primaryText,
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 30, 15, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFBA00),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'u740c6t1' /* 1 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'wg5xzsdu' /* BEDROOM */,
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
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '22h154gr' /* 2 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ph9fkpp0' /* BATHROOM */,
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
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'aadwvt1i' /* 3 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'kzdnbhgd' /* KITCHEN */,
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '16l0g8hp' /* Issue */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (FFAppState().stepper0)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 120,
                                        child: StyledVerticalDivider(
                                          width: 30,
                                          thickness: 2,
                                          lineStyle: DividerLineStyle.dashed,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 15, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 15, 20, 20),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'ADD_INSPECTION_INSPECT_PROPERTY_BTN_ON_T');
                                                        logFirebaseEvent(
                                                            'Button_validate_form');
                                                        if (formKey.currentState ==
                                                                null ||
                                                            !formKey
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }

                                                        logFirebaseEvent(
                                                            'Button_update_local_state');
                                                        setState(() {
                                                          FFAppState()
                                                              .stepper1 = true;
                                                        });
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'k3vm8kee' /* INSPECT PROPERTY */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Color(
                                                                      0xFFFFBA00),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                        elevation: 0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFBA00),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'x1gr0syr' /* 1 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'yclrg9p6' /* WINDOWS (BEDROOM) */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 420,
                                        child: StyledVerticalDivider(
                                          width: 30,
                                          thickness: 2,
                                          lineStyle: DividerLineStyle.dashed,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 15, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FlutterFlowRadioButton(
                                                      options: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'nep1tnoe' /* Better Condition */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'pahxgznc' /* Good Condition */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'e8qhtvh9' /* Bad Condition */,
                                                        )
                                                      ].toList(),
                                                      onChanged: (val) =>
                                                          setState(() =>
                                                              radioButtonValue1 =
                                                                  val),
                                                      optionHeight: 35,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                      buttonPosition:
                                                          RadioButtonPosition
                                                              .left,
                                                      direction:
                                                          Axis.horizontal,
                                                      radioButtonColor:
                                                          Color(0xFFCD350B),
                                                      inactiveRadioButtonColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      toggleable: false,
                                                      horizontalAlignment:
                                                          WrapAlignment.start,
                                                      verticalAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                    ),
                                                    StyledDivider(
                                                      height: 40,
                                                      thickness: 2,
                                                      lineStyle:
                                                          DividerLineStyle
                                                              .dashed,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 15),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '19hdumvr' /* Gallery */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          if (!FFAppState()
                                                              .inspHideGallery)
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ADD_INSPECTION_PAGE_Icon_kq4ce82i_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_update_local_state');
                                                                setState(() {
                                                                  FFAppState()
                                                                          .inspHideGallery =
                                                                      true;
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .add_circle_outline,
                                                                color: Color(
                                                                    0xFFCD350B),
                                                                size: 22,
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                              .inspHideGallery)
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ADD_INSPECTION_PAGE_Icon_o4gi052t_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_update_local_state');
                                                                setState(() {
                                                                  FFAppState()
                                                                          .inspHideGallery =
                                                                      false;
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .remove_circle_outline,
                                                                color: Color(
                                                                    0xFFCD350B),
                                                                size: 22,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                        .inspHideGallery)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 20,
                                                                    0, 20),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ADD_INSPECTION_Container_fh2caz2a_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Container_upload_media_to_firebase');
                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  allowPhoto:
                                                                      true,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  setState(() =>
                                                                      isMediaUploading1 =
                                                                          true);
                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    isMediaUploading1 =
                                                                        false;
                                                                  }
                                                                  if (downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                    setState(() =>
                                                                        uploadedFileUrl1 =
                                                                            downloadUrls.first);
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }
                                                              },
                                                              child: Container(
                                                                width: 60,
                                                                height: 60,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                ),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kimage,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ADD_INSPECTION_Container_h8y10zqm_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Container_upload_media_to_firebase');
                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  allowPhoto:
                                                                      true,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  setState(() =>
                                                                      isMediaUploading2 =
                                                                          true);
                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    isMediaUploading2 =
                                                                        false;
                                                                  }
                                                                  if (downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                    setState(() =>
                                                                        uploadedFileUrl2 =
                                                                            downloadUrls.first);
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }
                                                              },
                                                              child: Container(
                                                                width: 60,
                                                                height: 60,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                ),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kimage,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ADD_INSPECTION_Container_cst8500d_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Container_upload_media_to_firebase');
                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  allowPhoto:
                                                                      true,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  setState(() =>
                                                                      isMediaUploading3 =
                                                                          true);
                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    isMediaUploading3 =
                                                                        false;
                                                                  }
                                                                  if (downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                    setState(() =>
                                                                        uploadedFileUrl3 =
                                                                            downloadUrls.first);
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }
                                                              },
                                                              child: Container(
                                                                width: 60,
                                                                height: 60,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                ),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kimage,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 15),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '75g7llyt' /* Comments */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          if (!FFAppState()
                                                              .inspHideComments)
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ADD_INSPECTION_PAGE_Icon_nblii8t4_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_update_local_state');
                                                                setState(() {
                                                                  FFAppState()
                                                                          .inspHideComments =
                                                                      true;
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .add_circle_outline,
                                                                color: Color(
                                                                    0xFFCD350B),
                                                                size: 22,
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                              .inspHideComments)
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ADD_INSPECTION_PAGE_Icon_fhs1qf33_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_update_local_state');
                                                                setState(() {
                                                                  FFAppState()
                                                                          .inspHideComments =
                                                                      false;
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .remove_circle_outline,
                                                                color: Color(
                                                                    0xFFCD350B),
                                                                size: 22,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                        .inspHideComments)
                                                      TextFormField(
                                                        controller:
                                                            textController1,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '94czi21b' /* Comments */,
                                                          ),
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'bcy603ah' /*   */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2,
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFD7D7D7),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFD7D7D7),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontSize: 14,
                                                                ),
                                                        maxLines: 3,
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 30,
                                                                  20, 20),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ADD_INSPECTION_PAGE_Text_qrytaqrl_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Text_validate_form');
                                                              if (formKey.currentState ==
                                                                      null ||
                                                                  !formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }

                                                              logFirebaseEvent(
                                                                  'Text_update_local_state');
                                                              setState(() {
                                                                FFAppState()
                                                                        .stepper2 =
                                                                    true;
                                                              });
                                                            },
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'q97u56wf' /* NEXT */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: Color(
                                                                        0xFFCD350B),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ADD_INSPECTION_PAGE_Text_12emeg7u_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Text_update_local_state');
                                                                setState(() {
                                                                  FFAppState()
                                                                          .stepper1 =
                                                                      false;
                                                                  FFAppState()
                                                                          .stepper2 =
                                                                      false;
                                                                });
                                                              },
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'qbew9eyl' /* BACK */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: FlutterFlowTheme.of(
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
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '1ja0gg0u' /* 2 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'dn3pcsgw' /* DOORS (BEDROOM) */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 420,
                                        child: StyledVerticalDivider(
                                          width: 30,
                                          thickness: 2,
                                          indent: 5,
                                          lineStyle: DividerLineStyle.dashed,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 15, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FlutterFlowRadioButton(
                                                      options: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'di1d0jbi' /* Better Condition */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'jxnsc5zx' /* Good Condition */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4scg0y76' /* Bad Condition */,
                                                        )
                                                      ].toList(),
                                                      onChanged: (val) =>
                                                          setState(() =>
                                                              radioButtonValue2 =
                                                                  val),
                                                      optionHeight: 35,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                      buttonPosition:
                                                          RadioButtonPosition
                                                              .left,
                                                      direction:
                                                          Axis.horizontal,
                                                      radioButtonColor:
                                                          Color(0xFFCD350B),
                                                      inactiveRadioButtonColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      toggleable: false,
                                                      horizontalAlignment:
                                                          WrapAlignment.start,
                                                      verticalAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                    ),
                                                    StyledDivider(
                                                      height: 40,
                                                      thickness: 2,
                                                      lineStyle:
                                                          DividerLineStyle
                                                              .dashed,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 15),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'qpoiz94u' /* Gallery */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .remove_circle_outline,
                                                            color: Color(
                                                                0xFFCD350B),
                                                            size: 22,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 20, 0, 20),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ADD_INSPECTION_Container_g1449syo_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_upload_media_to_firebase');
                                                              final selectedMedia =
                                                                  await selectMediaWithSourceBottomSheet(
                                                                context:
                                                                    context,
                                                                allowPhoto:
                                                                    true,
                                                              );
                                                              if (selectedMedia !=
                                                                      null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                setState(() =>
                                                                    isMediaUploading4 =
                                                                        true);
                                                                var downloadUrls =
                                                                    <String>[];
                                                                try {
                                                                  downloadUrls = (await Future
                                                                          .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                      (m) async => await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                                } finally {
                                                                  isMediaUploading4 =
                                                                      false;
                                                                }
                                                                if (downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                                  setState(() =>
                                                                      uploadedFileUrl4 =
                                                                          downloadUrls
                                                                              .first);
                                                                } else {
                                                                  setState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 60,
                                                              height: 60,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                              ),
                                                              child: Icon(
                                                                FFIcons.kimage,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24,
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ADD_INSPECTION_Container_c081jssp_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_upload_media_to_firebase');
                                                              final selectedMedia =
                                                                  await selectMediaWithSourceBottomSheet(
                                                                context:
                                                                    context,
                                                                allowPhoto:
                                                                    true,
                                                              );
                                                              if (selectedMedia !=
                                                                      null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                setState(() =>
                                                                    isMediaUploading5 =
                                                                        true);
                                                                var downloadUrls =
                                                                    <String>[];
                                                                try {
                                                                  downloadUrls = (await Future
                                                                          .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                      (m) async => await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                                } finally {
                                                                  isMediaUploading5 =
                                                                      false;
                                                                }
                                                                if (downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                                  setState(() =>
                                                                      uploadedFileUrl5 =
                                                                          downloadUrls
                                                                              .first);
                                                                } else {
                                                                  setState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 60,
                                                              height: 60,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                              ),
                                                              child: Icon(
                                                                FFIcons.kimage,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24,
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ADD_INSPECTION_Container_903p0ttf_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_upload_media_to_firebase');
                                                              final selectedMedia =
                                                                  await selectMediaWithSourceBottomSheet(
                                                                context:
                                                                    context,
                                                                allowPhoto:
                                                                    true,
                                                              );
                                                              if (selectedMedia !=
                                                                      null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                setState(() =>
                                                                    isMediaUploading6 =
                                                                        true);
                                                                var downloadUrls =
                                                                    <String>[];
                                                                try {
                                                                  downloadUrls = (await Future
                                                                          .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                      (m) async => await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                                } finally {
                                                                  isMediaUploading6 =
                                                                      false;
                                                                }
                                                                if (downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                                  setState(() =>
                                                                      uploadedFileUrl6 =
                                                                          downloadUrls
                                                                              .first);
                                                                } else {
                                                                  setState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 60,
                                                              height: 60,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                              ),
                                                              child: Icon(
                                                                FFIcons.kimage,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 15),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'wfaq1knf' /* Comments */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .remove_circle_outline,
                                                            color: Color(
                                                                0xFFCD350B),
                                                            size: 22,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller:
                                                          textController2,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '6g1c4u5m' /* Comments */,
                                                        ),
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 18,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'yu6hjikz' /*   */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFD7D7D7),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFD7D7D7),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontSize: 14,
                                                              ),
                                                      maxLines: 3,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 30,
                                                                  20, 20),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ADD_INSPECTION_PAGE_Text_4ouw0vqr_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Text_validate_form');
                                                              if (formKey.currentState ==
                                                                      null ||
                                                                  !formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }

                                                              logFirebaseEvent(
                                                                  'Text_update_local_state');
                                                              setState(() {
                                                                FFAppState()
                                                                        .stepper2 =
                                                                    true;
                                                              });
                                                            },
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '7xxpadtl' /* NEXT */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: Color(
                                                                        0xFFCD350B),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ADD_INSPECTION_PAGE_Text_bmmjw39p_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Text_update_local_state');
                                                                setState(() {
                                                                  FFAppState()
                                                                          .stepper1 =
                                                                      false;
                                                                  FFAppState()
                                                                          .stepper2 =
                                                                      false;
                                                                });
                                                              },
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'qs5m2p77' /* BACK */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: FlutterFlowTheme.of(
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
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            if (FFAppState().stepper3)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 10, 20, 40),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'eg5n5rsa' /* SUBMIT */,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
