import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_inbox_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class InboxPageWidget extends StatefulWidget {
  const InboxPageWidget({Key key}) : super(key: key);

  @override
  _InboxPageWidgetState createState() => _InboxPageWidgetState();
}

class _InboxPageWidgetState extends State<InboxPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFFEFE),
      body: Column(
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Notifications',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: FlutterFlowTheme.campusGrey,
                              size: 20,
                            ),
                          ],
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
                            width: 40,
                            height: 40,
                            child: SpinKitPulse(
                              color: FlutterFlowTheme.primaryColor,
                              size: 40,
                            ),
                          ),
                        );
                      }
                      List<ChatMessagesRecord> columnChatMessagesRecordList =
                          snapshot.data;
                      if (columnChatMessagesRecordList.isEmpty) {
                        return EmptyInboxWidget();
                      }
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(columnChatMessagesRecordList.length,
                                  (columnIndex) {
                            final columnChatMessagesRecord =
                                columnChatMessagesRecordList[columnIndex];
                            return Slidable(
                              actionPane: const SlidableScrollActionPane(),
                              secondaryActions: [
                                IconSlideAction(
                                  caption: 'Mark as read',
                                  color: Color(0xFF235DD3),
                                  icon: Icons.check_circle,
                                  onTap: () {
                                    print('SlidableActionWidget pressed ...');
                                  },
                                ),
                              ],
                              child: ListTile(
                                leading: Icon(
                                  Icons.location_history,
                                  size: 35,
                                ),
                                title: Text(
                                  columnChatMessagesRecord.subject,
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  columnChatMessagesRecord.message,
                                  style: FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                ),
                                trailing: FaIcon(
                                  FontAwesomeIcons.solidCircle,
                                  color: Color(0xFF235DD3),
                                  size: 7,
                                ),
                                tileColor: Colors.white,
                                dense: false,
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
    );
  }
}
