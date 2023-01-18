import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/side_nav_widget.dart';
import '../components/visitor_confirm_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyVisitorsWidget extends StatefulWidget {
  const MyVisitorsWidget({Key? key}) : super(key: key);

  @override
  _MyVisitorsWidgetState createState() => _MyVisitorsWidgetState();
}

class _MyVisitorsWidgetState extends State<MyVisitorsWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'myVisitors'});
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('MY_VISITORS_FloatingActionButton_iwgil1d');
          logFirebaseEvent('FloatingActionButton_navigate_to');

          context.pushNamed('visitorsManagement');
        },
        backgroundColor: Color(0xFFD93A0F),
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 54,
          icon: Icon(
            Icons.arrow_back_sharp,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            logFirebaseEvent('MY_VISITORS_arrow_back_sharp_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'l07pfqe0' /* Visitors */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                SideNavWidget(
                  nav1Color: FlutterFlowTheme.of(context).primaryText,
                  nav2Color: FlutterFlowTheme.of(context).primaryText,
                  nav3Color: FlutterFlowTheme.of(context).primaryText,
                  nav4Color: FlutterFlowTheme.of(context).primaryText,
                  nav5Color: FlutterFlowTheme.of(context).primaryText,
                  nav6Color: FlutterFlowTheme.of(context).primaryText,
                  nav7Color: FlutterFlowTheme.of(context).primaryText,
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'cibgwe4j' /* RECENT VISITORS */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Open Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<VisitorsRecord>>(
                        stream: queryVisitorsRecord(
                          queryBuilder: (visitorsRecord) => visitorsRecord
                              .where('tenant', isEqualTo: currentUserReference)
                              .where('arrived', isEqualTo: true)
                              .where('departed', isEqualTo: true),
                          limit: 3,
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 60,
                                ),
                              ),
                            );
                          }
                          List<VisitorsRecord> dataTableVisitorsRecordList =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: DataTable2(
                              columns: [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '7i2i58a7' /* Image */,
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
                                  fixedWidth:
                                      MediaQuery.of(context).size.width * 0.15,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'm7up3tfn' /* Visitor */,
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
                                  fixedWidth:
                                      MediaQuery.of(context).size.width * 0.45,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'qeoctn9d' /* Action */,
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
                                  fixedWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                              ],
                              rows: dataTableVisitorsRecordList
                                  .mapIndexed((dataTableIndex,
                                          dataTableVisitorsRecord) =>
                                      [
                                        Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF008FFF),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MY_VISITORS_PAGE_Column_svfryucc_ON_TAP');
                                            logFirebaseEvent(
                                                'Column_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    child: VisitorConfirmWidget(
                                                      myVisitors:
                                                          dataTableVisitorsRecord,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dataTableVisitorsRecord.name!,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                              ),
                                              Text(
                                                dataTableVisitorsRecord
                                                    .contact!,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'nrwwghrw' /* INVITE */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Color(0xFF176000),
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
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
                                FlutterFlowTheme.of(context).primaryBackground,
                              ),
                              dataRowHeight: 56,
                              border: TableBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              dividerThickness: 1,
                              showBottomBorder: false,
                              minWidth: 49,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'l8amubu5' /* UPCOMING VISITORS */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Open Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<VisitorsRecord>>(
                        stream: queryVisitorsRecord(
                          queryBuilder: (visitorsRecord) => visitorsRecord
                              .where('tenant', isEqualTo: currentUserReference)
                              .where('arrived', isEqualTo: false)
                              .where('departed', isEqualTo: false),
                          limit: 2,
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 60,
                                ),
                              ),
                            );
                          }
                          List<VisitorsRecord> dataTableVisitorsRecordList =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: DataTable2(
                              columns: [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'yipoxakw' /* Image */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                  fixedWidth:
                                      MediaQuery.of(context).size.width * 0.15,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'tlimulfa' /* Visitor */,
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
                                  fixedWidth:
                                      MediaQuery.of(context).size.width * 0.45,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'gq3kwenf' /* Action */,
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
                                  fixedWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                              ],
                              rows: dataTableVisitorsRecordList
                                  .mapIndexed((dataTableIndex,
                                          dataTableVisitorsRecord) =>
                                      [
                                        Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF008FFF),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dataTableVisitorsRecord.name!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                            Text(
                                              dataTableVisitorsRecord.contact!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'tpxz7ti3' /* CANCEL */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Color(0xFFCD350B),
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
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
                                FlutterFlowTheme.of(context).primaryBackground,
                              ),
                              dataRowHeight: 56,
                              border: TableBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              dividerThickness: 1,
                              showBottomBorder: false,
                              minWidth: 49,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '3lh76wqf' /* CHECKED-IN VISITORS */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Open Sans',
                              color: Color(0xFF176000),
                            ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<VisitorsRecord>>(
                        stream: queryVisitorsRecord(
                          queryBuilder: (visitorsRecord) => visitorsRecord
                              .where('tenant', isEqualTo: currentUserReference)
                              .where('arrived', isEqualTo: true)
                              .where('departed', isEqualTo: false),
                          limit: 2,
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 60,
                                ),
                              ),
                            );
                          }
                          List<VisitorsRecord> dataTableVisitorsRecordList =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: DataTable2(
                              columns: [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'to34x0dh' /* Image */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                  fixedWidth:
                                      MediaQuery.of(context).size.width * 0.15,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'bs0pe6vv' /* Visitor */,
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
                                  fixedWidth:
                                      MediaQuery.of(context).size.width * 0.45,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ccyol0pi' /* Action */,
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
                                  fixedWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                              ],
                              rows: dataTableVisitorsRecordList
                                  .mapIndexed((dataTableIndex,
                                          dataTableVisitorsRecord) =>
                                      [
                                        Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF008FFF),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dataTableVisitorsRecord.name!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                            Text(
                                              dataTableVisitorsRecord.contact!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Container(),
                                      ].map((c) => DataCell(c)).toList())
                                  .map((e) => DataRow(cells: e))
                                  .toList(),
                              headingRowColor: MaterialStateProperty.all(
                                FlutterFlowTheme.of(context).primaryBackground,
                              ),
                              headingRowHeight: 56,
                              dataRowColor: MaterialStateProperty.all(
                                FlutterFlowTheme.of(context).primaryBackground,
                              ),
                              dataRowHeight: 56,
                              border: TableBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              dividerThickness: 1,
                              showBottomBorder: false,
                              minWidth: 49,
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
    );
  }
}
