import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_inbox_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class InboxPageWidget extends StatefulWidget {
  const InboxPageWidget({Key key}) : super(key: key);

  @override
  _InboxPageWidgetState createState() => _InboxPageWidgetState();
}

class _InboxPageWidgetState extends State<InboxPageWidget> {
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
        leading: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (!(FFAppState().isPressed) ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                child: Icon(
                  Icons.menu_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            if (FFAppState().isPressed ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                child: InkWell(
                  onTap: () async {
                    setState(() => FFAppState().isPressed = false);
                  },
                  child: Icon(
                    Icons.clear_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
          ],
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (!(FFAppState().isPressed) ?? true)
              Text(
                'Inbox',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (FFAppState().isPressed ?? true)
              Text(
                '1 selected',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        actions: [
          Visibility(
            visible: !(FFAppState().isPressed) ?? true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 22,
              ),
            ),
          ),
          Visibility(
            visible: FFAppState().isPressed ?? true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
              child: InkWell(
                onTap: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '1 item moved to bin',
                        style: GoogleFonts.getFont(
                          'Roboto',
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.campusGrey,
                      action: SnackBarAction(
                        label: 'Ok',
                        textColor: Color(0xFF3779FF),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: NavBarPage(initialPage: 'inboxPage'),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.delete_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
        centerTitle: false,
        elevation: 1,
      ),
      backgroundColor: Color(0xFFFFFEFE),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if ((currentUserUid) == '1')
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(18, 15, 1, 18),
                        child: StreamBuilder<List<ChatMessagesRecord>>(
                          stream: queryChatMessagesRecord(
                            singleRecord: true,
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
                            List<ChatMessagesRecord> rowChatMessagesRecordList =
                                snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final rowChatMessagesRecord =
                                rowChatMessagesRecordList.isNotEmpty
                                    ? rowChatMessagesRecordList.first
                                    : null;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!(FFAppState().isPressed) ?? true)
                                      Icon(
                                        Icons.menu,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    if (FFAppState().isPressed ?? true)
                                      Icon(
                                        Icons.clear,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    if (!(FFAppState().isPressed) ?? true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Text(
                                          'Inbox',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().isPressed ?? true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Text(
                                          '1 selected',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!(FFAppState().isPressed) ?? true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 12, 0),
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.black,
                                          size: 22,
                                        ),
                                      ),
                                    if (FFAppState().isPressed ?? true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 12, 0),
                                        child: Icon(
                                          Icons.delete_outlined,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    Icon(
                                      Icons.more_vert,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!(FFAppState().isPressed) ?? true)
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(22, 28, 22, 0),
                            child: TextFormField(
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              controller: textController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Search',
                                labelStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                                hintText: 'Search',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFD7D7D7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFD7D7D7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF9F9F9),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 19,
                                ),
                                suffixIcon: textController.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => textController.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 16,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<List<ChatMessagesRecord>>(
                      stream: queryChatMessagesRecord(
                        queryBuilder: (chatMessagesRecord) => chatMessagesRecord
                            .where('email', isEqualTo: currentUserEmail)
                            .orderBy('time_created', descending: true),
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
                        List<ChatMessagesRecord> columnChatMessagesRecordList =
                            snapshot.data;
                        if (columnChatMessagesRecordList.isEmpty) {
                          return Center(
                            child: EmptyInboxWidget(),
                          );
                        }
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnChatMessagesRecordList.length,
                                (columnIndex) {
                              final columnChatMessagesRecord =
                                  columnChatMessagesRecordList[columnIndex];
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (!(FFAppState().isPressed) ?? true)
                                        InkWell(
                                          onTap: () async {
                                            setState(() =>
                                                FFAppState().isPressed = true);
                                          },
                                          child: Icon(
                                            Icons.check_box_outline_blank,
                                            color: Color(0xFF595959),
                                            size: 24,
                                          ),
                                        ),
                                      if (FFAppState().isPressed ?? true)
                                        InkWell(
                                          onTap: () async {
                                            setState(() =>
                                                FFAppState().isPressed = false);
                                          },
                                          child: Icon(
                                            Icons.check_box,
                                            color: Color(0xFF3779FF),
                                            size: 24,
                                          ),
                                        ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  columnChatMessagesRecord
                                                      .subject,
                                                  style: FlutterFlowTheme.title3
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: Text(
                                                  columnChatMessagesRecord
                                                      .message,
                                                  style: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
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
                            }),
                          ),
                        );
                      },
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
