import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadsheddingWidget extends StatefulWidget {
  const LoadsheddingWidget({Key? key}) : super(key: key);

  @override
  _LoadsheddingWidgetState createState() => _LoadsheddingWidgetState();
}

class _LoadsheddingWidgetState extends State<LoadsheddingWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'loadshedding'});
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: FutureBuilder<ApiCallResponse>(
            future: LoadsheddingGroup.getLoadsheddingCall.call(
              id: FFAppState().eskomPlace,
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
              final columnGetLoadsheddingResponse = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                        Container(
                          width: 120,
                          height: 35,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'dek3wfym' /* Options */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: AutoSizeText(
                      LoadsheddingGroup.getLoadsheddingCall
                          .placeName(
                            columnGetLoadsheddingResponse.jsonBody,
                          )
                          .toString(),
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
                    child: Text(
                      LoadsheddingGroup.getLoadsheddingCall
                          .region(
                            columnGetLoadsheddingResponse.jsonBody,
                          )
                          .toString(),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                    child: Text(
                      dateTimeFormat(
                        'MMMMEEEEd',
                        getCurrentTimestamp,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            fontSize: 18,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                    child: Text(
                      LoadsheddingGroup.getLoadsheddingCall
                          .currentNote(
                            columnGetLoadsheddingResponse.jsonBody,
                          )
                          .toString(),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final mySchedule = LoadsheddingGroup.getLoadsheddingCall
                            .schedule(
                              columnGetLoadsheddingResponse.jsonBody,
                            )
                            .toList();
                        return DataTable2(
                          columns: [
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'vhf9e770' /* Date */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14,
                                      ),
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'zk1r9vny' /* Stage */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14,
                                      ),
                                ),
                              ),
                            ),
                          ],
                          rows: mySchedule
                              .mapIndexed((myScheduleIndex, myScheduleItem) => [
                                    Text(
                                      getJsonField(
                                        myScheduleItem,
                                        r'''$.schedule.days''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ikxnucie' /* Edit Column 2 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                  ].map((c) => DataCell(c)).toList())
                              .map((e) => DataRow(cells: e))
                              .toList(),
                          headingRowColor: MaterialStateProperty.all(
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          headingRowHeight: 56,
                          dataRowColor: MaterialStateProperty.all(
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          dataRowHeight: 56,
                          border: TableBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          dividerThickness: 1,
                          showBottomBorder: false,
                          minWidth: 49,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
