import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'notifications'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        automaticallyImplyLeading: false,
        title: AutoSizeText(
          'Notifications',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 18, 20, 0),
            child: Badge(
              badgeContent: Text(
                '1',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Open Sans',
                      color: Colors.white,
                      fontSize: 12,
                    ),
              ),
              showBadge: true,
              shape: BadgeShape.circle,
              badgeColor: FlutterFlowTheme.of(context).campusRed,
              elevation: 0,
              padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
              position: BadgePosition.topEnd(),
              animationType: BadgeAnimationType.scale,
              toAnimate: true,
              child: FaIcon(
                FontAwesomeIcons.solidBell,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      floatingActionButton: Visibility(
        visible: (valueOrDefault(currentUserDocument?.role, '')) == 'Admin',
        child: AuthUserStreamWidget(
          child: FloatingActionButton(
            onPressed: () async {
              logFirebaseEvent('NOTIFICATIONS_FloatingActionButton_bk5g2');
              logFirebaseEvent('FloatingActionButton_Navigate-To');
              context.pushNamed('sendNotifi');
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            elevation: 8,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        labelPadding:
                            EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        indicatorColor:
                            FlutterFlowTheme.of(context).primaryText,
                        tabs: [
                          Tab(
                            text: 'Latest',
                          ),
                          Tab(
                            text: 'Following',
                          ),
                          Tab(
                            text: 'All',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: AuthUserStreamWidget(
                                child: StreamBuilder<List<NotificationsRecord>>(
                                  stream: queryNotificationsRecord(
                                    queryBuilder: (notificationsRecord) =>
                                        notificationsRecord
                                            .where('building',
                                                isEqualTo: valueOrDefault(
                                                    currentUserDocument
                                                        ?.building,
                                                    ''))
                                            .where('sendToAll',
                                                isEqualTo: false)
                                            .orderBy('dateCreate',
                                                descending: true),
                                    limit: 10,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 60,
                                          ),
                                        ),
                                      );
                                    }
                                    List<NotificationsRecord>
                                        columnNotificationsRecordList =
                                        snapshot.data!;
                                    if (columnNotificationsRecordList.isEmpty) {
                                      return Center(
                                        child: SvgPicture.asset(
                                          'assets/images/undraw_the_search_s0xf.svg',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                        ),
                                      );
                                    }
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            columnNotificationsRecordList
                                                .length, (columnIndex) {
                                          final columnNotificationsRecord =
                                              columnNotificationsRecordList[
                                                  columnIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 18, 0),
                                            child: InkWell(
                                              onLongPress: () async {
                                                logFirebaseEvent(
                                                    'NOTIFICATIONS_Row_20zxyomr_ON_LONG_PRESS');
                                                if ((valueOrDefault(
                                                        currentUserDocument
                                                            ?.role,
                                                        '')) ==
                                                    'Admin') {
                                                  logFirebaseEvent(
                                                      'Row_Alert-Dialog');
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Delete Notification'),
                                                                content: Text(
                                                                    'Are you sure you want to delete this notification?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    logFirebaseEvent(
                                                        'Row_Backend-Call');
                                                    await columnNotificationsRecord!
                                                        .reference
                                                        .delete();
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Row_Navigate-To');
                                                    context.pushNamed(
                                                        'notifications');
                                                  }

                                                  return;
                                                } else {
                                                  return;
                                                }
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/campus_logo_1.png',
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AutoSizeText(
                                                            columnNotificationsRecord!
                                                                .title!
                                                                .maybeHandleOverflow(
                                                              maxChars: 75,
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
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        10,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  dateTimeFormat(
                                                                      'relative',
                                                                      columnNotificationsRecord!
                                                                          .dateCreate!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  columnNotificationsRecord!
                                                                      .urgency!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .campusRed,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w800,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        15,
                                                                        0,
                                                                        0),
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 0.2,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x81464749),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
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
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30, 40, 30, 40),
                                    child: SvgPicture.asset(
                                      'assets/images/undraw_the_search_s0xf.svg',
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: StreamBuilder<List<NotificationsRecord>>(
                                stream: queryNotificationsRecord(
                                  queryBuilder: (notificationsRecord) =>
                                      notificationsRecord
                                          .where('sendToAll', isEqualTo: true)
                                          .orderBy('dateCreate',
                                              descending: true),
                                  limit: 10,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: SpinKitPulse(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 60,
                                        ),
                                      ),
                                    );
                                  }
                                  List<NotificationsRecord>
                                      columnNotificationsRecordList =
                                      snapshot.data!;
                                  if (columnNotificationsRecordList.isEmpty) {
                                    return Center(
                                      child: SvgPicture.asset(
                                        'assets/images/undraw_the_search_s0xf.svg',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                      ),
                                    );
                                  }
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnNotificationsRecordList.length,
                                          (columnIndex) {
                                        final columnNotificationsRecord =
                                            columnNotificationsRecordList[
                                                columnIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 18, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'NOTIFICATIONS_PAGE_Row_crrg35dq_ON_TAP');
                                              if ((valueOrDefault(
                                                      currentUserDocument?.role,
                                                      '')) ==
                                                  'Admin') {
                                                logFirebaseEvent(
                                                    'Row_Alert-Dialog');
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Delete Notification'),
                                                              content: Text(
                                                                  'Are you sure you want to delete this notification?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirm'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  logFirebaseEvent(
                                                      'Row_Backend-Call');
                                                  await columnNotificationsRecord!
                                                      .reference
                                                      .delete();
                                                } else {
                                                  logFirebaseEvent(
                                                      'Row_Navigate-To');
                                                  context.pushNamed(
                                                      'notifications');
                                                }

                                                return;
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/campus_logo_1.png',
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                18, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        AutoSizeText(
                                                          columnNotificationsRecord!
                                                              .title!
                                                              .maybeHandleOverflow(
                                                            maxChars: 75,
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
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                dateTimeFormat(
                                                                    'relative',
                                                                    columnNotificationsRecord!
                                                                        .dateCreate!),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Text(
                                                                columnNotificationsRecord!
                                                                    .urgency!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .campusRed,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      15, 0, 0),
                                                          child: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 0.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x81464749),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0),
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
                                        );
                                      }),
                                    ),
                                  );
                                },
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
    );
  }
}
