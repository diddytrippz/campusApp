import '../backend/backend.dart';
import '../components/empty_tickets_copy_widget.dart';
import '../components/side_nav_widget.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  String? dropDownValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'dashboard'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<MaintenanceRecord>>(
      stream: queryMaintenanceRecord(
        queryBuilder: (maintenanceRecord) => maintenanceRecord
            .where('RESIDENCE',
                isEqualTo: dropDownValue != '' ? dropDownValue : null)
            .orderBy('created_time', descending: true),
        limit: 20,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: SpinKitPulse(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 60,
              ),
            ),
          );
        }
        List<MaintenanceRecord> dashboardMaintenanceRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Stack(
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                SideNavWidget(
                                  nav1Color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  nav2Color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  nav3Color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  nav4Color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  nav5Color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  nav6Color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  nav7Color: Color(0xFFD93A0F),
                                ),
                              Expanded(
                                child: FutureBuilder<int>(
                                  future: queryMaintenanceRecordCount(
                                    queryBuilder: (maintenanceRecord) =>
                                        maintenanceRecord
                                            .where('status',
                                                isEqualTo: 'Pending')
                                            .where('RESIDENCE',
                                                isEqualTo: dropDownValue),
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
                                    int columnPendingCount = snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 40),
                                          child: FutureBuilder<int>(
                                            future: queryMaintenanceRecordCount(
                                              queryBuilder:
                                                  (maintenanceRecord) =>
                                                      maintenanceRecord
                                                          .where('status',
                                                              isEqualTo:
                                                                  'Completed')
                                                          .where('RESIDENCE',
                                                              isEqualTo:
                                                                  dropDownValue),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 60,
                                                    ),
                                                  ),
                                                );
                                              }
                                              int rowCompletedCount =
                                                  snapshot.data!;
                                              return Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      FutureBuilder<int>(
                                                        future:
                                                            queryMaintenanceRecordCount(
                                                          queryBuilder:
                                                              (maintenanceRecord) =>
                                                                  maintenanceRecord.where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'Submitted'),
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 60,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          int rowOpenCount =
                                                              snapshot.data!;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.4,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.4,
                                                                child:
                                                                    FlutterFlowPieChart(
                                                                  data:
                                                                      FFPieChartData(
                                                                    values: [
                                                                      columnPendingCount,
                                                                      rowCompletedCount,
                                                                      rowOpenCount
                                                                    ],
                                                                    colors: [
                                                                      Color(
                                                                          0xFFFFBA00),
                                                                      Color(
                                                                          0xFF176000),
                                                                      Color(
                                                                          0xFFCD350B)
                                                                    ],
                                                                    radius: [
                                                                      100,
                                                                      100,
                                                                      100
                                                                    ],
                                                                  ),
                                                                  donutHoleRadius:
                                                                      60,
                                                                  donutHoleColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  sectionLabelType:
                                                                      PieChartSectionLabelType
                                                                          .percent,
                                                                  sectionLabelStyle:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .title3
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                16,
                                                                          ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0, 20,
                                                                  30, 20),
                                                      child: FutureBuilder<int>(
                                                        future:
                                                            queryMaintenanceRecordCount(
                                                          queryBuilder:
                                                              (maintenanceRecord) =>
                                                                  maintenanceRecord.where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'Submitted'),
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 60,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          int columnOpenCount =
                                                              snapshot.data!;
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'tyv96zi0' /* Today */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          fontSize:
                                                                              22,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'nhzef5yo' /* 0 */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              30,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            20,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                  initialOption:
                                                                      dropDownValue ??=
                                                                          '',
                                                                  options: [
                                                                    '49 Jorissen',
                                                                    '80 Jorissen',
                                                                    'YMCA',
                                                                    'Rennie House',
                                                                    ''
                                                                  ],
                                                                  optionLabels: [
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hzoyxswg' /* 49 Jorissen */,
                                                                    ),
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '5vh13noj' /* 80 Jorissen */,
                                                                    ),
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'uwkywxdr' /* YMCA */,
                                                                    ),
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'e5n5fz5l' /* Rennie House */,
                                                                    ),
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'd4p384vz' /*  ALL */,
                                                                    )
                                                                  ],
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                          dropDownValue =
                                                                              val),
                                                                  width: 200,
                                                                  height: 50,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'lb985odu' /* Residence */,
                                                                  ),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_drop_down,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 15,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  elevation: 2,
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderWidth:
                                                                      0,
                                                                  borderRadius:
                                                                      8,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          4,
                                                                          12,
                                                                          4),
                                                                  hidesUnderline:
                                                                      true,
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
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'DASHBOARD_PAGE_Container_ktyzzp7z_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Container_custom_action');
                                                                    await actions
                                                                        .downloadCollectionAsCSV(
                                                                      dashboardMaintenanceRecordList
                                                                          .toList(),
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 200,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -0.7,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'nk4zetrl' /* Download CSV */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            60,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'cm8gs4mk' /* Open Tickets */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Color(0xFFCD350B),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      columnOpenCount
                                                                          .toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Color(0xFFCD350B),
                                                                            fontSize:
                                                                                30,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'weggynv7' /* In Review */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Color(0xFFFFBA00),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      columnPendingCount
                                                                          .toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Color(0xFFFFBA00),
                                                                            fontSize:
                                                                                30,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'kqgsu3ac' /* Closed Tickets */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Color(0xFF176000),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      rowCompletedCount
                                                                          .toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Color(0xFF176000),
                                                                            fontSize:
                                                                                30,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              final datList =
                                                  dashboardMaintenanceRecordList
                                                      .toList();
                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: DataTable2(
                                                    columns: [
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'j5gdkyr8' /* Name */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 16,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'a762gje1' /* Ticket */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 16,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'obsm1oly' /* Description */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 16,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'zm35kjqt' /* Room */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 16,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '6zino7yi' /* Created_date */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 16,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '4ws0f2ea' /* Status */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 16,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn2(
                                                        label: DefaultTextStyle
                                                            .merge(
                                                          softWrap: true,
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'tswk8th8' /* Building */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 16,
                                                                ),
                                                          ),
                                                        ),
                                                        fixedWidth: 0,
                                                      ),
                                                    ],
                                                    rows: datList
                                                        .mapIndexed((datListIndex,
                                                                datListItem) =>
                                                            [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    datListItem
                                                                        .firstName!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      datListItem
                                                                          .issue!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    datListItem
                                                                        .notes!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    datListItem
                                                                        .bedCode!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    datListItem
                                                                        .createdTime!
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    () {
                                                                      if (datListItem
                                                                              .status ==
                                                                          'Submitted') {
                                                                        return Color(
                                                                            0xFFCD350B);
                                                                      } else if (datListItem
                                                                              .status ==
                                                                          'Pending') {
                                                                        return Color(
                                                                            0xFFFFBA00);
                                                                      } else {
                                                                        return Color(
                                                                            0xFF219700);
                                                                      }
                                                                    }(),
                                                                    Color(
                                                                        0xFFCD350B),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      datListItem
                                                                          .status!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(),
                                                            ]
                                                                .map((c) =>
                                                                    DataCell(c))
                                                                .toList())
                                                        .map((e) =>
                                                            DataRow(cells: e))
                                                        .toList(),
                                                    headingRowColor:
                                                        MaterialStateProperty
                                                            .all(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                    ),
                                                    headingRowHeight: 56,
                                                    dataRowColor:
                                                        MaterialStateProperty
                                                            .all(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                    ),
                                                    dataRowHeight: 56,
                                                    border: TableBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                    ),
                                                    dividerThickness: 1,
                                                    showBottomBorder: true,
                                                    minWidth: 49,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (responsiveVisibility(
                    context: context,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    EmptyTicketsCopyWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
