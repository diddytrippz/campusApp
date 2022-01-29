import '../backend/backend.dart';
import '../components/no_search_results_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TrashWidget extends StatefulWidget {
  const TrashWidget({Key key}) : super(key: key);

  @override
  _TrashWidgetState createState() => _TrashWidgetState();
}

class _TrashWidgetState extends State<TrashWidget> {
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: TextFormField(
          onChanged: (_) => EasyDebounce.debounce(
            'textController',
            Duration(milliseconds: 2000),
            () => setState(() {}),
          ),
          controller: textController,
          obscureText: false,
          decoration: InputDecoration(
            hintText: 'Search trash',
            hintStyle: FlutterFlowTheme.bodyText1,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
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
        actions: [],
        centerTitle: true,
        elevation: 1,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<MaintenanceRecord>>(
                  stream: queryMaintenanceRecord(
                    queryBuilder: (maintenanceRecord) => maintenanceRecord
                        .where('status', isEqualTo: 'Deleted')
                        .orderBy('created_time', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: SpinKitPulse(
                            color: FlutterFlowTheme.primaryColor,
                            size: 60,
                          ),
                        ),
                      );
                    }
                    List<MaintenanceRecord> columnMaintenanceRecordList =
                        snapshot.data;
                    if (columnMaintenanceRecordList.isEmpty) {
                      return NoSearchResultsWidget();
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                          columnMaintenanceRecordList.length, (columnIndex) {
                        final columnMaintenanceRecord =
                            columnMaintenanceRecordList[columnIndex];
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.tertiaryColor,
                          elevation: 0,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.account_circle_sharp,
                                  color: FlutterFlowTheme.campusGrey,
                                  size: 45,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              columnMaintenanceRecord.category,
                                              style: FlutterFlowTheme.title1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                  'relative',
                                                  columnMaintenanceRecord
                                                      .createdTime),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          columnMaintenanceRecord.issue,
                                          style: FlutterFlowTheme.subtitle1
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
