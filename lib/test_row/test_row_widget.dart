import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TestRowWidget extends StatefulWidget {
  const TestRowWidget({Key? key}) : super(key: key);

  @override
  _TestRowWidgetState createState() => _TestRowWidgetState();
}

class _TestRowWidgetState extends State<TestRowWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'testRow'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MaintenanceRecord>>(
      stream: queryMaintenanceRecord(),
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
        List<MaintenanceRecord> testRowMaintenanceRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder<List<MaintenanceRecord>>(
                    stream: queryMaintenanceRecord(),
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
                      List<MaintenanceRecord> textMaintenanceRecordList =
                          snapshot.data!;
                      return Text(
                        '${functions.countRecordsSubmitted(textMaintenanceRecordList.toList()).toString()} Submitted',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      );
                    },
                  ),
                  StreamBuilder<List<MaintenanceRecord>>(
                    stream: queryMaintenanceRecord(),
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
                      List<MaintenanceRecord> textMaintenanceRecordList =
                          snapshot.data!;
                      return Text(
                        '${functions.countRecordsPending(testRowMaintenanceRecordList.toList()).toString()}Pending',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      );
                    },
                  ),
                  StreamBuilder<List<MaintenanceRecord>>(
                    stream: queryMaintenanceRecord(),
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
                      List<MaintenanceRecord> textMaintenanceRecordList =
                          snapshot.data!;
                      return Text(
                        '${functions.countRecordsCompleted(testRowMaintenanceRecordList.toList()).toString()}Completed',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      );
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  Container(
                    width: 350,
                    height: 450,
                    child: Stack(
                      children: [
                        FlutterFlowPieChart(
                          data: FFPieChartData(
                            values: [
                              functions
                                  .countRecordsSubmitted(
                                      testRowMaintenanceRecordList.toList())
                                  .toString(),
                              functions
                                  .countRecordsPending(
                                      testRowMaintenanceRecordList.toList())
                                  .toString(),
                              functions
                                  .countRecordsCompleted(
                                      testRowMaintenanceRecordList.toList())
                                  .toString()
                            ],
                            colors: [
                              Color(0xFFB91D13),
                              Color(0xFFEFB701),
                              Color(0xFF0C8450)
                            ],
                            radius: [100, 100, 100],
                          ),
                          donutHoleRadius: 50,
                          donutHoleColor: Colors.white,
                          sectionLabelType: PieChartSectionLabelType.value,
                          sectionLabelStyle: FlutterFlowTheme.of(context)
                              .title3
                              .override(
                                fontFamily: 'Open Sans',
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1, 1),
                          child: FlutterFlowChartLegendWidget(
                            entries: [
                              LegendEntry(
                                  Color(0xFFB91D13),
                                  FFLocalizations.of(context).getText(
                                    '08cnbqb5' /* Submitted */,
                                  )),
                              LegendEntry(
                                  Color(0xFFEFB701),
                                  FFLocalizations.of(context).getText(
                                    'b0dn8gn0' /* Pending */,
                                  )),
                              LegendEntry(
                                  Color(0xFF0C8450),
                                  FFLocalizations.of(context).getText(
                                    'lqpvpl2u' /* Complete */,
                                  )),
                            ],
                            width: 100,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            textPadding:
                                EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                            borderWidth: 1,
                            borderColor: Colors.black,
                            indicatorSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
