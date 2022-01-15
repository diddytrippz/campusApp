import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 18, 0),
            child: Icon(
              Icons.check_sharp,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
        centerTitle: false,
        elevation: 1,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
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
            List<ChatMessagesRecord> columnChatMessagesRecordList =
                snapshot.data;
            // Return an empty Container when the document does not exist.
            if (snapshot.data.isEmpty) {
              return Container();
            }
            final columnChatMessagesRecord =
                columnChatMessagesRecordList.isNotEmpty
                    ? columnChatMessagesRecordList.first
                    : null;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (columnChatMessagesRecord.isSelected ?? true)
                          InkWell(
                            onTap: () async {
                              await columnChatMessagesRecord.reference.delete();
                            },
                            child: Icon(
                              Icons.menu,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        if (!(columnChatMessagesRecord.isSelected) ?? true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              'selected',
                              style: FlutterFlowTheme.bodyText1,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                StreamBuilder<List<ChatMessagesRecord>>(
                  stream: queryChatMessagesRecord(),
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
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                          columnChatMessagesRecordList.length, (columnIndex) {
                        final columnChatMessagesRecord =
                            columnChatMessagesRecordList[columnIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ToggleIcon(
                              onPressed: () async {
                                final chatMessagesUpdateData =
                                    createChatMessagesRecordData(
                                  isSelected:
                                      !columnChatMessagesRecord.isSelected,
                                );
                                await columnChatMessagesRecord.reference
                                    .update(chatMessagesUpdateData);
                              },
                              value: columnChatMessagesRecord.isSelected,
                              onIcon: Icon(
                                Icons.check_box,
                                color: Colors.black,
                                size: 25,
                              ),
                              offIcon: Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Text(
                                columnChatMessagesRecord.subject,
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                          ],
                        );
                      }),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
