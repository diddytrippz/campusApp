import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/side_nav_widget.dart';
import '../components/visitor_confirm_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:styled_divider/styled_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class VisitorsManagementWidget extends StatefulWidget {
  const VisitorsManagementWidget({Key? key}) : super(key: key);

  @override
  _VisitorsManagementWidgetState createState() =>
      _VisitorsManagementWidgetState();
}

class _VisitorsManagementWidgetState extends State<VisitorsManagementWidget> {
  PageController? pageViewController;
  TextEditingController? textFielddateController;
  TextEditingController? textFieldtimeController;
  TextEditingController? textFieldnameController;
  TextEditingController? textFieldsurnameController;
  TextEditingController? textFieldphoneController;
  final textFieldphoneMask = MaskTextInputFormatter(mask: '(###) ### ####');
  bool? switchListTileValue;
  late SignatureController signatureController;
  VisitorsRecord? visitorAdded;
  VisitorsRecord? visitoradded2;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    signatureController = SignatureController(
      penStrokeWidth: 2,
      penColor: FlutterFlowTheme.of(context).primaryText,
      exportBackgroundColor: Color(0x00FFFFFF),
    );
    textFielddateController = TextEditingController();
    textFieldtimeController = TextEditingController();
    textFieldnameController = TextEditingController();
    textFieldsurnameController = TextEditingController();
    textFieldphoneController = TextEditingController();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'visitorsManagement'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    signatureController.dispose();
    textFielddateController?.dispose();
    textFieldtimeController?.dispose();
    textFieldnameController?.dispose();
    textFieldsurnameController?.dispose();
    textFieldphoneController?.dispose();
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
            logFirebaseEvent('VISITORS_MANAGEMENT_arrow_back_sharp_ICN');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            '38imdsjz' /* VISITORS MANAGEMENT */,
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
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((pageViewController?.page?.round() ??
                                              0) ==
                                          0) {
                                        return Color(0xFFFFD113);
                                      } else if ((pageViewController?.page
                                                  ?.round() ??
                                              0) ==
                                          1) {
                                        return Color(0xFFFFD113);
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryBackground;
                                      }
                                    }(),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '200ulvqn' /* 1 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: () {
                                              if ((pageViewController?.page
                                                          ?.round() ??
                                                      0) ==
                                                  0) {
                                                return Colors.white;
                                              } else if ((pageViewController
                                                          ?.page
                                                          ?.round() ??
                                                      0) ==
                                                  1) {
                                                return Colors.white;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryText;
                                              }
                                            }(),
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
                                      'ed4ozvy3' /* INFO */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 20, 0),
                                  child: Container(
                                    width: 50,
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: (pageViewController?.page?.round() ??
                                                0) ==
                                            1
                                        ? Color(0xFFFFBA00)
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'dcs33zv1' /* 2 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: (pageViewController?.page
                                                            ?.round() ??
                                                        0) ==
                                                    1
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
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
                                      '8s1luxju' /* CONFIRM */,
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 65,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (FFAppState().visitorMenu == true)
                                  Align(
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFCD350B),
                                            borderRadius:
                                                BorderRadius.circular(35),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'o43dfb2j' /* Add Visitor */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().visitorMenu == false)
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'VISITORS_MANAGEMENT_Text_05bxx78h_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_update_local_state');
                                            setState(() {
                                              FFAppState().visitorMenu = true;
                                            });
                                            logFirebaseEvent('Text_page_view');
                                            await pageViewController
                                                ?.animateToPage(
                                              0,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'qaucrpbi' /* Add Visitor */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().visitorMenu == true)
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 40, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'VISITORS_MANAGEMENT_Text_0pe2i2wr_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_update_local_state');
                                            setState(() {
                                              FFAppState().visitorMenu = false;
                                            });
                                            logFirebaseEvent('Text_page_view');
                                            await pageViewController
                                                ?.animateToPage(
                                              1,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'soozfrtx' /* My Visitors */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().visitorMenu == false)
                                  Align(
                                    alignment: AlignmentDirectional(0.9, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFCD350B),
                                            borderRadius:
                                                BorderRadius.circular(35),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'w1v13cgb' /* My Visitors */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                              child: PageView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: pageViewController ??=
                                    PageController(initialPage: 0),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 20, 15, 0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 5, 0, 10),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 35,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFFBA00),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '1v5yxi9e' /* 1 */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20, 0, 0, 0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '0xx0fuef' /* Visitor's Information */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 500,
                                                    child:
                                                        StyledVerticalDivider(
                                                      width: 30,
                                                      thickness: 2,
                                                      lineStyle:
                                                          DividerLineStyle
                                                              .dashed,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 5),
                                                          child: TextFormField(
                                                            controller:
                                                                textFieldnameController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'rwrg7zgk' /* Name */,
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
                                                                      0xFFE8E8E8),
                                                                  width: 1,
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
                                                                      0xFFE8E8E8),
                                                                  width: 1,
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
                                                                      0xFFCD350B),
                                                                  width: 1,
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
                                                                      0xFFCD350B),
                                                                  width: 1,
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
                                                              prefixIcon: Icon(
                                                                FFIcons
                                                                    .kuserCopy,
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      5, 20, 5),
                                                          child: TextFormField(
                                                            controller:
                                                                textFieldsurnameController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'ftjw4j6b' /* Surname */,
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
                                                                      0xFFE8E8E8),
                                                                  width: 1,
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
                                                                      0xFFE8E8E8),
                                                                  width: 1,
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
                                                                      0xFFCD350B),
                                                                  width: 1,
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
                                                                      0xFFCD350B),
                                                                  width: 1,
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
                                                              prefixIcon: Icon(
                                                                FFIcons
                                                                    .kuserCopy,
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      5, 20, 5),
                                                          child: TextFormField(
                                                            controller:
                                                                textFieldphoneController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '68h9a1nr' /* Mobile Number */,
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
                                                                      0xFFE8E8E8),
                                                                  width: 1,
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
                                                                      0xFFE8E8E8),
                                                                  width: 1,
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
                                                                      0xFFCD350B),
                                                                  width: 1,
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
                                                                      0xFFCD350B),
                                                                  width: 1,
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
                                                              prefixIcon: Icon(
                                                                FFIcons
                                                                    .kcallCopy,
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            inputFormatters: [
                                                              textFieldphoneMask
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      textFielddateController,
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        dateTimeFormat(
                                                                      'MMMEd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE8E8E8),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE8E8E8),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    prefixIcon:
                                                                        Icon(
                                                                      FFIcons
                                                                          .kcalendar1Copy,
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      textFieldtimeController,
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        dateTimeFormat(
                                                                      'Hm',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE8E8E8),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE8E8E8),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    prefixIcon:
                                                                        Icon(
                                                                      FFIcons
                                                                          .kclockCopy,
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SwitchListTile(
                                                          value:
                                                              switchListTileValue ??=
                                                                  false,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() =>
                                                                switchListTileValue =
                                                                    newValue!);
                                                          },
                                                          title: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'kem2ldzv' /* Save Visitor */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 14,
                                                                ),
                                                          ),
                                                          subtitle: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '7ohca520' /* Save contact for future visits */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontSize: 14,
                                                                ),
                                                          ),
                                                          tileColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          activeColor:
                                                              Color(0xFFCD350B),
                                                          dense: true,
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.9, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        20,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '9109iscq' /* Sign Below */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20,
                                                                      15,
                                                                      20,
                                                                      15),
                                                          child: ClipRect(
                                                            child: Signature(
                                                              controller:
                                                                  signatureController,
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              height: 120,
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          25,
                                                                          0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'VISITORS_MANAGEMENT_Text_u2zqkwru_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Text_clear_signatures');
                                                                  setState(() {
                                                                    signatureController
                                                                        .clear();
                                                                  });
                                                                },
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'veqmfpf2' /* CLEAR SIGNATURE */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(25, 40, 20, 40),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'VISITORS_MANAGEMENT_INVITE_BTN_ON_TAP');
                                                          var _shouldSetState =
                                                              false;
                                                          if (switchListTileValue ==
                                                              true) {
                                                            logFirebaseEvent(
                                                                'Button_update_local_state');
                                                            setState(() {
                                                              FFAppState()
                                                                      .accessCode =
                                                                  random_data
                                                                      .randomString(
                                                                5,
                                                                5,
                                                                false,
                                                                false,
                                                                true,
                                                              );
                                                            });
                                                            logFirebaseEvent(
                                                                'Button_backend_call');

                                                            final usersUpdateData =
                                                                {
                                                              'contactList':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                getContactsFirestoreData(
                                                                  createContactsStruct(
                                                                    name: textFieldnameController!
                                                                        .text,
                                                                    surname:
                                                                        textFieldsurnameController!
                                                                            .text,
                                                                    contact:
                                                                        textFieldphoneController!
                                                                            .text,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  true,
                                                                )
                                                              ]),
                                                            };
                                                            await currentUserReference!
                                                                .update(
                                                                    usersUpdateData);
                                                            logFirebaseEvent(
                                                                'Button_backend_call');

                                                            final visitorsCreateData =
                                                                createVisitorsRecordData(
                                                              name:
                                                                  textFieldnameController!
                                                                      .text,
                                                              surname:
                                                                  textFieldsurnameController!
                                                                      .text,
                                                              contact:
                                                                  textFieldphoneController!
                                                                      .text,
                                                              date:
                                                                  getCurrentTimestamp,
                                                              arrived: false,
                                                              departed: false,
                                                              tenant:
                                                                  currentUserReference,
                                                              accessCode:
                                                                  FFAppState()
                                                                      .accessCode,
                                                            );
                                                            var visitorsRecordReference =
                                                                VisitorsRecord
                                                                    .collection
                                                                    .doc();
                                                            await visitorsRecordReference
                                                                .set(
                                                                    visitorsCreateData);
                                                            visitorAdded = VisitorsRecord
                                                                .getDocumentFromData(
                                                                    visitorsCreateData,
                                                                    visitorsRecordReference);
                                                            _shouldSetState =
                                                                true;
                                                            logFirebaseEvent(
                                                                'Button_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1,
                                                                    child:
                                                                        VisitorConfirmWidget(
                                                                      myVisitors:
                                                                          visitorAdded,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Button_update_local_state');
                                                            setState(() {
                                                              FFAppState()
                                                                      .accessCode =
                                                                  random_data
                                                                      .randomString(
                                                                5,
                                                                5,
                                                                false,
                                                                false,
                                                                true,
                                                              );
                                                            });
                                                            logFirebaseEvent(
                                                                'Button_backend_call');

                                                            final visitorsCreateData =
                                                                createVisitorsRecordData(
                                                              name:
                                                                  textFieldnameController!
                                                                      .text,
                                                              surname:
                                                                  textFieldsurnameController!
                                                                      .text,
                                                              contact:
                                                                  textFieldphoneController!
                                                                      .text,
                                                              date:
                                                                  getCurrentTimestamp,
                                                              arrived: false,
                                                              departed: false,
                                                              tenant:
                                                                  currentUserReference,
                                                              accessCode:
                                                                  FFAppState()
                                                                      .accessCode,
                                                            );
                                                            var visitorsRecordReference =
                                                                VisitorsRecord
                                                                    .collection
                                                                    .doc();
                                                            await visitorsRecordReference
                                                                .set(
                                                                    visitorsCreateData);
                                                            visitoradded2 = VisitorsRecord
                                                                .getDocumentFromData(
                                                                    visitorsCreateData,
                                                                    visitorsRecordReference);
                                                            _shouldSetState =
                                                                true;
                                                            logFirebaseEvent(
                                                                'Button_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1,
                                                                    child:
                                                                        VisitorConfirmWidget(
                                                                      myVisitors:
                                                                          visitoradded2,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'e2hpdjqj' /* INVITE */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 140,
                                                          height: 40,
                                                          color:
                                                              Color(0xFFCD350B),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
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
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final visitorsList =
                                            (currentUserDocument?.contactList
                                                        ?.toList() ??
                                                    [])
                                                .toList()
                                                .take(10)
                                                .toList();
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: DataTable2(
                                            columns: [
                                              DataColumn2(
                                                label: DefaultTextStyle.merge(
                                                  softWrap: true,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '3jjua61p' /* Image */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                ),
                                                fixedWidth:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.15,
                                              ),
                                              DataColumn2(
                                                label: DefaultTextStyle.merge(
                                                  softWrap: true,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'u7aq6yf7' /* Visitor */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                ),
                                                fixedWidth:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.45,
                                              ),
                                              DataColumn2(
                                                label: DefaultTextStyle.merge(
                                                  softWrap: true,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'slu3ils9' /* Action */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                ),
                                                fixedWidth:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.2,
                                              ),
                                            ],
                                            rows: visitorsList
                                                .mapIndexed((visitorsListIndex,
                                                        visitorsListItem) =>
                                                    [
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF008FFF),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons.person,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            visitorsListItem
                                                                .name!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                          ),
                                                          Text(
                                                            visitorsListItem
                                                                .contact!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'hxa4nqpi' /* INVITE */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: Color(
                                                                      0xFF176000),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ]
                                                        .map((c) => DataCell(c))
                                                        .toList())
                                                .map((e) => DataRow(cells: e))
                                                .toList(),
                                            headingRowColor:
                                                MaterialStateProperty.all(
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                            ),
                                            headingRowHeight: 50,
                                            dataRowColor:
                                                MaterialStateProperty.all(
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                            ),
                                            dataRowHeight: 56,
                                            border: TableBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            dividerThickness: 0.8,
                                            showBottomBorder: false,
                                            minWidth: 49,
                                          ),
                                        );
                                      },
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
          ],
        ),
      ),
    );
  }
}
