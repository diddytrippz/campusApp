import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_model.dart';
export 'view_model.dart';

class ViewWidget extends StatefulWidget {
  const ViewWidget({
    super.key,
    this.completeTemp,
  });

  final double? completeTemp;

  static String routeName = 'view';
  static String routePath = 'view';

  @override
  State<ViewWidget> createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> with TickerProviderStateMixin {
  late ViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'view'});
    _model.tabBarController1 = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: true);
    _model.tabBarController2 = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController6 =
        ExpandableController(initialExpanded: true);
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-25.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MaintenanceRecord>>(
      stream: queryMaintenanceRecord(
        queryBuilder: (maintenanceRecord) =>
            maintenanceRecord.orderBy('created_time', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingFour(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<MaintenanceRecord> viewMaintenanceRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                logFirebaseEvent('VIEW_FloatingActionButton_tz3p9lpa_ON_TA');
                logFirebaseEvent('FloatingActionButton_navigate_to');

                context.pushNamed(
                  AppliancesWidget.routeName,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).warning,
              icon: Icon(
                FFIcons.kstyleOutlined7,
                color: Colors.white,
                size: 20.0,
              ),
              elevation: 0.0,
              label: Text(
                FFLocalizations.of(context).getText(
                  '7wtwwcdo' /* Ticket */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            drawer: Drawer(
              elevation: 16.0,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 65.0,
                              height: 65.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent3,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    valueOrDefault<String>(
                                      functions.initials(valueOrDefault(
                                          currentUserDocument?.firstName, '')),
                                      'A',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault(
                                          currentUserDocument?.residence, ''),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault(
                                          currentUserDocument?.role, ''),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(width: 15.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            8.0, 25.0, 8.0, 25.0),
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            alignLabelWithHint: true,
                            hintText: FFLocalizations.of(context).getText(
                              'qbz4vedv' /* Search */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(15.0),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'VIEW_PAGE_ListTile_w9ss509i_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              MessagesWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: Icon(
                                FFIcons.kstyleOutlined1,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'm1s3pp1p' /* Inbox */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleLargeFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily),
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: true,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'VIEW_PAGE_ListTile_fyyvn1uu_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              SettingsCopyWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: Icon(
                                FFIcons.ksettingsThree,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'bg62n1xb' /* Settings */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleLargeFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily),
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: true,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'VIEW_PAGE_ListTile_ldcyhqfx_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              NotificationsWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: Icon(
                                FFIcons.knotificationBingCopy,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  '1qb5t95q' /* Notifications */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleLargeFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily),
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: true,
                            ),
                          ),
                        ),
                      ),
                      if (valueOrDefault(currentUserDocument?.role, '') !=
                          'Tenant')
                        AuthUserStreamWidget(
                          builder: (context) => Divider(
                            height: 4.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).lineColor,
                          ),
                        ),
                      Divider(
                        height: 4.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ].addToStart(SizedBox(height: 30.0)),
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    wrapWithModel(
                      model: _model.sideNavModel,
                      updateCallback: () => safeSetState(() {}),
                      child: SideNavWidget(
                        nav1Color: FlutterFlowTheme.of(context).primaryText,
                        nav2Color: Color(0xFFC8360E),
                        nav3Color: FlutterFlowTheme.of(context).primaryText,
                        nav4Color: FlutterFlowTheme.of(context).primaryText,
                        nav5Color: FlutterFlowTheme.of(context).primaryText,
                        nav6Color: FlutterFlowTheme.of(context).primaryText,
                        nav7Color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 35.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VIEW_PAGE_Icon_d7x38reb_ON_TAP');
                                          logFirebaseEvent('Icon_drawer');
                                          scaffoldKey.currentState!
                                              .openDrawer();
                                        },
                                        child: Icon(
                                          FFIcons.kmenuAlt02,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 35.0,
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 20.0)),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          FFLocalizations.of(context).getText(
                                            'l93u0skm' /* Campus Africa */,
                                          ),
                                          maxLines: 1,
                                          minFontSize: 12.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'VIEW_PAGE_Icon_43xcr65j_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_navigate_to');

                                            context.pushNamed(
                                              NotificationsWidget.routeName,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: Icon(
                                            FFIcons.knotificationBingCopy,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 26.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['rowOnPageLoadAnimation']!),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 15.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.topNavModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TopNavWidget(),
                                ),
                              ),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if ((valueOrDefault(
                                              currentUserDocument?.role, '') ==
                                          'Admin') ||
                                      (valueOrDefault(
                                              currentUserDocument?.role, '') ==
                                          'Management')) {
                                    return Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(0.0, 0),
                                          child: TabBar(
                                            isScrollable: true,
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily),
                                                    ),
                                            unselectedLabelStyle: TextStyle(),
                                            indicatorColor: Color(0xFFF9B704),
                                            indicatorWeight: 4.0,
                                            padding: EdgeInsets.all(25.0),
                                            tabs: [
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'eoiistge' /* Submitted */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'xc8d1801' /* Pending */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '4sexau43' /* Completed */,
                                                ),
                                              ),
                                            ],
                                            controller:
                                                _model.tabBarController1,
                                            onTap: (i) async {
                                              [
                                                () async {},
                                                () async {},
                                                () async {}
                                              ][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller:
                                                _model.tabBarController1,
                                            children: [
                                              KeepAliveWidgetWrapper(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          child:
                                                              ExpandableNotifier(
                                                            controller: _model
                                                                .expandableExpandableController1,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Submitted (${viewMaintenanceRecordList.where((e) => (e.status == 'Submitted') && (e.residence == valueOrDefault(currentUserDocument?.residence, ''))).toList().length.toString()})',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              collapsed:
                                                                  Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'xjhygysu' /* Tap here to view ALL tasks */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              expanded: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final submittedData = viewMaintenanceRecordList
                                                                      .where((e) =>
                                                                          (e.status ==
                                                                              'Submitted') &&
                                                                          (e.residence ==
                                                                              valueOrDefault(currentUserDocument?.residence, '')))
                                                                      .toList();
                                                                  if (submittedData
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        child:
                                                                            EmptyListWidget(
                                                                          message:
                                                                              'No tickets were found. Please try again :)',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                            submittedData.length,
                                                                            (submittedDataIndex) {
                                                                      final submittedDataItem =
                                                                          submittedData[
                                                                              submittedDataIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'VIEW_PAGE_ListTile_ryszrdat_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'ListTile_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            InformationWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'jobs': serializeParam(
                                                                                submittedDataItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'jobs': submittedDataItem,
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Slidable(
                                                                          endActionPane:
                                                                              ActionPane(
                                                                            motion:
                                                                                const ScrollMotion(),
                                                                            extentRatio:
                                                                                0.25,
                                                                            children: [
                                                                              SlidableAction(
                                                                                label: FFLocalizations.of(context).getText(
                                                                                  'bmafe6dg' /* Complete */,
                                                                                ),
                                                                                backgroundColor: FlutterFlowTheme.of(context).accent3,
                                                                                icon: FFIcons.kcheck,
                                                                                onPressed: (_) async {
                                                                                  logFirebaseEvent('VIEW_SlidableActionWidget_7aw16hw5_ON_TA');
                                                                                  logFirebaseEvent('SlidableActionWidget_backend_call');

                                                                                  await submittedDataItem.reference.update(createMaintenanceRecordData(
                                                                                    status: 'Pending',
                                                                                  ));
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                ListTile(
                                                                              leading: Icon(
                                                                                FFIcons.ksquareFill,
                                                                                color: FlutterFlowTheme.of(context).accent3,
                                                                                size: 15.0,
                                                                              ),
                                                                              title: Text(
                                                                                submittedDataItem.issue,
                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                    ),
                                                                              ),
                                                                              subtitle: Text(
                                                                                submittedDataItem.bedCode,
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                              ),
                                                                              tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              dense: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    })
                                                                        .divide(SizedBox(
                                                                            height:
                                                                                10.0))
                                                                        .addToStart(SizedBox(
                                                                            height:
                                                                                15.0))
                                                                        .addToEnd(SizedBox(
                                                                            height:
                                                                                15.0)),
                                                                  );
                                                                },
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    false,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                                expandIcon: FFIcons
                                                                    .kchevronUpDown,
                                                                collapseIcon:
                                                                    FFIcons
                                                                        .kchevronDown,
                                                                iconSize: 24.0,
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          child:
                                                              ExpandableNotifier(
                                                            controller: _model
                                                                .expandableExpandableController2,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .warning,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Pending (${viewMaintenanceRecordList.where((e) => (e.status == 'Pending') && (e.residence == valueOrDefault(currentUserDocument?.residence, ''))).toList().length.toString()})',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                color: Colors.white,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              collapsed:
                                                                  Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '7bmrgc01' /* Tap here to view ALL tasks */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              expanded: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final pendingData = viewMaintenanceRecordList
                                                                      .where((e) =>
                                                                          (e.status ==
                                                                              'Pending') &&
                                                                          (e.residence ==
                                                                              valueOrDefault(currentUserDocument?.residence, '')))
                                                                      .toList();
                                                                  if (pendingData
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        child:
                                                                            EmptyListWidget(
                                                                          message:
                                                                              'No tickets were found. Please try again :)',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                            pendingData.length,
                                                                            (pendingDataIndex) {
                                                                      final pendingDataItem =
                                                                          pendingData[
                                                                              pendingDataIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'VIEW_PAGE_ListTile_ygs70k4a_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'ListTile_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            InformationWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'jobs': serializeParam(
                                                                                pendingDataItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'jobs': pendingDataItem,
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Slidable(
                                                                          endActionPane:
                                                                              ActionPane(
                                                                            motion:
                                                                                const ScrollMotion(),
                                                                            extentRatio:
                                                                                0.25,
                                                                            children: [
                                                                              SlidableAction(
                                                                                label: FFLocalizations.of(context).getText(
                                                                                  'm7v64mic' /* Complete */,
                                                                                ),
                                                                                backgroundColor: FlutterFlowTheme.of(context).accent3,
                                                                                icon: FFIcons.kcheck,
                                                                                onPressed: (_) async {
                                                                                  logFirebaseEvent('VIEW_SlidableActionWidget_3147q9sd_ON_TA');
                                                                                  logFirebaseEvent('SlidableActionWidget_backend_call');

                                                                                  await pendingDataItem.reference.update(createMaintenanceRecordData(
                                                                                    status: 'Completed',
                                                                                  ));
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                ListTile(
                                                                              leading: Icon(
                                                                                FFIcons.ksquareFill,
                                                                                color: FlutterFlowTheme.of(context).accent3,
                                                                                size: 15.0,
                                                                              ),
                                                                              title: Text(
                                                                                pendingDataItem.issue,
                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                    ),
                                                                              ),
                                                                              subtitle: Text(
                                                                                pendingDataItem.bedCode,
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).warning,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                              ),
                                                                              tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              dense: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    })
                                                                        .divide(SizedBox(
                                                                            height:
                                                                                10.0))
                                                                        .addToStart(SizedBox(
                                                                            height:
                                                                                15.0))
                                                                        .addToEnd(SizedBox(
                                                                            height:
                                                                                15.0)),
                                                                  );
                                                                },
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    false,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                                expandIcon: FFIcons
                                                                    .kchevronUpDown,
                                                                collapseIcon:
                                                                    FFIcons
                                                                        .kchevronDown,
                                                                iconSize: 24.0,
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          child:
                                                              ExpandableNotifier(
                                                            controller: _model
                                                                .expandableExpandableController3,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Complete (${viewMaintenanceRecordList.where((e) => (e.status == 'Completed') && (e.residence == valueOrDefault(currentUserDocument?.residence, ''))).toList().length.toString()})',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                color: Colors.white,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              collapsed:
                                                                  Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0019a2aj' /* Tap here to view ALL tasks */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              expanded: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final completedData = viewMaintenanceRecordList
                                                                      .where((e) =>
                                                                          (e.status ==
                                                                              'Completed') &&
                                                                          (e.residence ==
                                                                              valueOrDefault(currentUserDocument?.residence, '')))
                                                                      .toList();
                                                                  if (completedData
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        child:
                                                                            EmptyListWidget(
                                                                          message:
                                                                              'No tickets were found. Please try again :)',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                            completedData.length,
                                                                            (completedDataIndex) {
                                                                      final completedDataItem =
                                                                          completedData[
                                                                              completedDataIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'VIEW_PAGE_ListTile_8h4eyylv_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'ListTile_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            InformationWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'jobs': serializeParam(
                                                                                completedDataItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'jobs': completedDataItem,
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              ListTile(
                                                                            leading:
                                                                                Icon(
                                                                              FFIcons.ksquareFill,
                                                                              color: FlutterFlowTheme.of(context).success,
                                                                              size: 15.0,
                                                                            ),
                                                                            title:
                                                                                Text(
                                                                              completedDataItem.issue,
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                  ),
                                                                            ),
                                                                            subtitle:
                                                                                Text(
                                                                              completedDataItem.bedCode,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            dense:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    })
                                                                        .divide(SizedBox(
                                                                            height:
                                                                                10.0))
                                                                        .addToStart(SizedBox(
                                                                            height:
                                                                                15.0))
                                                                        .addToEnd(SizedBox(
                                                                            height:
                                                                                15.0)),
                                                                  );
                                                                },
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    false,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                                expandIcon: FFIcons
                                                                    .kchevronUpDown,
                                                                collapseIcon:
                                                                    FFIcons
                                                                        .kchevronDown,
                                                                iconSize: 24.0,
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                          ),
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
                                    );
                                  } else {
                                    return Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(0.0, 0),
                                          child: TabBar(
                                            isScrollable: true,
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily),
                                                    ),
                                            unselectedLabelStyle: TextStyle(),
                                            indicatorColor: Color(0xFFF9B704),
                                            indicatorWeight: 4.0,
                                            padding: EdgeInsets.all(25.0),
                                            tabs: [
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'k5oijbsp' /* Submitted */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'l6ipyjih' /* Pending */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0wfwrsgr' /* Completed */,
                                                ),
                                              ),
                                            ],
                                            controller:
                                                _model.tabBarController2,
                                            onTap: (i) async {
                                              [
                                                () async {},
                                                () async {},
                                                () async {}
                                              ][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller:
                                                _model.tabBarController2,
                                            children: [
                                              KeepAliveWidgetWrapper(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          child:
                                                              ExpandableNotifier(
                                                            controller: _model
                                                                .expandableExpandableController4,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Text(
                                                                            'Submitted (${viewMaintenanceRecordList.where((e) => (e.status == 'Submitted') && (e.residence == valueOrDefault(currentUserDocument?.residence, ''))).toList().length.toString()})',
                                                                            style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              collapsed:
                                                                  Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'vx2j2hju' /* Tap here to view ALL tasks */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              expanded: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final submittedData = viewMaintenanceRecordList
                                                                      .where((e) =>
                                                                          (e.status ==
                                                                              'Submitted') &&
                                                                          (e.email ==
                                                                              currentUserEmail))
                                                                      .toList();
                                                                  if (submittedData
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        child:
                                                                            EmptyListWidget(
                                                                          message:
                                                                              'No tickets were found. Please try again :)',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                            submittedData.length,
                                                                            (submittedDataIndex) {
                                                                      final submittedDataItem =
                                                                          submittedData[
                                                                              submittedDataIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'VIEW_PAGE_ListTile_oxy7jh0t_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'ListTile_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            InformationWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'jobs': serializeParam(
                                                                                submittedDataItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'jobs': submittedDataItem,
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              ListTile(
                                                                            leading:
                                                                                Icon(
                                                                              FFIcons.ksquareFill,
                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                              size: 15.0,
                                                                            ),
                                                                            title:
                                                                                Text(
                                                                              submittedDataItem.issue,
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                  ),
                                                                            ),
                                                                            subtitle:
                                                                                Text(
                                                                              submittedDataItem.bedCode,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            dense:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    })
                                                                        .divide(SizedBox(
                                                                            height:
                                                                                10.0))
                                                                        .addToStart(SizedBox(
                                                                            height:
                                                                                15.0))
                                                                        .addToEnd(SizedBox(
                                                                            height:
                                                                                15.0)),
                                                                  );
                                                                },
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    false,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                                expandIcon: FFIcons
                                                                    .kchevronUpDown,
                                                                collapseIcon:
                                                                    FFIcons
                                                                        .kchevronDown,
                                                                iconSize: 24.0,
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          child:
                                                              ExpandableNotifier(
                                                            controller: _model
                                                                .expandableExpandableController5,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .warning,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Text(
                                                                            'Pending (${viewMaintenanceRecordList.where((e) => (e.status == 'Pending') && (e.residence == valueOrDefault(currentUserDocument?.residence, ''))).toList().length.toString()})',
                                                                            style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                  color: Colors.white,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              collapsed:
                                                                  Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'smgg9g31' /* Tap here to view ALL tasks */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              expanded: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final pendingData = viewMaintenanceRecordList
                                                                      .where((e) =>
                                                                          (e.status ==
                                                                              'Pending') &&
                                                                          (e.email ==
                                                                              currentUserEmail))
                                                                      .toList();
                                                                  if (pendingData
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        child:
                                                                            EmptyListWidget(
                                                                          message:
                                                                              'No tickets were found. Please try again :)',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                            pendingData.length,
                                                                            (pendingDataIndex) {
                                                                      final pendingDataItem =
                                                                          pendingData[
                                                                              pendingDataIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'VIEW_PAGE_ListTile_42xu42e2_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'ListTile_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            InformationWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'jobs': serializeParam(
                                                                                pendingDataItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'jobs': pendingDataItem,
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              ListTile(
                                                                            leading:
                                                                                Icon(
                                                                              FFIcons.ksquareFill,
                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                              size: 15.0,
                                                                            ),
                                                                            title:
                                                                                Text(
                                                                              pendingDataItem.issue,
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                  ),
                                                                            ),
                                                                            subtitle:
                                                                                Text(
                                                                              pendingDataItem.bedCode,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).warning,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            dense:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    })
                                                                        .divide(SizedBox(
                                                                            height:
                                                                                10.0))
                                                                        .addToStart(SizedBox(
                                                                            height:
                                                                                15.0))
                                                                        .addToEnd(SizedBox(
                                                                            height:
                                                                                15.0)),
                                                                  );
                                                                },
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    false,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                                expandIcon: FFIcons
                                                                    .kchevronUpDown,
                                                                collapseIcon:
                                                                    FFIcons
                                                                        .kchevronDown,
                                                                iconSize: 24.0,
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          child:
                                                              ExpandableNotifier(
                                                            controller: _model
                                                                .expandableExpandableController6,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Text(
                                                                            'Complete (${viewMaintenanceRecordList.where((e) => (e.status == 'Completed') && (e.residence == valueOrDefault(currentUserDocument?.residence, ''))).toList().length.toString()})',
                                                                            style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                  color: Colors.white,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              collapsed:
                                                                  Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'vy9oywqu' /* Tap here to view ALL tasks */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              expanded: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final completedData = viewMaintenanceRecordList
                                                                      .where((e) =>
                                                                          (e.status ==
                                                                              'Completed') &&
                                                                          (e.email ==
                                                                              currentUserEmail))
                                                                      .toList();
                                                                  if (completedData
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        child:
                                                                            EmptyListWidget(
                                                                          message:
                                                                              'No tickets were found. Please try again :)',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                            completedData.length,
                                                                            (completedDataIndex) {
                                                                      final completedDataItem =
                                                                          completedData[
                                                                              completedDataIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'VIEW_PAGE_ListTile_lowd5uyl_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'ListTile_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            InformationWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'jobs': serializeParam(
                                                                                completedDataItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'jobs': completedDataItem,
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              ListTile(
                                                                            leading:
                                                                                Icon(
                                                                              FFIcons.ksquareFill,
                                                                              color: FlutterFlowTheme.of(context).success,
                                                                              size: 15.0,
                                                                            ),
                                                                            title:
                                                                                Text(
                                                                              completedDataItem.issue,
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                  ),
                                                                            ),
                                                                            subtitle:
                                                                                Text(
                                                                              completedDataItem.bedCode,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            dense:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    })
                                                                        .divide(SizedBox(
                                                                            height:
                                                                                10.0))
                                                                        .addToStart(SizedBox(
                                                                            height:
                                                                                15.0))
                                                                        .addToEnd(SizedBox(
                                                                            height:
                                                                                15.0)),
                                                                  );
                                                                },
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    false,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                                expandIcon: FFIcons
                                                                    .kchevronUpDown,
                                                                collapseIcon:
                                                                    FFIcons
                                                                        .kchevronDown,
                                                                iconSize: 24.0,
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                          ),
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
                                    );
                                  }
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
          ),
        );
      },
    );
  }
}
