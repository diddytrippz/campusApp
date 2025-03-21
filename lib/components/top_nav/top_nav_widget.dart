import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'top_nav_model.dart';
export 'top_nav_model.dart';

class TopNavWidget extends StatefulWidget {
  const TopNavWidget({super.key});

  @override
  State<TopNavWidget> createState() => _TopNavWidgetState();
}

class _TopNavWidgetState extends State<TopNavWidget>
    with TickerProviderStateMixin {
  late TopNavModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopNavModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-40.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
          ))
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 20.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('TOP_NAV_COMP_Image_q07maw7z_ON_TAP');
                        logFirebaseEvent('Image_navigate_to');

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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          Theme.of(context).brightness == Brightness.dark
                              ? 'assets/images/campus-africa-banner.png'
                              : 'assets/images/appstore.png',
                          width: 60.0,
                          height: 60.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('TOP_NAV_COMP_lightDark_small_ON_TAP');
                      if ((Theme.of(context).brightness == Brightness.light) ==
                          true) {
                        logFirebaseEvent(
                            'lightDark_small_set_dark_mode_settings');
                        setDarkModeSetting(context, ThemeMode.dark);
                        logFirebaseEvent('lightDark_small_widget_animation');
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['containerOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0);
                        }
                      } else {
                        logFirebaseEvent(
                            'lightDark_small_set_dark_mode_settings');
                        setDarkModeSetting(context, ThemeMode.light);
                        logFirebaseEvent('lightDark_small_widget_animation');
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['containerOnActionTriggerAnimation']!
                              .controller
                              .reverse();
                        }
                      }
                    },
                    child: Container(
                      width: 80.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F8),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Color(0xFFE0E3E7),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.9, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.wb_sunny_rounded,
                                  color: Color(0xFF57636C),
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 6.0, 0.0),
                                child: Icon(
                                  Icons.mode_night_rounded,
                                  color: Color(0xFF57636C),
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Container(
                                width: 36.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x430B0D0F),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'containerOnActionTriggerAnimation']!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  AlignedTooltip(
                    content: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'qqo7e29q' /* Notifications */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                    offset: 4.0,
                    preferredDirection: AxisDirection.down,
                    borderRadius: BorderRadius.circular(8.0),
                    backgroundColor: FlutterFlowTheme.of(context).primaryText,
                    elevation: 4.0,
                    tailBaseWidth: 24.0,
                    tailLength: 12.0,
                    waitDuration: Duration(milliseconds: 80),
                    showDuration: Duration(milliseconds: 200),
                    triggerMode: TooltipTriggerMode.tap,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                      child: badges.Badge(
                        badgeContent: Text(
                          FFLocalizations.of(context).getText(
                            'pz3wfgla' /*   */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                        ),
                        showBadge: true,
                        shape: badges.BadgeShape.circle,
                        badgeColor: FlutterFlowTheme.of(context).campusRed,
                        elevation: 4.0,
                        padding: EdgeInsets.all(7.0),
                        position: badges.BadgePosition.topEnd(),
                        animationType: badges.BadgeAnimationType.scale,
                        toAnimate: true,
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).lineColor,
                          borderRadius: 8.0,
                          borderWidth: 0.0,
                          buttonSize: 55.0,
                          fillColor: Colors.transparent,
                          icon: Icon(
                            FFIcons.knotificationBingCopy,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'TOP_NAV_notificationBingCopy_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_to');

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
                        ),
                      ),
                    ),
                  ),
                AuthUserStreamWidget(
                  builder: (context) => AlignedTooltip(
                    content: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        valueOrDefault(currentUserDocument?.firstName, ''),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                    offset: 4.0,
                    preferredDirection: AxisDirection.down,
                    borderRadius: BorderRadius.circular(8.0),
                    backgroundColor: FlutterFlowTheme.of(context).primaryText,
                    elevation: 2.0,
                    tailBaseWidth: 24.0,
                    tailLength: 12.0,
                    waitDuration: Duration(milliseconds: 80),
                    showDuration: Duration(milliseconds: 200),
                    triggerMode: TooltipTriggerMode.tap,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'TOP_NAV_COMP_CircleImage_nc9zrjqb_ON_TAP');
                        logFirebaseEvent('CircleImage_expand_image');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: FlutterFlowExpandedImageView(
                              image: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                fit: BoxFit.contain,
                              ),
                              allowRotation: false,
                              tag: 'circleImageTag',
                              useHeroAnimation: true,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'circleImageTag',
                        transitionOnUserGestures: true,
                        child: Container(
                          width: 55.0,
                          height: 55.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
