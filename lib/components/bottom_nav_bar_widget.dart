import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  bool mouseRegionHovered = false;
  var hasColumnTriggered = false;
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0, 320),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0, 230),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0, 150),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0, 90),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 4,
            ),
            child: Visibility(
              visible: FFAppState().btmNavVis,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: Color(0x8B000000),
                ),
              ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (FFAppState().btmNavVis)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MouseRegion(
                      opaque: false,
                      cursor:
                          SystemMouseCursors.contextMenu ?? MouseCursor.defer,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'BOTTOM_NAV_BAR_Column_avwkl14v_ON_TAP');
                            logFirebaseEvent('Column_navigate_to');

                            context.pushNamed(
                              'addInspection',
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
                                    color: Color(0xFF219700),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Icon(
                                      FFIcons.kclipboardTextCopy,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation1']!),
                            ],
                          ),
                        ),
                      ),
                      onEnter: ((event) async {
                        setState(() => mouseRegionHovered = true);
                      }),
                      onExit: ((event) async {
                        setState(() => mouseRegionHovered = false);
                      }),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'BOTTOM_NAV_BAR_Column_pwu4sl9s_ON_TAP');
                          logFirebaseEvent('Column_navigate_to');

                          context.pushNamed(
                            'myVisitors',
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
                                  color: Color(0xFFFFBA00),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Icon(
                                    FFIcons.kuserTagCopy,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation2']!),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'BOTTOM_NAV_BAR_Column_dbbzahcs_ON_TAP');
                          logFirebaseEvent('Column_navigate_to');

                          context.pushNamed(
                            'home',
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
                                  color: Color(0xFFCD350B),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Icon(
                                    FFIcons.kmagicpenCopy,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation3']!),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'BOTTOM_NAV_BAR_Column_jtqt8l4g_ON_TAP');
                          logFirebaseEvent('Column_navigate_to');

                          context.pushNamed(
                            'messages',
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
                                  color: Color(0xFF008FFF),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Icon(
                                    FFIcons.kic27,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation4']!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 18, 80, 18),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'BOTTOM_NAV_BAR_Column_a4nf6otb_ON_TAP');
                                logFirebaseEvent('Column_haptic_feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('Column_navigate_to');

                                context.pushNamed(
                                  'view',
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
                                    'BOTTOM_NAV_BAR_Column_smmzqn0g_ON_TAP');
                                logFirebaseEvent('Column_haptic_feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('Column_navigate_to');

                                context.pushNamed(
                                  'messages',
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
                                  Icon(
                                    FFIcons.kic27,
                                    color: widget.messageColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'BOTTOM_NAV_BAR_Column_gwmfiexv_ON_TAP');
                                logFirebaseEvent('Column_haptic_feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('Column_navigate_to');

                                context.pushNamed(
                                  'notifications',
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
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Icon(
                                      FFIcons.knotification1Copy,
                                      color: widget.notificationColor,
                                      size: 27,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'BOTTOM_NAV_BAR_Column_awi41zza_ON_TAP');
                                logFirebaseEvent('Column_haptic_feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('Column_navigate_to');

                                context.pushNamed(
                                  'settings',
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
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Icon(
                                      FFIcons.ksettingsThree,
                                      color: widget.settingsColor,
                                      size: 28,
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
                if (FFAppState().btmNavVis)
                  Align(
                    alignment: AlignmentDirectional(0.9, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 50,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 60,
                          height: 60,
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
                                  'BOTTOM_NAV_BAR_Column_r8tofrp4_ON_TAP');
                              logFirebaseEvent('Column_haptic_feedback');
                              HapticFeedback.selectionClick();
                              logFirebaseEvent('Column_update_local_state');
                              FFAppState().update(() {
                                FFAppState().btmNavVis = false;
                              });
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
                if (!FFAppState().btmNavVis)
                  Align(
                    alignment: AlignmentDirectional(0.9, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 50,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0x0057636C),
                              width: 0,
                            ),
                          ),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAV_BAR_Column_yvon5pd7_ON_TAP');
                              logFirebaseEvent('Column_haptic_feedback');
                              HapticFeedback.selectionClick();
                              logFirebaseEvent('Column_update_local_state');
                              FFAppState().update(() {
                                FFAppState().btmNavVis = true;
                              });
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
              ],
            ),
          ],
        ),
      ],
    );
  }
}
