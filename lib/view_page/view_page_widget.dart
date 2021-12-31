import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_closed_widget.dart';
import '../components/empty_list_completd_widget.dart';
import '../components/empty_list_submitted_widget.dart';
import '../components/state_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPageWidget extends StatefulWidget {
  const ViewPageWidget({Key key}) : super(key: key);

  @override
  _ViewPageWidgetState createState() => _ViewPageWidgetState();
}

class _ViewPageWidgetState extends State<ViewPageWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 12,
                          borderWidth: 1,
                          buttonSize: 45,
                          fillColor: Color(0xFFF6F6F6),
                          icon: FaIcon(
                            FontAwesomeIcons.longArrowAltLeft,
                            color: FlutterFlowTheme.campusRed,
                            size: 28,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Text(
                        'MyRequests',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.mellow,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 18),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: FlutterFlowTheme.bodyText1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: FlutterFlowTheme.campusGrey,
                              size: 18,
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: FlutterFlowTheme.primaryColor,
                            unselectedLabelColor: Color(0xFF6E6E6E),
                            labelStyle: FlutterFlowTheme.bodyText1,
                            indicatorColor: FlutterFlowTheme.secondaryColor,
                            tabs: [
                              Tab(
                                text: 'Submitted',
                              ),
                              Tab(
                                text: 'Completed',
                              ),
                              Tab(
                                text: 'Closed',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 20, 16, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Search results',
                                            style: FlutterFlowTheme.bodyText2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 18, 8, 0),
                                        child: StreamBuilder<
                                            List<MaintenanceRecord>>(
                                          stream: queryMaintenanceRecord(
                                            queryBuilder: (maintenanceRecord) =>
                                                maintenanceRecord
                                                    .where('status',
                                                        isEqualTo: 'Submitted')
                                                    .where('email',
                                                        isEqualTo:
                                                            currentUserEmail),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    size: 40,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<MaintenanceRecord>
                                                listViewMaintenanceRecordList =
                                                snapshot.data;
                                            if (listViewMaintenanceRecordList
                                                .isEmpty) {
                                              return EmptyListSubmittedWidget();
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewMaintenanceRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewMaintenanceRecord =
                                                    listViewMaintenanceRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 8),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Color(0x00FFFFFF),
                                                        barrierColor:
                                                            Color(0x83FFFFFF),
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                StateWidget(),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 2,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      8, 2, 8),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            4),
                                                                        child:
                                                                            Text(
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
                                                                                FontWeight.w500,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            4),
                                                                        child:
                                                                            Text(
                                                                          '49 Joriseen Street',
                                                                          style: FlutterFlowTheme
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF6E6E6E),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            4),
                                                                        child:
                                                                            Text(
                                                                          'Created on ${dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime)}',
                                                                          style: FlutterFlowTheme
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            8),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                                                  child: Icon(
                                                                                    Icons.room,
                                                                                    color: Color(0xFF6E6E6E),
                                                                                    size: 22,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  listViewMaintenanceRecord.room,
                                                                                  style: FlutterFlowTheme.bodyText1,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                                                                  child: Icon(
                                                                                    Icons.person,
                                                                                    color: Color(0xFF9E9E9E),
                                                                                    size: 22,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  listViewMaintenanceRecord.displayName,
                                                                                  style: FlutterFlowTheme.bodyText1,
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
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right,
                                                                      color: Color(
                                                                          0xFFA4A4A4),
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 20, 16, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Search results',
                                            style: FlutterFlowTheme.bodyText2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 18, 0, 0),
                                        child: StreamBuilder<
                                            List<MaintenanceRecord>>(
                                          stream: queryMaintenanceRecord(
                                            queryBuilder: (maintenanceRecord) =>
                                                maintenanceRecord
                                                    .where('status',
                                                        isEqualTo: 'Completed')
                                                    .where('email',
                                                        isEqualTo:
                                                            currentUserEmail),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    size: 40,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<MaintenanceRecord>
                                                listViewMaintenanceRecordList =
                                                snapshot.data;
                                            if (listViewMaintenanceRecordList
                                                .isEmpty) {
                                              return EmptyListCompletdWidget();
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewMaintenanceRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewMaintenanceRecord =
                                                    listViewMaintenanceRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Color(
                                                                    0x00FFFFFF),
                                                            barrierColor: Color(
                                                                0x83FFFFFF),
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    StateWidget(),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Text(
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
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        '49 Joriseen Street',
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF6E6E6E),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        'Created on ${dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.dateCreated)}',
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              8),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                                                child: Icon(
                                                                                  Icons.room,
                                                                                  color: Color(0xFF6E6E6E),
                                                                                  size: 22,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                listViewMaintenanceRecord.room,
                                                                                style: FlutterFlowTheme.bodyText1,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                                                                child: Icon(
                                                                                  Icons.person,
                                                                                  color: Color(0xFF9E9E9E),
                                                                                  size: 22,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                listViewMaintenanceRecord.displayName,
                                                                                style: FlutterFlowTheme.bodyText1,
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right,
                                                                    color: Color(
                                                                        0xFFA4A4A4),
                                                                    size: 24,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 20, 16, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Search results',
                                            style: FlutterFlowTheme.bodyText2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 18, 0, 0),
                                        child: StreamBuilder<
                                            List<MaintenanceRecord>>(
                                          stream: queryMaintenanceRecord(
                                            queryBuilder: (maintenanceRecord) =>
                                                maintenanceRecord
                                                    .where('status',
                                                        isEqualTo: 'Closed')
                                                    .where('email',
                                                        isEqualTo:
                                                            currentUserEmail),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    size: 40,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<MaintenanceRecord>
                                                listViewMaintenanceRecordList =
                                                snapshot.data;
                                            if (listViewMaintenanceRecordList
                                                .isEmpty) {
                                              return EmptyListClosedWidget();
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewMaintenanceRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewMaintenanceRecord =
                                                    listViewMaintenanceRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Color(
                                                                    0x00FFFFFF),
                                                            barrierColor: Color(
                                                                0x83FFFFFF),
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    StateWidget(),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Text(
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
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        '49 Joriseen Street',
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF6E6E6E),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        'Created on ${dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.dateCreated)}',
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              8),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                                                child: Icon(
                                                                                  Icons.room,
                                                                                  color: Color(0xFF6E6E6E),
                                                                                  size: 22,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                listViewMaintenanceRecord.room,
                                                                                style: FlutterFlowTheme.bodyText1,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                                                                child: Icon(
                                                                                  Icons.person,
                                                                                  color: Color(0xFF9E9E9E),
                                                                                  size: 22,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                listViewMaintenanceRecord.displayName,
                                                                                style: FlutterFlowTheme.bodyText1,
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right,
                                                                    color: Color(
                                                                        0xFFA4A4A4),
                                                                    size: 24,
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
                              ],
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
        ),
      ),
    );
  }
}
