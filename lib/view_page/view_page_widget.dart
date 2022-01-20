import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/no_search_results_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../rate/rate_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
  DateTimeRange calendarSelectedDay;
  List<MaintenanceRecord> algoliaSearchResults = [];
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    textController = TextEditingController();
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 12, 18, 0),
                child: Column(
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
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Search here...',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF262D34),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Color(0xFF57636C),
                                    size: 20,
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF262D34),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() => algoliaSearchResults = null);
                                await MaintenanceRecord.search(
                                  term: textController.text,
                                  maxResults: 10,
                                )
                                    .then((r) => algoliaSearchResults = r)
                                    .onError(
                                        (_, __) => algoliaSearchResults = [])
                                    .whenComplete(() => setState(() {}));
                              },
                              text: 'Search',
                              options: FFButtonOptions(
                                width: 100,
                                height: 40,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .bottomToTop,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    reverseDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                300),
                                                                    child:
                                                                        RateWidget(
                                                                      jobStatus:
                                                                          listViewMaintenanceRecord,
                                                                    ),
                                                                  ),
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
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      reverseDuration:
                                                                          Duration(
                                                                              milliseconds: 300),
                                                                      child:
                                                                          RateWidget(
                                                                        jobStatus:
                                                                            listViewMaintenanceRecord,
                                                                      ),
                                                                    ),
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
                                                              .where('isDone',
                                                                  isEqualTo:
                                                                      false)
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
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .bottomToTop,
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                        reverseDuration:
                                                                            Duration(milliseconds: 300),
                                                                        child:
                                                                            RateWidget(
                                                                          jobStatus:
                                                                              listViewMaintenanceRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme
                                                                        .tertiaryColor,
                                                                    elevation:
                                                                        1,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              8,
                                                                              8,
                                                                              8),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                4,
                                                                            height:
                                                                                80,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.primaryColor,
                                                                              borderRadius: BorderRadius.circular(4),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime),
                                                                                    style: FlutterFlowTheme.bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.campusGrey,
                                                                                      fontSize: 12,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                    child: Text(
                                                                                      listViewMaintenanceRecord.issue,
                                                                                      style: FlutterFlowTheme.bodyText1.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: Colors.black,
                                                                                        fontSize: 18,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if ((listViewMaintenanceRecord.notes) != '')
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                          child: AutoSizeText(
                                                                                            listViewMaintenanceRecord.notes.maybeHandleOverflow(
                                                                                              maxChars: 25,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.bodyText1.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              color: Color(0xFF595959),
                                                                                              fontSize: 16,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Text(
                                                                                    listViewMaintenanceRecord.room,
                                                                                    style: FlutterFlowTheme.bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.primaryColor,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              ToggleIcon(
                                                                                onPressed: () async {
                                                                                  final maintenanceUpdateData = createMaintenanceRecordData(
                                                                                    isDone: !listViewMaintenanceRecord.isDone,
                                                                                  );
                                                                                  await listViewMaintenanceRecord.reference.update(maintenanceUpdateData);
                                                                                },
                                                                                value: listViewMaintenanceRecord.isDone,
                                                                                onIcon: Icon(
                                                                                  Icons.check_box,
                                                                                  color: Colors.black,
                                                                                  size: 25,
                                                                                ),
                                                                                offIcon: Icon(
                                                                                  Icons.check_box_outline_blank,
                                                                                  color: Colors.black,
                                                                                  size: 25,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
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
                                                                  0, 8, 0, 0),
                                                      child: StreamBuilder<
                                                          List<
                                                              MaintenanceRecord>>(
                                                        stream:
                                                            queryMaintenanceRecord(
                                                          queryBuilder: (maintenanceRecord) =>
                                                              maintenanceRecord
                                                                  .where(
                                                                      'building',
                                                                      isEqualTo:
                                                                          currentUserDocument
                                                                              ?.building)
                                                                  .where(
                                                                      'isDone',
                                                                      isEqualTo:
                                                                          true)
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
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .bottomToTop,
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                        reverseDuration:
                                                                            Duration(milliseconds: 300),
                                                                        child:
                                                                            RateWidget(
                                                                          jobStatus:
                                                                              listViewMaintenanceRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme
                                                                        .tertiaryColor,
                                                                    elevation:
                                                                        2,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              8,
                                                                              8,
                                                                              8),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                4,
                                                                            height:
                                                                                80,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFF0AB200),
                                                                              borderRadius: BorderRadius.circular(4),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime),
                                                                                    style: FlutterFlowTheme.bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.campusGrey,
                                                                                      fontSize: 12,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                    child: Text(
                                                                                      listViewMaintenanceRecord.issue,
                                                                                      style: FlutterFlowTheme.bodyText1.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: Colors.black,
                                                                                        fontSize: 18,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    listViewMaintenanceRecord.room,
                                                                                    style: FlutterFlowTheme.bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.primaryColor,
                                                                                      fontWeight: FontWeight.w500,
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
