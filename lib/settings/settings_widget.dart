import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottom_nav_bar_widget.dart';
import '../components/dark_mode_widget.dart';
import '../components/side_nav_widget.dart';
import '../components/skeleton_settings_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool mouseRegionHovered1 = false;
  bool mouseRegionHovered2 = false;
  bool mouseRegionHovered3 = false;
  bool mouseRegionHovered4 = false;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SETTINGS_PAGE_settings_ON_PAGE_LOAD');
      logFirebaseEvent('settings_update_local_state');
      FFAppState().update(() {
        FFAppState().skeletonSettings = true;
        FFAppState().btmNavVis = false;
      });
      logFirebaseEvent('settings_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
      logFirebaseEvent('settings_update_local_state');
      FFAppState().update(() {
        FFAppState().skeletonSettings = false;
      });
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'settings'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<MaintenanceRecord>>(
      stream: queryMaintenanceRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: Center(
              child: SkeletonSettingsWidget(),
            ),
          );
        }
        List<MaintenanceRecord> settingsMaintenanceRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        nav6Color: Color(0xFFC8360E),
                        nav7Color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (!isWeb)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 60, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'n9zmnk1o' /* Settings */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              MouseRegion(
                                opaque: false,
                                cursor: SystemMouseCursors.click ??
                                    MouseCursor.defer,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 30, 12, 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18, 15, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 1,
                                                  shape: const CircleBorder(),
                                                  child: Container(
                                                    width: 70,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF4E39F9),
                                                        width: 4,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Text(
                                                          functions.initials(
                                                              currentUserDisplayName)!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 12, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            AutoSizeText(
                                                          currentUserDisplayName
                                                              .maybeHandleOverflow(
                                                            maxChars: 14,
                                                            replacement: '…',
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
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    15, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            AutoSizeText(
                                                              currentUserEmail,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Icon(
                                                                Icons.verified,
                                                                color: Color(
                                                                    0xFF1079FF),
                                                                size: 14,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  70, 0, 50, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 0.2,
                                            decoration: BoxDecoration(
                                              color: Color(0x81464749),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 10, 10),
                                          child: ListTile(
                                            leading: Icon(
                                              FFIcons.kic25,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20,
                                            ),
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'l75068ci' /* Account */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16,
                                            ),
                                            tileColor: Color(0x00F5F5F5),
                                            dense: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onEnter: ((event) async {
                                  setState(() => mouseRegionHovered1 = true);
                                }),
                                onExit: ((event) async {
                                  setState(() => mouseRegionHovered1 = false);
                                }),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SETTINGS_PAGE_ListTile_ty8u4mc1_ON_TAP');
                                            logFirebaseEvent(
                                                'ListTile_navigate_to');

                                            context.pushNamed('eskomArea');
                                          },
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.offline_bolt_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22,
                                            ),
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nj9u6e42' /* Loadshedding */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16,
                                            ),
                                            tileColor: Color(0x00F5F5F5),
                                            dense: true,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SETTINGS_PAGE_ListTile_xdwd3omq_ON_TAP');
                                            logFirebaseEvent(
                                                'ListTile_navigate_to');

                                            context.pushNamed('myVisitors');
                                          },
                                          child: ListTile(
                                            leading: Icon(
                                              FFIcons.kuserTagCopy,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22,
                                            ),
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7wn5mpz4' /* Manage Visitors */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16,
                                            ),
                                            tileColor: Color(0x00F5F5F5),
                                            dense: true,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            50, 0, 50, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 0.2,
                                          decoration: BoxDecoration(
                                            color: Color(0x81464749),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 10, 10),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SETTINGS_PAGE_ListTile_qpqshfu5_ON_TAP');
                                            logFirebaseEvent(
                                                'ListTile_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: DarkModeWidget(),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.color_lens,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 28,
                                            ),
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                't9754pmw' /* Appearance */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16,
                                            ),
                                            tileColor: Color(0x00F5F5F5),
                                            dense: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SETTINGS_PAGE_ListTile_anbw2i5r_ON_TAP');
                                            logFirebaseEvent(
                                                'ListTile_navigate_to');

                                            context.pushNamed('rules');
                                          },
                                          child: ListTile(
                                            leading: Icon(
                                              FFIcons.kdocumentPdf,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22,
                                            ),
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mv65usit' /* Student handbook */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16,
                                            ),
                                            tileColor: Color(0x00F5F5F5),
                                            dense: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                        indent: 50,
                                        endIndent: 50,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SETTINGS_PAGE_ListTile_upo1bc6t_ON_TAP');
                                            logFirebaseEvent(
                                                'ListTile_navigate_to');

                                            context.pushNamed('notifications');
                                          },
                                          child: ListTile(
                                            leading: Icon(
                                              FFIcons.knotificationStatusCopy,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22,
                                            ),
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'w3kgqtsc' /* Notifications */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16,
                                            ),
                                            tileColor: Color(0x00F5F5F5),
                                            dense: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                        indent: 50,
                                        endIndent: 50,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 10),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SETTINGS_PAGE_ListTile_uipahobv_ON_TAP');
                                            logFirebaseEvent(
                                                'ListTile_navigate_to');

                                            context.pushNamed('addInspection');
                                          },
                                          child: ListTile(
                                            leading: Icon(
                                              FFIcons.kclipboardTextCopy,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22,
                                            ),
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1acimcx6' /* Add Inspections */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16,
                                            ),
                                            tileColor: Color(0x00F5F5F5),
                                            dense: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 30),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      MouseRegion(
                                        opaque: false,
                                        cursor: SystemMouseCursors.click ??
                                            MouseCursor.defer,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 10, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SETTINGS_PAGE_ListTile_rdqryog8_ON_TAP');
                                              logFirebaseEvent(
                                                  'ListTile_custom_action');
                                              await actions
                                                  .downloadCollectionAsCSV(
                                                settingsMaintenanceRecordList
                                                    .toList(),
                                              );
                                            },
                                            child: ListTile(
                                              leading: Icon(
                                                FFIcons.kdocumentDownloadCopy,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24,
                                              ),
                                              title: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'lfkifcv6' /* Download CSV */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title3
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 16,
                                              ),
                                              tileColor: Color(0x00F5F5F5),
                                              dense: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onEnter: ((event) async {
                                          setState(
                                              () => mouseRegionHovered2 = true);
                                        }),
                                        onExit: ((event) async {
                                          setState(() =>
                                              mouseRegionHovered2 = false);
                                        }),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            50, 0, 50, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 0.2,
                                          decoration: BoxDecoration(
                                            color: Color(0x81464749),
                                          ),
                                        ),
                                      ),
                                      MouseRegion(
                                        opaque: false,
                                        cursor: SystemMouseCursors.help ??
                                            MouseCursor.defer,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 10, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SETTINGS_PAGE_ListTile_nodnox8i_ON_TAP');
                                              logFirebaseEvent(
                                                  'ListTile_launch_u_r_l');
                                              await launchURL(
                                                  'https://campusafrica.co.za/contact-us/');
                                            },
                                            child: ListTile(
                                              leading: Icon(
                                                FFIcons.klink2Copy,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24,
                                              ),
                                              title: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '2u2thzj6' /* About us */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title3
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 16,
                                              ),
                                              tileColor: Color(0x00F5F5F5),
                                              dense: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onEnter: ((event) async {
                                          setState(
                                              () => mouseRegionHovered3 = true);
                                        }),
                                        onExit: ((event) async {
                                          setState(() =>
                                              mouseRegionHovered3 = false);
                                        }),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            50, 0, 50, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 0.2,
                                          decoration: BoxDecoration(
                                            color: Color(0x81464749),
                                          ),
                                        ),
                                      ),
                                      MouseRegion(
                                        opaque: false,
                                        cursor: SystemMouseCursors.click ??
                                            MouseCursor.defer,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 10, 20),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SETTINGS_PAGE_ListTile_8xit2csm_ON_TAP');
                                              logFirebaseEvent('ListTile_auth');
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await signOut();

                                              context.goNamedAuth(
                                                  'login', mounted);
                                            },
                                            child: ListTile(
                                              leading: FaIcon(
                                                FontAwesomeIcons.expeditedssl,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 26,
                                              ),
                                              title: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ak9vojgx' /* Logout */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title3
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 16,
                                              ),
                                              tileColor: Color(0x00F5F5F5),
                                              dense: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onEnter: ((event) async {
                                          setState(
                                              () => mouseRegionHovered4 = true);
                                        }),
                                        onExit: ((event) async {
                                          setState(() =>
                                              mouseRegionHovered4 = false);
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  BottomNavBarWidget(
                    homeColor: FlutterFlowTheme.of(context).primaryText,
                    messageColor: FlutterFlowTheme.of(context).primaryText,
                    notificationColor: FlutterFlowTheme.of(context).primaryText,
                    settingsColor: Color(0xFFC8360E),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
