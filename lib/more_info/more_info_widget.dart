import '../backend/backend.dart';
import '../components/review_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreInfoWidget extends StatefulWidget {
  const MoreInfoWidget({
    Key key,
    this.jobStatus,
  }) : super(key: key);

  final MaintenanceRecord jobStatus;

  @override
  _MoreInfoWidgetState createState() => _MoreInfoWidgetState();
}

class _MoreInfoWidgetState extends State<MoreInfoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        title: Text(
          'Review',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 1,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.tertiaryColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if ((widget.jobStatus.status) == 'Submitted')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(18, 30, 18, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reported ${dateTimeFormat('relative', widget.jobStatus.createdTime)}',
                              style: FlutterFlowTheme.subtitle1.override(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if ((widget.jobStatus.isDone) == false) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Delete Record?'),
                                        content: Text(
                                            'Are you sure that you want to delete this record? This process cannot be undone.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.pop(alertDialogContext);
                                              await widget.jobStatus.reference
                                                  .delete();
                                              ;
                                            },
                                            child: Text('Confirm'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  return;
                                }
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: NavBarPage(initialPage: 'viewPage'),
                                  ),
                                  (r) => false,
                                );
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Color(0xFF939393),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if ((widget.jobStatus.status) == 'Completed')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(18, 22, 18, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Completed ${dateTimeFormat('relative', widget.jobStatus.createdTime)}',
                              style: FlutterFlowTheme.subtitle1.override(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: AutoSizeText(
                        widget.jobStatus.issue,
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    if ((widget.jobStatus.notes) != '')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 16, 2),
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            widget.jobStatus.notes,
                            'This section is currently empty. No additional notes/attachments were added in this request',
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFF595959),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.jobStatus.isDone ?? true)
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(18, 18, 18, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 130,
                                height: 50,
                                constraints: BoxConstraints(
                                  maxHeight: 32,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.campusGrey,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x32171717),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.warning,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: AutoSizeText(
                                          widget.jobStatus.category,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 130,
                                  height: 50,
                                  constraints: BoxConstraints(
                                    maxHeight: 32,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.campusRed,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x32171717),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.approval,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 8, 0),
                                          child: AutoSizeText(
                                            widget.jobStatus.status,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!(widget.jobStatus.isDone) ?? true)
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(18, 18, 18, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                height: 70,
                                constraints: BoxConstraints(
                                  maxHeight: 32,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.campusGrey,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x32171717),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: AutoSizeText(
                                          widget.jobStatus.category,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 120,
                                  height: 70,
                                  constraints: BoxConstraints(
                                    maxHeight: 32,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF19AC00),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x32171717),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 8, 0),
                                          child: AutoSizeText(
                                            widget.jobStatus.status,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 30, 16, 0),
                        child: StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
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
                            List<UsersRecord> nameRatingUsersRecordList =
                                snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final nameRatingUsersRecord =
                                nameRatingUsersRecordList.isNotEmpty
                                    ? nameRatingUsersRecordList.first
                                    : null;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.tertiaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.account_circle,
                                          color: FlutterFlowTheme.campusGrey,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        widget.jobStatus.displayName,
                                        style:
                                            FlutterFlowTheme.subtitle1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () async {
                                    if ((widget.jobStatus.isDone) == true) {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x5DFFFFFF),
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: ReviewWidget(
                                              forReviews: widget.jobStatus,
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Rating',
                                        style: FlutterFlowTheme.bodyText2,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.jobStatus.rating
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.title3,
                                            ),
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: ListTile(
                          leading: Icon(
                            Icons.add_location_alt,
                            size: 35,
                          ),
                          title: Text(
                            widget.jobStatus.building,
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            'Room: ${widget.jobStatus.room}',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                          ),
                          tileColor: FlutterFlowTheme.tertiaryColor,
                          dense: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: ListTile(
                          leading: Icon(
                            Icons.calendar_today,
                            size: 30,
                          ),
                          title: Text(
                            '${dateTimeFormat('MMMMEEEEd', widget.jobStatus.createdTime)} at ${dateTimeFormat('jm', widget.jobStatus.createdTime)}',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            dateTimeFormat(
                                'relative', widget.jobStatus.createdTime),
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          tileColor: FlutterFlowTheme.tertiaryColor,
                          dense: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 30),
                        child: ListTile(
                          leading: Icon(
                            Icons.location_history_rounded,
                            size: 30,
                          ),
                          title: Text(
                            'Assigned to',
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            'Maintenance Team',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                          tileColor: FlutterFlowTheme.tertiaryColor,
                          dense: true,
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
    );
  }
}
