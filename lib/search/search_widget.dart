import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/side_nav_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'search'});
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 24,
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 25,
          ),
          onPressed: () async {
            logFirebaseEvent('SEARCH_arrow_back_ios_outlined_ICN_ON_TA');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                '1ehqp1x6' /* Contacts */,
              ),
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Open Sans',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
            ))
              SideNavWidget(
                nav1Color: FlutterFlowTheme.of(context).primaryText,
                nav2Color: FlutterFlowTheme.of(context).primaryText,
                nav3Color: FlutterFlowTheme.of(context).primaryText,
                nav4Color: Color(0xFFC8360E),
                nav5Color: FlutterFlowTheme.of(context).primaryText,
                nav6Color: FlutterFlowTheme.of(context).primaryText,
                nav7Color: FlutterFlowTheme.of(context).primaryText,
              ),
            Expanded(
              child: AuthUserStreamWidget(
                builder: (context) => StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord.where('building',
                        isEqualTo:
                            valueOrDefault(currentUserDocument?.building, '')),
                    limit: 30,
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
                    List<UsersRecord> dataTableUsersRecordList = snapshot.data!;
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: DataTable2(
                        columns: [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '593y5qak' /* Icon */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 10,
                                    ),
                              ),
                            ),
                            fixedWidth:
                                MediaQuery.of(context).size.width * 0.16,
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'iubu6zvf' /* Name */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 10,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'jhhj8vn4' /* Building */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 10,
                                    ),
                              ),
                            ),
                          ),
                        ],
                        rows: dataTableUsersRecordList
                            .mapIndexed((dataTableIndex,
                                    dataTableUsersRecord) =>
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          dataTableUsersRecord.displayName!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          dataTableUsersRecord.building!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12,
                                              ),
                                        ),
                                      ),
                                    ],
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
            ),
          ],
        ),
      ),
    );
  }
}
