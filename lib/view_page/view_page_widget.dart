import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/job_state_widget.dart';
import '../components/no_search_results_widget.dart';
import '../components/search_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPageWidget extends StatefulWidget {
  const ViewPageWidget({Key key}) : super(key: key);

  @override
  _ViewPageWidgetState createState() => _ViewPageWidgetState();
}

class _ViewPageWidgetState extends State<ViewPageWidget> {
  Map<MaintenanceRecord, bool> checkboxListTileValueMap = {};
  List<MaintenanceRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  DateTimeRange calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFD93A0E),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0, 1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterFlowCalendar(
                    color: FlutterFlowTheme.mellow,
                    iconColor: FlutterFlowTheme.campusGrey,
                    weekFormat: true,
                    weekStartsMonday: false,
                    onChange: (DateTimeRange newSelectedDate) {
                      setState(() => calendarSelectedDay = newSelectedDate);
                    },
                    titleStyle: TextStyle(
                      color: Color(0xFFF6F6F6),
                    ),
                    dayOfWeekStyle: TextStyle(
                      color: Colors.white,
                    ),
                    dateStyle: TextStyle(),
                    selectedDateStyle: TextStyle(),
                    inactiveDateStyle: TextStyle(
                      color: Color(0xFFF6F6F6),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(18, 12, 18, 0),
                    child: SearchWidget(),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(1, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if ((currentUserDocument?.role) == 'Tenant')
                              Expanded(
                                child: AuthUserStreamWidget(
                                  child: DefaultTabController(
                                    length: 2,
                                    initialIndex: 0,
                                    child: Column(
                                      children: [
                                        TabBar(
                                          labelColor:
                                              FlutterFlowTheme.primaryColor,
                                          unselectedLabelColor:
                                              Color(0xFF6E6E6E),
                                          labelStyle:
                                              FlutterFlowTheme.bodyText1,
                                          indicatorColor:
                                              FlutterFlowTheme.secondaryColor,
                                          tabs: [
                                            Tab(
                                              text: 'Pending',
                                            ),
                                            Tab(
                                              text: 'Completed',
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 12, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Search results',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: StreamBuilder<
                                                        List<
                                                            MaintenanceRecord>>(
                                                      stream:
                                                          queryMaintenanceRecord(
                                                        queryBuilder: (maintenanceRecord) =>
                                                            maintenanceRecord
                                                                .where('status',
                                                                    isEqualTo:
                                                                        'Submitted')
                                                                .where('email',
                                                                    isEqualTo:
                                                                        currentUserEmail)
                                                                .orderBy(
                                                                    'created_time',
                                                                    descending:
                                                                        true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 60,
                                                              height: 60,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme
                                                                    .primaryColor,
                                                                size: 60,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<MaintenanceRecord>
                                                            listViewMaintenanceRecordList =
                                                            snapshot.data;
                                                        if (listViewMaintenanceRecordList
                                                            .isEmpty) {
                                                          return Center(
                                                            child:
                                                                NoSearchResultsWidget(),
                                                          );
                                                        }
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewMaintenanceRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewMaintenanceRecord =
                                                                listViewMaintenanceRecordList[
                                                                    listViewIndex];
                                                            return InkWell(
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x47ACACAC),
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          JobStateWidget(
                                                                        jobProgressStatus:
                                                                            listViewMaintenanceRecord,
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Slidable(
                                                                actionPane:
                                                                    const SlidableScrollActionPane(),
                                                                secondaryActions: [
                                                                  IconSlideAction(
                                                                    caption:
                                                                        'Delete',
                                                                    color: FlutterFlowTheme
                                                                        .campusRed,
                                                                    icon: Icons
                                                                        .delete_outline,
                                                                    onTap:
                                                                        () async {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Are you sure you want to delete this record?'),
                                                                            content:
                                                                                Text('This action cannot be undone'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Cancel'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () async {
                                                                                  Navigator.pop(alertDialogContext);
                                                                                  await listViewMaintenanceRecord.reference.delete();
                                                                                  ;
                                                                                },
                                                                                child: Text('Confirm'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            '1 item moved to bin',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.campusGrey,
                                                                          action:
                                                                              SnackBarAction(
                                                                            label:
                                                                                'DISMISS',
                                                                            textColor:
                                                                                Color(0xFF3779FF),
                                                                            onPressed:
                                                                                () async {
                                                                              Navigator.pop(context);
                                                                            },
                                                                          ),
                                                                        ),
                                                                      );
                                                                      await Duration(
                                                                          milliseconds:
                                                                              3000);
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        PageTransition(
                                                                          type:
                                                                              PageTransitionType.bottomToTop,
                                                                          duration:
                                                                              Duration(milliseconds: 300),
                                                                          reverseDuration:
                                                                              Duration(milliseconds: 300),
                                                                          child:
                                                                              NavBarPage(initialPage: 'viewPage'),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                                child: ListTile(
                                                                  leading: Icon(
                                                                    Icons
                                                                        .account_box_rounded,
                                                                    color: FlutterFlowTheme
                                                                        .campusGrey,
                                                                    size: 35,
                                                                  ),
                                                                  title: Text(
                                                                    listViewMaintenanceRecord
                                                                        .issue,
                                                                    style: FlutterFlowTheme
                                                                        .title2
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                  ),
                                                                  subtitle:
                                                                      Text(
                                                                    '${dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime)} ${dateTimeFormat('jm', listViewMaintenanceRecord.createdTime)}',
                                                                    style: FlutterFlowTheme
                                                                        .subtitle2
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                  trailing:
                                                                      Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right_sharp,
                                                                    color: Color(
                                                                        0xFF303030),
                                                                    size: 20,
                                                                  ),
                                                                  tileColor: Color(
                                                                      0x00FFFFFF),
                                                                  dense: false,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 12, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Search results',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: StreamBuilder<
                                                          List<
                                                              MaintenanceRecord>>(
                                                        stream:
                                                            queryMaintenanceRecord(
                                                          queryBuilder: (maintenanceRecord) =>
                                                              maintenanceRecord
                                                                  .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'Completed')
                                                                  .where(
                                                                      'email',
                                                                      isEqualTo:
                                                                          currentUserEmail)
                                                                  .orderBy(
                                                                      'created_time',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 60,
                                                                height: 60,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme
                                                                      .primaryColor,
                                                                  size: 60,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<MaintenanceRecord>
                                                              listViewMaintenanceRecordList =
                                                              snapshot.data;
                                                          if (listViewMaintenanceRecordList
                                                              .isEmpty) {
                                                            return Center(
                                                              child:
                                                                  NoSearchResultsWidget(),
                                                            );
                                                          }
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewMaintenanceRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewMaintenanceRecord =
                                                                  listViewMaintenanceRecordList[
                                                                      listViewIndex];
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    barrierColor:
                                                                        Color(
                                                                            0x47ACACAC),
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            JobStateWidget(
                                                                          jobProgressStatus:
                                                                              listViewMaintenanceRecord,
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child: ListTile(
                                                                  leading: Icon(
                                                                    Icons
                                                                        .account_box,
                                                                    color: FlutterFlowTheme
                                                                        .campusGrey,
                                                                    size: 35,
                                                                  ),
                                                                  title: Text(
                                                                    listViewMaintenanceRecord
                                                                        .issue,
                                                                    style: FlutterFlowTheme
                                                                        .title1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  subtitle:
                                                                      Text(
                                                                    '${dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime)} ${dateTimeFormat('jm', listViewMaintenanceRecord.createdTime)}',
                                                                    style: FlutterFlowTheme
                                                                        .subtitle2
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                  trailing:
                                                                      Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right_sharp,
                                                                    color: Color(
                                                                        0xFF303030),
                                                                    size: 20,
                                                                  ),
                                                                  tileColor: Color(
                                                                      0x00F5F5F5),
                                                                  dense: false,
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
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
                                  ),
                                ),
                              ),
                            if ((currentUserDocument?.role) == 'Admin')
                              Expanded(
                                child: AuthUserStreamWidget(
                                  child: DefaultTabController(
                                    length: 2,
                                    initialIndex: 0,
                                    child: Column(
                                      children: [
                                        TabBar(
                                          labelColor:
                                              FlutterFlowTheme.primaryColor,
                                          unselectedLabelColor:
                                              Color(0xFF6E6E6E),
                                          labelStyle:
                                              FlutterFlowTheme.bodyText1,
                                          indicatorColor:
                                              FlutterFlowTheme.secondaryColor,
                                          tabs: [
                                            Tab(
                                              text: 'Pending',
                                            ),
                                            Tab(
                                              text: 'Completed',
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 12, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Search results',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 8, 0, 0),
                                                      child: StreamBuilder<
                                                          List<
                                                              MaintenanceRecord>>(
                                                        stream:
                                                            queryMaintenanceRecord(
                                                          queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                              .where('status',
                                                                  isEqualTo:
                                                                      'Submitted')
                                                              .where('building',
                                                                  isEqualTo:
                                                                      currentUserDocument
                                                                          ?.building)
                                                              .orderBy(
                                                                  'created_time',
                                                                  descending:
                                                                      true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 60,
                                                                height: 60,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme
                                                                      .primaryColor,
                                                                  size: 60,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<MaintenanceRecord>
                                                              listViewMaintenanceRecordList =
                                                              snapshot.data;
                                                          if (listViewMaintenanceRecordList
                                                              .isEmpty) {
                                                            return Center(
                                                              child:
                                                                  NoSearchResultsWidget(),
                                                            );
                                                          }
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewMaintenanceRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewMaintenanceRecord =
                                                                  listViewMaintenanceRecordList[
                                                                      listViewIndex];
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    barrierColor:
                                                                        Color(
                                                                            0x61AAAAAA),
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            JobStateWidget(
                                                                          jobProgressStatus:
                                                                              listViewMaintenanceRecord,
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child: Slidable(
                                                                  actionPane:
                                                                      const SlidableScrollActionPane(),
                                                                  secondaryActions: [
                                                                    IconSlideAction(
                                                                      caption:
                                                                          'Completed',
                                                                      color: FlutterFlowTheme
                                                                          .campusRed,
                                                                      icon: Icons
                                                                          .check_circle_rounded,
                                                                      onTap:
                                                                          () async {
                                                                        final maintenanceUpdateData =
                                                                            createMaintenanceRecordData(
                                                                          status:
                                                                              'Completed',
                                                                          isDone:
                                                                              true,
                                                                        );
                                                                        await listViewMaintenanceRecord
                                                                            .reference
                                                                            .update(maintenanceUpdateData);
                                                                      },
                                                                    ),
                                                                  ],
                                                                  child:
                                                                      ListTile(
                                                                    title: Text(
                                                                      listViewMaintenanceRecord
                                                                          .issue,
                                                                      style: FlutterFlowTheme
                                                                          .title3
                                                                          .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      listViewMaintenanceRecord
                                                                          .room,
                                                                      style: FlutterFlowTheme
                                                                          .subtitle2
                                                                          .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right,
                                                                      color: Color(
                                                                          0xFF303030),
                                                                      size: 20,
                                                                    ),
                                                                    tileColor:
                                                                        Color(
                                                                            0xFFF5F5F5),
                                                                    dense:
                                                                        false,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 12, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Search results',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: StreamBuilder<
                                                          List<
                                                              MaintenanceRecord>>(
                                                        stream:
                                                            queryMaintenanceRecord(
                                                          queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                              .where('status',
                                                                  isEqualTo:
                                                                      'Completed')
                                                              .where('building',
                                                                  isEqualTo:
                                                                      currentUserDocument
                                                                          ?.building)
                                                              .orderBy(
                                                                  'created_time',
                                                                  descending:
                                                                      true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 60,
                                                                height: 60,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme
                                                                      .primaryColor,
                                                                  size: 60,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<MaintenanceRecord>
                                                              listViewMaintenanceRecordList =
                                                              snapshot.data;
                                                          if (listViewMaintenanceRecordList
                                                              .isEmpty) {
                                                            return Center(
                                                              child:
                                                                  NoSearchResultsWidget(),
                                                            );
                                                          }
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewMaintenanceRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewMaintenanceRecord =
                                                                  listViewMaintenanceRecordList[
                                                                      listViewIndex];
                                                              return Theme(
                                                                data: ThemeData(
                                                                  checkboxTheme:
                                                                      CheckboxThemeData(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25),
                                                                    ),
                                                                  ),
                                                                ),
                                                                child:
                                                                    CheckboxListTile(
                                                                  value: checkboxListTileValueMap[
                                                                          listViewMaintenanceRecord] ??=
                                                                      listViewMaintenanceRecord
                                                                          .isDone,
                                                                  onChanged: (newValue) =>
                                                                      setState(() =>
                                                                          checkboxListTileValueMap[listViewMaintenanceRecord] =
                                                                              newValue),
                                                                  title: Text(
                                                                    listViewMaintenanceRecord
                                                                        .issue,
                                                                    style: FlutterFlowTheme
                                                                        .title3
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                  subtitle:
                                                                      Text(
                                                                    listViewMaintenanceRecord
                                                                        .room,
                                                                    style: FlutterFlowTheme
                                                                        .subtitle2
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                  tileColor: Color(
                                                                      0xFFF5F5F5),
                                                                  activeColor:
                                                                      FlutterFlowTheme
                                                                          .campusRed,
                                                                  dense: false,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
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
                                  ),
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
        ),
      ),
    );
  }
}
