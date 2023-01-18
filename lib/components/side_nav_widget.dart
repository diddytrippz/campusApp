import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideNavWidget extends StatefulWidget {
  const SideNavWidget({
    Key? key,
    this.nav1Color,
    this.nav2Color,
    this.nav3Color,
    this.nav4Color,
    this.nav5Color,
    this.nav6Color,
    this.nav7Color,
  }) : super(key: key);

  final Color? nav1Color;
  final Color? nav2Color;
  final Color? nav3Color;
  final Color? nav4Color;
  final Color? nav5Color;
  final Color? nav6Color;
  final Color? nav7Color;

  @override
  _SideNavWidgetState createState() => _SideNavWidgetState();
}

class _SideNavWidgetState extends State<SideNavWidget> {
  bool mouseRegionHovered1 = false;
  bool mouseRegionHovered2 = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 0,
                color: FlutterFlowTheme.of(context).lineColor,
                offset: Offset(1, 0),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 32, 24, 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'x0l4kq51' /* Campus Africa */,
                          ),
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'mdh6tpe4' /* MENU */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  MouseRegion(
                    opaque: false,
                    cursor: SystemMouseCursors.contextMenu ?? MouseCursor.defer,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent('SIDE_NAV_COMP_Row_rgq06ob3_ON_TAP');
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed('home');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                              child: Icon(
                                FFIcons.kic29,
                                color: widget.nav1Color,
                                size: 22,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'kw4npc6y' /* Home */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: widget.nav1Color,
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('SIDE_NAV_COMP_Row_nk176y9v_ON_TAP');
                        logFirebaseEvent('Row_navigate_to');

                        context.pushNamed('dashboard');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Icon(
                              Icons.data_usage,
                              color: widget.nav7Color,
                              size: 28,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'qa3se4pd' /* Admin Dashboard */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: widget.nav7Color,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('SIDE_NAV_COMP_Row_flvf3mvb_ON_TAP');
                        logFirebaseEvent('Row_navigate_to');

                        context.pushNamed('view');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Icon(
                              FFIcons.kclipboardTextCopy,
                              color: widget.nav2Color,
                              size: 28,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                't5vq29q1' /* View Tickets */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: widget.nav2Color,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('SIDE_NAV_COMP_Row_84dxzcmt_ON_TAP');
                        logFirebaseEvent('Row_navigate_to');

                        context.pushNamed('messages');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Icon(
                              FFIcons.kic27,
                              color: widget.nav3Color,
                              size: 22,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'j8681eie' /* Messages */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: widget.nav3Color,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ep2r2in9' /* ADVANCED SETTINGS */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('SIDE_NAV_COMP_Row_fhkcqd4v_ON_TAP');
                        logFirebaseEvent('Row_navigate_to');

                        context.pushNamed('notifications');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Icon(
                              FFIcons.knotification1Copy,
                              color: widget.nav5Color,
                              size: 26,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'vblitw5u' /* Notifications */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: widget.nav5Color,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MouseRegion(
                        opaque: false,
                        cursor:
                            SystemMouseCursors.forbidden ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: Icon(
                                  FFIcons.kuserTagCopy,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 26,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'bls7d7dx' /* Manage Visitors */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => mouseRegionHovered2 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => mouseRegionHovered2 = false);
                        }),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 12, 0, 12),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SIDE_NAV_COMP_Row_3v5es19c_ON_TAP');
                            logFirebaseEvent('Row_navigate_to');

                            context.pushNamed('visitorsManagement');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: Icon(
                                  FFIcons.kuserCirlceAdd,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 26,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'eqk2sg1h' /* Add Visitors */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 12, 0, 12),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SIDE_NAV_COMP_Row_szq630sq_ON_TAP');
                            logFirebaseEvent('Row_navigate_to');

                            context.pushNamed('myVisitors');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: Icon(
                                  FFIcons.kuserTagCopy,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 26,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'kvxrkvlp' /* Manage Visitors */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('SIDE_NAV_COMP_Row_l99cvlw1_ON_TAP');
                        logFirebaseEvent('Row_navigate_to');

                        context.pushNamed('addInspection');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Icon(
                              FFIcons.kclipboardTickCopy,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 26,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'hdqqhj1s' /* Inspections */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('SIDE_NAV_COMP_Row_t1032x3x_ON_TAP');
                        logFirebaseEvent('Row_navigate_to');

                        context.pushNamed('search');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Icon(
                              FFIcons.kuserCopy,
                              color: widget.nav4Color,
                              size: 27,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '1ifk0xp2' /* Users */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: widget.nav4Color,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 8),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('SIDE_NAV_COMP_Row_0ylqr4xj_ON_TAP');
                        logFirebaseEvent('Row_navigate_to');

                        context.pushNamed('settings');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Icon(
                              FFIcons.ksettingsThree,
                              color: widget.nav6Color,
                              size: 27,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'f638xly7' /* Settings */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: widget.nav6Color,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('SIDE_NAV_COMP_Row_o5ezsg5w_ON_TAP');
                        logFirebaseEvent('Row_auth');
                        GoRouter.of(context).prepareAuthEvent();
                        await signOut();

                        context.goNamedAuth('login', mounted);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Icon(
                              Icons.exit_to_app_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'hpde03g2' /* Logout */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
          ),
        ),
      ],
    );
  }
}
