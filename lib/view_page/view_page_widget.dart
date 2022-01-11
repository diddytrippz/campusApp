import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_completd_widget.dart';
import '../components/empty_list_submitted_widget.dart';
import '../components/job_state_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:easy_debounce/easy_debounce.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: NavBarPage(initialPage: 'homePage'),
            ),
          );
        },
        backgroundColor: Color(0xFFD93A0E),
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Color(0xFFE9E9E9),
          size: 24,
        ),
      ),
      body: Align(
        alignment: AlignmentDirectional(0, 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                    padding: EdgeInsetsDirectional.fromSTEB(18, 12, 18, 12),
                    child: TextFormField(
                      onChanged: (_) => EasyDebounce.debounce(
                        'textController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      onFieldSubmitted: (_) async {
                        setState(() => algoliaSearchResults = null);
                        await MaintenanceRecord.search(
                          term: textController.text,
                        )
                            .then((r) => algoliaSearchResults = r)
                            .onError((_, __) => algoliaSearchResults = [])
                            .whenComplete(() => setState(() {}));
                      },
                      controller: textController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: FlutterFlowTheme.bodyText1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          color: Color(0xFF5A5A5A),
                          size: 18,
                        ),
                        suffixIcon: textController.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => textController.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                                  labelColor: FlutterFlowTheme.primaryColor,
                                  unselectedLabelColor: Color(0xFF6E6E6E),
                                  labelStyle: FlutterFlowTheme.bodyText1,
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 12, 16, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Search results',
                                                  style: FlutterFlowTheme
                                                      .bodyText2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: StreamBuilder<
                                                  List<MaintenanceRecord>>(
                                                stream: queryMaintenanceRecord(
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
                                                              descending: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 60,
                                                        height: 60,
                                                        child: SpinKitPulse(
                                                          color:
                                                              FlutterFlowTheme
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
                                                          EmptyListSubmittedWidget(),
                                                    );
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
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
                                                            barrierColor: Color(
                                                                0x47ACACAC),
                                                            context: context,
                                                            builder: (context) {
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
                                                              caption: 'Delete',
                                                              color:
                                                                  FlutterFlowTheme
                                                                      .campusRed,
                                                              icon: Icons
                                                                  .delete_outline,
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Are you sure you want to delete this record?'),
                                                                      content: Text(
                                                                          'This action cannot be undone'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Cancel'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed:
                                                                              () async {
                                                                            Navigator.pop(alertDialogContext);
                                                                            await listViewMaintenanceRecord.reference.delete();
                                                                            ;
                                                                          },
                                                                          child:
                                                                              Text('Confirm'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
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
                                                                    child: NavBarPage(
                                                                        initialPage:
                                                                            'viewPage'),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons
                                                                  .miscellaneous_services,
                                                              color:
                                                                  FlutterFlowTheme
                                                                      .campusGrey,
                                                              size: 30,
                                                            ),
                                                            title: Text(
                                                              listViewMaintenanceRecord
                                                                  .issue,
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .title2
                                                                      .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            subtitle: Text(
                                                              '${dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime)} ${dateTimeFormat('jm', listViewMaintenanceRecord.createdTime)}',
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .subtitle2
                                                                      .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            trailing: Icon(
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
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 12, 16, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Search results',
                                                  style: FlutterFlowTheme
                                                      .bodyText2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: StreamBuilder<
                                                  List<MaintenanceRecord>>(
                                                stream: queryMaintenanceRecord(
                                                  queryBuilder: (maintenanceRecord) =>
                                                      maintenanceRecord
                                                          .where('status',
                                                              isEqualTo:
                                                                  'Completed')
                                                          .where('email',
                                                              isEqualTo:
                                                                  currentUserEmail)
                                                          .orderBy(
                                                              'created_time',
                                                              descending: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 60,
                                                        height: 60,
                                                        child: SpinKitPulse(
                                                          color:
                                                              FlutterFlowTheme
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
                                                          EmptyListCompletdWidget(),
                                                    );
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
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
                                                            barrierColor: Color(
                                                                0x47ACACAC),
                                                            context: context,
                                                            builder: (context) {
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
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons
                                                                .miscellaneous_services,
                                                            color:
                                                                FlutterFlowTheme
                                                                    .campusGrey,
                                                            size: 30,
                                                          ),
                                                          title: Text(
                                                            listViewMaintenanceRecord
                                                                .issue,
                                                            style:
                                                                FlutterFlowTheme
                                                                    .title1
                                                                    .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          subtitle: Text(
                                                            '${dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime)} ${dateTimeFormat('jm', listViewMaintenanceRecord.createdTime)}',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .subtitle2
                                                                    .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          trailing: Icon(
                                                            Icons
                                                                .keyboard_arrow_right_sharp,
                                                            color: Color(
                                                                0xFF303030),
                                                            size: 20,
                                                          ),
                                                          tileColor:
                                                              Color(0x00F5F5F5),
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
                                  labelColor: FlutterFlowTheme.primaryColor,
                                  unselectedLabelColor: Color(0xFF6E6E6E),
                                  labelStyle: FlutterFlowTheme.bodyText1,
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 12, 16, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Search results',
                                                  style: FlutterFlowTheme
                                                      .bodyText2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: StreamBuilder<
                                                  List<MaintenanceRecord>>(
                                                stream: queryMaintenanceRecord(
                                                  queryBuilder: (maintenanceRecord) =>
                                                      maintenanceRecord
                                                          .where('status',
                                                              isEqualTo:
                                                                  'Submitted')
                                                          .where('building',
                                                              isEqualTo:
                                                                  currentUserDocument
                                                                      ?.building)
                                                          .orderBy(
                                                              'created_time',
                                                              descending: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 60,
                                                        height: 60,
                                                        child: SpinKitPulse(
                                                          color:
                                                              FlutterFlowTheme
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
                                                          EmptyListSubmittedWidget(),
                                                    );
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
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
                                                      return CheckboxListTile(
                                                        value: checkboxListTileValueMap[
                                                                listViewMaintenanceRecord] ??=
                                                            false,
                                                        onChanged: (newValue) =>
                                                            setState(() =>
                                                                checkboxListTileValueMap[
                                                                        listViewMaintenanceRecord] =
                                                                    newValue),
                                                        title: Text(
                                                          listViewMaintenanceRecord
                                                              .issue,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .title3
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          listViewMaintenanceRecord
                                                              .room,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle2
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        tileColor:
                                                            Color(0xFFF5F5F5),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 12, 16, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Search results',
                                                  style: FlutterFlowTheme
                                                      .bodyText2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: StreamBuilder<
                                                  List<MaintenanceRecord>>(
                                                stream: queryMaintenanceRecord(
                                                  queryBuilder: (maintenanceRecord) =>
                                                      maintenanceRecord
                                                          .where('status',
                                                              isEqualTo:
                                                                  'Completed')
                                                          .where('building',
                                                              isEqualTo:
                                                                  currentUserDocument
                                                                      ?.building)
                                                          .orderBy(
                                                              'created_time',
                                                              descending: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 60,
                                                        height: 60,
                                                        child: SpinKitPulse(
                                                          color:
                                                              FlutterFlowTheme
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
                                                          EmptyListSubmittedWidget(),
                                                    );
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
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
                                                      return ListTile(
                                                        title: Text(
                                                          listViewMaintenanceRecord
                                                              .issue,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .title3
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          listViewMaintenanceRecord
                                                              .room,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle2
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        trailing: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color:
                                                              Color(0xFF303030),
                                                          size: 14,
                                                        ),
                                                        tileColor:
                                                            Color(0xFFF5F5F5),
                                                        dense: false,
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
          ],
        ),
      ),
    );
  }
}
