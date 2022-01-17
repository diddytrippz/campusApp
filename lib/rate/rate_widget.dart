import '../backend/backend.dart';
import '../components/review_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RateWidget extends StatefulWidget {
  const RateWidget({
    Key key,
    this.jobStatus,
  }) : super(key: key);

  final MaintenanceRecord jobStatus;

  @override
  _RateWidgetState createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
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
            Icons.clear,
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
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Color(0x2F1D2429),
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/277/600',
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if ((widget.jobStatus.status) == 'Submitted')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 22, 18, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Reported ${dateTimeFormat('relative', widget.jobStatus.createdTime)}',
                      style: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if ((widget.jobStatus.status) == 'Submitted') {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Delete Record?'),
                              content: Text(
                                  'Are you sure that you want to delete this record? This process cannot be undone.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(alertDialogContext);
                                    await widget.jobStatus.reference.delete();
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
                          reverseDuration: Duration(milliseconds: 300),
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 22, 18, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Completed ${dateTimeFormat('relative', widget.jobStatus.createdTime)}',
                      style: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 6, 0, 0),
            child: Text(
              widget.jobStatus.issue,
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if ((widget.jobStatus.status) == 'Completed')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 12, 0, 0),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF19AC00),
                      borderRadius: BorderRadius.circular(18),
                      shape: BoxShape.rectangle,
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      widget.jobStatus.status,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFFDFDFD),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              if ((widget.jobStatus.status) == 'Completed')
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
                      widget.jobStatus.category,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFFDFDFD),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if ((widget.jobStatus.status) == 'Submitted')
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
                      widget.jobStatus.status,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFFDFDFD),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              if ((widget.jobStatus.status) == 'Submitted')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 12, 0, 0),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF19AC00),
                      borderRadius: BorderRadius.circular(18),
                      shape: BoxShape.rectangle,
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      widget.jobStatus.category,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFFDFDFD),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(35, 18, 35, 0),
            child: InkWell(
              onTap: () async {
                if ((widget.jobStatus.status) == 'Completed') {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Color(0x59464749),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: ReviewWidget(
                          forReviews: widget.jobStatus,
                        ),
                      );
                    },
                  );
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.campusRed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.rate_review_outlined,
                      color: Color(0xFFF5F5F5),
                      size: 24,
                    ),
                    if ((widget.jobStatus.status) == 'Completed')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Text(
                          'Write a review',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.tertiaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    if ((widget.jobStatus.status) == 'Submitted')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Text(
                          'Not ready to be rated',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xCBEFF6FF),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(28, 18, 20, 6),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          color: FlutterFlowTheme.primaryColor,
                          size: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        widget.jobStatus.displayName,
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Overall',
                      style: FlutterFlowTheme.bodyText2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                          child: Text(
                            valueOrDefault<String>(
                              formatNumber(
                                widget.jobStatus.rating,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.title3,
                          ),
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: ListTile(
              leading: Icon(
                Icons.calendar_today,
              ),
              title: Text(
                '${dateTimeFormat('MMMMEEEEd', widget.jobStatus.createdTime)} at ${dateTimeFormat('jm', widget.jobStatus.createdTime)}',
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                dateTimeFormat('relative', widget.jobStatus.createdTime),
                style: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              tileColor: FlutterFlowTheme.tertiaryColor,
              dense: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: ListTile(
              leading: Icon(
                Icons.location_on,
              ),
              title: Text(
                widget.jobStatus.building,
                style: FlutterFlowTheme.subtitle1.override(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                'Room: ${widget.jobStatus.room}',
                style: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              ),
              tileColor: FlutterFlowTheme.tertiaryColor,
              dense: true,
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
              tileColor: FlutterFlowTheme.tertiaryColor,
              dense: true,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.primaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0x411D2429),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'DISMISS',
                options: FFButtonOptions(
                  width: 150,
                  height: 45,
                  color: FlutterFlowTheme.primaryColor,
                  textStyle: FlutterFlowTheme.title3.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  elevation: 0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}