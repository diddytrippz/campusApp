import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class JobStateWidget extends StatefulWidget {
  const JobStateWidget({
    Key key,
    this.jobProgressStatus,
  }) : super(key: key);

  final MaintenanceRecord jobProgressStatus;

  @override
  _JobStateWidgetState createState() => _JobStateWidgetState();
}

class _JobStateWidgetState extends State<JobStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(18, 40, 18, 0),
          child: Material(
            color: Colors.transparent,
            elevation: 30,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if ((widget.jobProgressStatus.status) == 'Submitted')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 18, 18, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Text(
                                  'Reported ${dateTimeFormat('relative', widget.jobProgressStatus.createdTime)}',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if ((widget.jobProgressStatus.status) ==
                                      'Submitted') {
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
                                                Navigator.pop(
                                                    alertDialogContext);
                                                await widget
                                                    .jobProgressStatus.reference
                                                    .delete();
                                                ;
                                              },
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 300),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                      child:
                                          NavBarPage(initialPage: 'viewPage'),
                                    ),
                                    (r) => false,
                                  );
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Color(0xFF939393),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if ((widget.jobProgressStatus.status) == 'Completed')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 18, 18, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Text(
                                  'Completed${dateTimeFormat('relative', widget.jobProgressStatus.createdTime)}',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if ((widget.jobProgressStatus.status) ==
                                      'Submitted') {
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
                                                Navigator.pop(
                                                    alertDialogContext);
                                                await widget
                                                    .jobProgressStatus.reference
                                                    .delete();
                                                ;
                                              },
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 300),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                      child:
                                          NavBarPage(initialPage: 'viewPage'),
                                    ),
                                    (r) => false,
                                  );
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Color(0xFF939393),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 6, 0, 0),
                        child: Text(
                          widget.jobProgressStatus.issue,
                          style: FlutterFlowTheme.title1.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 0, 0),
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.campusRed,
                            borderRadius: BorderRadius.circular(18),
                            shape: BoxShape.rectangle,
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            widget.jobProgressStatus.status,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFDFDFD),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 18, 0, 0),
                        child: RatingBarIndicator(
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          direction: Axis.horizontal,
                          rating: 0,
                          unratedColor: Color(0xFF9E9E9E),
                          itemCount: 5,
                          itemSize: 28,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.thumb_up_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            Icon(
                              Icons.thumb_down_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            Icon(
                              Icons.ios_share,
                              color: Colors.black,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 18, 20, 0),
                        child: ListTile(
                          leading: Icon(
                            Icons.access_time_sharp,
                          ),
                          title: Text(
                            '${dateTimeFormat('MMMMEEEEd', widget.jobProgressStatus.createdTime)} at ${dateTimeFormat('jm', widget.jobProgressStatus.createdTime)}',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            dateTimeFormat('relative',
                                widget.jobProgressStatus.createdTime),
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: ListTile(
                          leading: Icon(
                            Icons.location_on,
                          ),
                          title: Text(
                            widget.jobProgressStatus.building,
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            'Room: ${widget.jobProgressStatus.room}',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                          ),
                          title: Text(
                            widget.jobProgressStatus.displayName,
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            widget.jobProgressStatus.email,
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                        child: ListTile(
                          leading: Icon(
                            Icons.location_history_rounded,
                          ),
                          title: Text(
                            'Assigned to',
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            'Maintenance Team',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 30),
          child: FFButtonWidget(
            onPressed: () async {
              Navigator.pop(context);
            },
            text: 'Cancel',
            options: FFButtonOptions(
              width: double.infinity,
              height: 55,
              color: Colors.white,
              textStyle: FlutterFlowTheme.subtitle2.override(
                fontFamily: 'Poppins',
                color: Color(0xFF235DD3),
                fontWeight: FontWeight.w500,
              ),
              elevation: 3,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
          ),
        ),
      ],
    );
  }
}
