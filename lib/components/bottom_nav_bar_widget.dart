import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    Key? key,
    this.homeColor,
    this.messageColor,
    this.notificationColor,
    this.settingsColor,
  }) : super(key: key);

  final Color? homeColor;
  final Color? messageColor;
  final Color? notificationColor;
  final Color? settingsColor;

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnActionTriggerAnimation': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (FFAppState().btmNavVis)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0x8B000000),
            ),
          ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (FFAppState().btmNavVis)
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAV_BAR_Column_p4nmh717_ON_TAP');
                              logFirebaseEvent('Column_Navigate-To');
                              context.pushNamed(
                                'messagesPage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  elevation: 1,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFDFD),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Icon(
                                        FFIcons.kic27,
                                        color: Colors.black,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'sol4e3xb' /* Inbox */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: Color(0xFFFFFDFD),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'BOTTOM_NAV_BAR_Column_8qpxzasq_ON_TAP');
                                logFirebaseEvent('Column_Navigate-To');
                                context.pushNamed(
                                  'homePage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 1,
                                    shape: const CircleBorder(),
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFDFD),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.black,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '1vi6g268' /* Report */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: Color(0xFFFFFDFD),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAV_BAR_Column_2d7e194y_ON_TAP');
                              logFirebaseEvent('Column_Navigate-To');
                              context.pushNamed(
                                'settingsPage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  elevation: 1,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFDFD),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Icon(
                                        FFIcons.ksettingsThree,
                                        color: Colors.black,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'y8l90vi9' /* Settings */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: Color(0xFFFFFDFD),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
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
              ).animated([animationsMap['columnOnActionTriggerAnimation']!]),
            Stack(
              alignment: AlignmentDirectional(0, 1),
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 22, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(55),
                            ),
                          ),
                          child: Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(55),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 18, 20, 18),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'BOTTOM_NAV_BAR_Column_yq73ljy1_ON_TAP');
                                      logFirebaseEvent(
                                          'Column_Haptic-Feedback');
                                      HapticFeedback.selectionClick();
                                      logFirebaseEvent('Column_Navigate-To');
                                      context.pushNamed(
                                        'viewPage',
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.kic29,
                                          color: widget.homeColor,
                                          size: 22,
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'BOTTOM_NAV_BAR_Column_snb0zv2r_ON_TAP');
                                      logFirebaseEvent(
                                          'Column_Haptic-Feedback');
                                      HapticFeedback.selectionClick();
                                      logFirebaseEvent('Column_Navigate-To');
                                      context.pushNamed(
                                        'messagesPage',
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Badge(
                                            badgeContent: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dyx56i25' /*  */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.white,
                                                        fontSize: 0,
                                                      ),
                                            ),
                                            showBadge: true,
                                            shape: BadgeShape.circle,
                                            badgeColor: Color(0xFFC8360E),
                                            elevation: 1,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6, 6, 6, 6),
                                            position: BadgePosition.topEnd(),
                                            animationType:
                                                BadgeAnimationType.scale,
                                            toAnimate: true,
                                            child: Icon(
                                              FFIcons.kic27,
                                              color: widget.messageColor,
                                              size: 22,
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
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(55),
                              topRight: Radius.circular(6),
                            ),
                          ),
                          child: Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(55),
                                topRight: Radius.circular(6),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 18, 0, 18),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'BOTTOM_NAV_BAR_Column_s6l4ip5r_ON_TAP');
                                      logFirebaseEvent(
                                          'Column_Haptic-Feedback');
                                      HapticFeedback.selectionClick();
                                      logFirebaseEvent('Column_Navigate-To');
                                      context.pushNamed(
                                        'notifications',
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            FFIcons.kic15,
                                            color: widget.notificationColor,
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'BOTTOM_NAV_BAR_Column_1wv0vx12_ON_TAP');
                                      logFirebaseEvent(
                                          'Column_Haptic-Feedback');
                                      HapticFeedback.selectionClick();
                                      logFirebaseEvent('Column_Navigate-To');
                                      context.pushNamed(
                                        'settingsPage',
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            FFIcons.ksettingsThree,
                                            color: widget.settingsColor,
                                            size: 26,
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
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    width: 60,
                    height: 50,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                if (!FFAppState().btmNavVis)
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 50,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 12,
                                color: Color(0x33000000),
                                offset: Offset(0, 5),
                              )
                            ],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAV_BAR_Column_188tnx3r_ON_TAP');
                              logFirebaseEvent('Column_Haptic-Feedback');
                              HapticFeedback.selectionClick();
                              logFirebaseEvent('Column_Update-Local-State');
                              setState(() => FFAppState().btmNavVis = true);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().btmNavVis)
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 50,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAV_BAR_Column_t880ep7z_ON_TAP');
                              logFirebaseEvent('Column_Haptic-Feedback');
                              HapticFeedback.selectionClick();
                              logFirebaseEvent('Column_Update-Local-State');
                              setState(() => FFAppState().btmNavVis = false);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.clear_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
