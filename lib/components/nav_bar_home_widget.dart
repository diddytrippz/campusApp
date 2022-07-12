import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarHomeWidget extends StatefulWidget {
  const NavBarHomeWidget({Key? key}) : super(key: key);

  @override
  _NavBarHomeWidgetState createState() => _NavBarHomeWidgetState();
}

class _NavBarHomeWidgetState extends State<NavBarHomeWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconOnActionTriggerAnimation1': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 900,
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
    'iconOnActionTriggerAnimation2': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 900,
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
    'iconOnActionTriggerAnimation3': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 900,
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
    'iconOnActionTriggerAnimation4': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 900,
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
    'containerOnActionTriggerAnimation': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 900,
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Stack(
        alignment: AlignmentDirectional(0, 1),
        children: [
          Material(
            color: Colors.transparent,
            elevation: 50,
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 50, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_HOME_COMP_IconEdit_ON_TAP');
                                logFirebaseEvent('IconEdit_Haptic-Feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('IconEdit_Navigate-To');
                                context.pushNamed(
                                  'viewPage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                    ),
                                  },
                                );
                              },
                              child: FaIcon(
                                FontAwesomeIcons.edit,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                            ).animated([
                              animationsMap['iconOnActionTriggerAnimation1']!
                            ]),
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_HOME_COMP_IconInbox_ON_TAP');
                                logFirebaseEvent('IconInbox_Haptic-Feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('IconInbox_Navigate-To');
                                context.pushNamed(
                                  'MessagesPage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                    ),
                                  },
                                );
                              },
                              child: Icon(
                                FFIcons.kchatboxes,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 29,
                              ),
                            ).animated([
                              animationsMap['iconOnActionTriggerAnimation2']!
                            ]),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_HOME_COMP_IconNoti_ON_TAP');
                                logFirebaseEvent('IconNoti_Haptic-Feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('IconNoti_Navigate-To');
                                context.pushNamed(
                                  'notifications',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                    ),
                                  },
                                );
                              },
                              child: Icon(
                                Icons.notifications_none,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30,
                              ),
                            ).animated([
                              animationsMap['iconOnActionTriggerAnimation3']!
                            ]),
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_HOME_COMP_IconSettings_ON_TAP');
                                logFirebaseEvent(
                                    'IconSettings_Haptic-Feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('IconSettings_Navigate-To');
                                context.pushNamed(
                                  'newSettings',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                    ),
                                  },
                                );
                              },
                              child: Icon(
                                Icons.settings_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 28,
                              ),
                            ).animated([
                              animationsMap['iconOnActionTriggerAnimation4']!
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0.85),
            child: Material(
              color: Colors.transparent,
              elevation: 50,
              shape: const CircleBorder(),
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFF7),
                  shape: BoxShape.circle,
                ),
                child: FlutterFlowIconButton(
                  borderColor: Color(0xFFFFFFF7),
                  borderRadius: 55,
                  borderWidth: 4,
                  buttonSize: 55,
                  fillColor: FlutterFlowTheme.of(context).campusRed,
                  icon: Icon(
                    Icons.dashboard_rounded,
                    color: Color(0xFFFFFFF7),
                    size: 30,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'NAV_BAR_HOME_dashboard_rounded_ICN_ON_TA');
                    logFirebaseEvent('IconButton_Haptic-Feedback');
                    HapticFeedback.selectionClick();
                    if ((valueOrDefault(currentUserDocument?.role, '')) ==
                        'Admin') {
                      logFirebaseEvent('IconButton_Navigate-To');
                      context.pushNamed(
                        'dashboard',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                      return;
                    } else {
                      logFirebaseEvent('IconButton_Navigate-To');
                      context.pushNamed(
                        'homePage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                      return;
                    }
                  },
                ),
              ),
            ).animated([animationsMap['containerOnActionTriggerAnimation']!]),
          ),
        ],
      ),
    );
  }
}
