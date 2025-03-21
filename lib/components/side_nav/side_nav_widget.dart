import '/auth/firebase_auth/auth_util.dart';
import '/components/thing_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'side_nav_model.dart';
export 'side_nav_model.dart';

class SideNavWidget extends StatefulWidget {
  const SideNavWidget({
    super.key,
    this.nav1Color,
    this.nav2Color,
    this.nav3Color,
    this.nav4Color,
    this.nav5Color,
    this.nav6Color,
    this.nav7Color,
  });

  final Color? nav1Color;
  final Color? nav2Color;
  final Color? nav3Color;
  final Color? nav4Color;
  final Color? nav5Color;
  final Color? nav6Color;
  final Color? nav7Color;

  @override
  State<SideNavWidget> createState() => _SideNavWidgetState();
}

class _SideNavWidgetState extends State<SideNavWidget> {
  late SideNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((FFAppState().navOpen == false) &&
            responsiveVisibility(
              context: context,
              phone: false,
            ))
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).black600,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'a5z6pvay' /* Menu */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        AlignedTooltip(
                          content: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'teclu4th' /* Home */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          offset: 4.0,
                          preferredDirection: AxisDirection.right,
                          borderRadius: BorderRadius.circular(6.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          elevation: 2.0,
                          tailBaseWidth: 30.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 50),
                          showDuration: Duration(milliseconds: 100),
                          triggerMode: TooltipTriggerMode.tap,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: Colors.transparent,
                                  hoverColor:
                                      FlutterFlowTheme.of(context).gray600,
                                  hoverIconColor: Colors.white,
                                  icon: Icon(
                                    FFIcons.kstyleOutlined1,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SIDE_NAV_COMP_styleOutlined1_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(
                                      ViewWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        if ((valueOrDefault(currentUserDocument?.role, '') ==
                                'Admin') ||
                            (valueOrDefault(currentUserDocument?.role, '') ==
                                'Management'))
                          AuthUserStreamWidget(
                            builder: (context) => AlignedTooltip(
                              content: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'husv3bm9' /* Dashboard */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              offset: 4.0,
                              preferredDirection: AxisDirection.right,
                              borderRadius: BorderRadius.circular(6.0),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              elevation: 2.0,
                              tailBaseWidth: 30.0,
                              tailLength: 12.0,
                              waitDuration: Duration(milliseconds: 50),
                              showDuration: Duration(milliseconds: 100),
                              triggerMode: TooltipTriggerMode.tap,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: Colors.transparent,
                                      hoverColor:
                                          FlutterFlowTheme.of(context).gray600,
                                      hoverIconColor: Colors.white,
                                      icon: Icon(
                                        Icons.space_dashboard,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        AlignedTooltip(
                          content: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'n08xop2m' /* Tickets */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          offset: 4.0,
                          preferredDirection: AxisDirection.right,
                          borderRadius: BorderRadius.circular(6.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          elevation: 2.0,
                          tailBaseWidth: 30.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 50),
                          showDuration: Duration(milliseconds: 100),
                          triggerMode: TooltipTriggerMode.tap,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: Colors.transparent,
                                  hoverColor:
                                      FlutterFlowTheme.of(context).gray600,
                                  hoverIconColor: Colors.white,
                                  icon: Icon(
                                    FFIcons.kwrench,
                                    color: Colors.white,
                                    size: 28.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SIDE_NAV_COMP_wrench_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(
                                      AppliancesWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        AlignedTooltip(
                          content: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'z7ejebqi' /* Message */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          offset: 4.0,
                          preferredDirection: AxisDirection.right,
                          borderRadius: BorderRadius.circular(6.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          elevation: 2.0,
                          tailBaseWidth: 30.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 50),
                          showDuration: Duration(milliseconds: 100),
                          triggerMode: TooltipTriggerMode.tap,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: Colors.transparent,
                                  hoverColor:
                                      FlutterFlowTheme.of(context).gray600,
                                  hoverIconColor: Colors.white,
                                  icon: Icon(
                                    FFIcons.kmessage37,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SIDE_NAV_COMP_message37_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(MessagesWidget.routeName);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        AlignedTooltip(
                          content: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'tgbtfu8s' /* Users... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          offset: 4.0,
                          preferredDirection: AxisDirection.right,
                          borderRadius: BorderRadius.circular(6.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          elevation: 2.0,
                          tailBaseWidth: 30.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 50),
                          showDuration: Duration(milliseconds: 100),
                          triggerMode: TooltipTriggerMode.tap,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: Colors.transparent,
                                  hoverColor:
                                      FlutterFlowTheme.of(context).gray600,
                                  hoverIconColor: Colors.white,
                                  icon: Icon(
                                    FFIcons.kfiRsUser,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SIDE_NAV_COMP_fiRsUser_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(SearchWidget.routeName);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        AlignedTooltip(
                          content: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'pfxaeomv' /* Settings... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          offset: 4.0,
                          preferredDirection: AxisDirection.right,
                          borderRadius: BorderRadius.circular(6.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          elevation: 2.0,
                          tailBaseWidth: 30.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 50),
                          showDuration: Duration(milliseconds: 100),
                          triggerMode: TooltipTriggerMode.tap,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: Colors.transparent,
                                  hoverColor:
                                      FlutterFlowTheme.of(context).gray600,
                                  hoverIconColor: Colors.white,
                                  icon: Icon(
                                    FFIcons.ksetting2Copy,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SIDE_NAV_COMP_setting2Copy_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(SettingsWidget.routeName);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 15.0,
                            height: 15.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).success,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).warning,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).error,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          AlignedTooltip(
                            content: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '8bz1e13i' /* Notifications */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            offset: 4.0,
                            preferredDirection: AxisDirection.right,
                            borderRadius: BorderRadius.circular(6.0),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            elevation: 2.0,
                            tailBaseWidth: 24.0,
                            tailLength: 12.0,
                            waitDuration: Duration(milliseconds: 100),
                            showDuration: Duration(milliseconds: 200),
                            triggerMode: TooltipTriggerMode.tap,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: Colors.transparent,
                                    hoverColor:
                                        FlutterFlowTheme.of(context).gray600,
                                    hoverIconColor: Colors.white,
                                    icon: Icon(
                                      FFIcons.kstyleOutlined8,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SIDE_NAV_COMP_styleOutlined8_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.pushNamed(
                                        NotificationsWidget.routeName,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: Colors.transparent,
                                  hoverColor:
                                      FlutterFlowTheme.of(context).gray600,
                                  hoverIconColor: Colors.white,
                                  icon: Icon(
                                    FFIcons.kexpand,
                                    color: Colors.white,
                                    size: 28.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SIDE_NAV_COMP_expand_ICN_ON_TAP');
                                    if (FFAppState().navOpen == true) {
                                      logFirebaseEvent(
                                          'IconButton_update_app_state');
                                      FFAppState().navOpen = false;
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'IconButton_update_app_state');
                                      FFAppState().navOpen = true;
                                      safeSetState(() {});
                                    }
                                  },
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
            ),
          ),
        if ((FFAppState().navOpen == true) &&
            responsiveVisibility(
              context: context,
              phone: false,
            ))
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).black600,
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '7uv5pczt' /* Campus 
Africa */
                                  ,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 0.0, 25.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'sd35ivuc' /* Dashboard */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('SIDE_NAV_COMP_HOME_BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(
                            ViewWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'fkgpvev9' /* Home */,
                        ),
                        icon: Icon(
                          FFIcons.kstyleOutlined1,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        options: FFButtonOptions(
                          width: 210.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 100.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          hoverColor: FlutterFlowTheme.of(context).gray600,
                          hoverBorderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          hoverTextColor: Colors.white,
                        ),
                        showLoadingIndicator: false,
                      ),
                      if ((valueOrDefault(currentUserDocument?.role, '') !=
                              'Tenant') &&
                          (valueOrDefault(currentUserDocument?.residence, '') !=
                                  null &&
                              valueOrDefault(
                                      currentUserDocument?.residence, '') !=
                                  ''))
                        AuthUserStreamWidget(
                          builder: (context) => FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'u6t1u6c4' /* Admin */,
                            ),
                            icon: Icon(
                              Icons.space_dashboard_rounded,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: 210.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 100.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              hoverColor: FlutterFlowTheme.of(context).gray600,
                              hoverBorderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              hoverTextColor: Colors.white,
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      wrapWithModel(
                        model: _model.thingModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ThingWidget(),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('SIDE_NAV_COMP_INBOX_BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(MessagesWidget.routeName);
                        },
                        text: FFLocalizations.of(context).getText(
                          '6hypbbx3' /* Inbox */,
                        ),
                        icon: Icon(
                          FFIcons.kmessage37,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        options: FFButtonOptions(
                          width: 210.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 100.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          hoverColor: FlutterFlowTheme.of(context).gray600,
                          hoverBorderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          hoverTextColor: Colors.white,
                        ),
                        showLoadingIndicator: false,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 15.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '50xme04h' /* Others */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SIDE_NAV_COMP_NOTIFICATIONS_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

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
                            text: FFLocalizations.of(context).getText(
                              'fknxlrrz' /* Notifications */,
                            ),
                            icon: Icon(
                              FFIcons.kstyleOutlined8,
                              color: Colors.white,
                              size: 22.0,
                            ),
                            options: FFButtonOptions(
                              width: 210.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 100.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              hoverColor: FlutterFlowTheme.of(context).gray600,
                              hoverBorderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              hoverTextColor: Colors.white,
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SIDE_NAV_COMP_USERS_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(SearchWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            '0abiumlx' /* Users */,
                          ),
                          icon: Icon(
                            FFIcons.kfiRsUser,
                            color: Colors.white,
                            size: 18.0,
                          ),
                          options: FFButtonOptions(
                            width: 210.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 100.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            color: Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            hoverColor: FlutterFlowTheme.of(context).gray600,
                            hoverBorderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            hoverTextColor: Colors.white,
                          ),
                          showLoadingIndicator: false,
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SIDE_NAV_COMP_SETTINGS_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                SettingsWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'wv558bxv' /* Settings */,
                            ),
                            icon: Icon(
                              FFIcons.ksetting2Copy,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: 210.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 100.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              hoverColor: FlutterFlowTheme.of(context).gray600,
                              hoverBorderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              hoverTextColor: Colors.white,
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SIDE_NAV_COMP_CLOSE_BTN_ON_TAP');
                              if (FFAppState().navOpen == true) {
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().navOpen = false;
                                safeSetState(() {});
                              } else {
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().navOpen = true;
                                safeSetState(() {});
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              '1uofyoiq' /* Close */,
                            ),
                            icon: Icon(
                              FFIcons.kcontractUpDownLine,
                              color: Colors.white,
                              size: 28.0,
                            ),
                            options: FFButtonOptions(
                              width: 210.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 100.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              hoverColor: FlutterFlowTheme.of(context).gray600,
                              hoverBorderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              hoverTextColor: Colors.white,
                            ),
                            showLoadingIndicator: false,
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
    );
  }
}
