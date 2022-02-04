import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/review_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../trash/trash_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

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
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 40, 15, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.tertiaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.tertiaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              widget.jobStatus
                                                                  .photoUrl,
                                                              'https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: valueOrDefault<
                                                              String>(
                                                            widget.jobStatus
                                                                .photoUrl,
                                                            'https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
                                                          ),
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: valueOrDefault<String>(
                                                      widget.jobStatus.photoUrl,
                                                      'https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
                                                    ),
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            valueOrDefault<
                                                                String>(
                                                          widget.jobStatus
                                                              .photoUrl,
                                                          'https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
                                                        ),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            1,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 25, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Icon(
                                                          Icons.cancel,
                                                          color:
                                                              Color(0xE4FFFFFF),
                                                          size: 50,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 250, 0, 0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 30,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: DefaultTabController(
                                                  length: 2,
                                                  initialIndex: 0,
                                                  child: Column(
                                                    children: [
                                                      TabBar(
                                                        labelColor:
                                                            FlutterFlowTheme
                                                                .primaryColor,
                                                        labelStyle:
                                                            FlutterFlowTheme
                                                                .bodyText1,
                                                        indicatorColor:
                                                            FlutterFlowTheme
                                                                .secondaryColor,
                                                        tabs: [
                                                          Tab(
                                                            text: 'Details',
                                                          ),
                                                          Tab(
                                                            text: 'Comments',
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: TabBarView(
                                                          children: [
                                                            SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x00FFFFFF),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if ((widget.jobStatus.status) ==
                                                                            'Submitted')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                18,
                                                                                8,
                                                                                18,
                                                                                0),
                                                                            child:
                                                                                Row(
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
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('Are you sure you want to delete this record?'),
                                                                                          content: Text('This action cannot be undone'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Cancel'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () async {
                                                                                                Navigator.pop(alertDialogContext);

                                                                                                final maintenanceUpdateData = createMaintenanceRecordData(
                                                                                                  status: 'Deleted',
                                                                                                );
                                                                                                await widget.jobStatus.reference.update(maintenanceUpdateData);
                                                                                                ;
                                                                                              },
                                                                                              child: Text('Confirm'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          '1 item moved to bin',
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 4000),
                                                                                        backgroundColor: FlutterFlowTheme.campusGrey,
                                                                                        action: SnackBarAction(
                                                                                          label: 'TRASH',
                                                                                          textColor: Color(0xFF3779FF),
                                                                                          onPressed: () async {
                                                                                            await Navigator.push(
                                                                                              context,
                                                                                              PageTransition(
                                                                                                type: PageTransitionType.bottomToTop,
                                                                                                duration: Duration(milliseconds: 300),
                                                                                                reverseDuration: Duration(milliseconds: 300),
                                                                                                child: TrashWidget(),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
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
                                                                        if ((widget.jobStatus.status) ==
                                                                            'Completed')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                18,
                                                                                8,
                                                                                18,
                                                                                0),
                                                                            child:
                                                                                Row(
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              0,
                                                                              20,
                                                                              0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            widget.jobStatus.issue,
                                                                            style:
                                                                                FlutterFlowTheme.title1.override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 18,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if ((widget.jobStatus.notes) !=
                                                                            '')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20,
                                                                                2,
                                                                                16,
                                                                                2),
                                                                            child:
                                                                                AutoSizeText(
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
                                                                  Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme
                                                                          .tertiaryColor,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (widget.jobStatus.isDone ??
                                                                            true)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                18,
                                                                                10,
                                                                                18,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Container(
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                          child: AutoSizeText(
                                                                                            widget.jobStatus.category,
                                                                                            style: FlutterFlowTheme.bodyText1.override(
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                                                  child: InkWell(
                                                                                    onTap: () async {
                                                                                      if ((widget.jobStatus.isDone) == true) {
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          barrierColor: Color(0x5DFFFFFF),
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
                                                                                      width: 100,
                                                                                      height: 70,
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                              child: AutoSizeText(
                                                                                                'Rate Job',
                                                                                                style: FlutterFlowTheme.bodyText1.override(
                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        if (!(widget.jobStatus.isDone) ??
                                                                            true)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                18,
                                                                                10,
                                                                                18,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Container(
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                          child: AutoSizeText(
                                                                                            widget.jobStatus.category,
                                                                                            style: FlutterFlowTheme.bodyText1.override(
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                                                  child: InkWell(
                                                                                    onTap: () async {
                                                                                      if ((widget.jobStatus.isDone) == true) {
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          barrierColor: Color(0x5DFFFFFF),
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
                                                                                      width: 100,
                                                                                      height: 70,
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                              child: AutoSizeText(
                                                                                                'Rate Job',
                                                                                                style: FlutterFlowTheme.bodyText1.override(
                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              15,
                                                                              10,
                                                                              16,
                                                                              0),
                                                                          child:
                                                                              StreamBuilder<List<UsersRecord>>(
                                                                            stream:
                                                                                queryUsersRecord(
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<UsersRecord> nameRatingUsersRecordList = snapshot.data;
                                                                              // Return an empty Container when the document does not exist.
                                                                              if (snapshot.data.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final nameRatingUsersRecord = nameRatingUsersRecordList.isNotEmpty ? nameRatingUsersRecordList.first : null;
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
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
                                                                                            size: 30,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                        child: Text(
                                                                                          widget.jobStatus.displayName,
                                                                                          style: FlutterFlowTheme.subtitle1.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontSize: 18,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      AutoSizeText(
                                                                                        'Rating',
                                                                                        style: FlutterFlowTheme.bodyText2,
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                widget.jobStatus.rating.toString(),
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
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16,
                                                                              0,
                                                                              16,
                                                                              0),
                                                                          child:
                                                                              ListTile(
                                                                            leading:
                                                                                Icon(
                                                                              Icons.add_location_alt,
                                                                              size: 30,
                                                                            ),
                                                                            title:
                                                                                Text(
                                                                              widget.jobStatus.building,
                                                                              style: FlutterFlowTheme.subtitle1.override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 18,
                                                                              ),
                                                                            ),
                                                                            subtitle:
                                                                                Text(
                                                                              'Room: ${widget.jobStatus.room}',
                                                                              style: FlutterFlowTheme.subtitle2.override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 18,
                                                                              ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.tertiaryColor,
                                                                            dense:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16,
                                                                              2,
                                                                              16,
                                                                              0),
                                                                          child:
                                                                              ListTile(
                                                                            leading:
                                                                                Icon(
                                                                              Icons.calendar_today,
                                                                              size: 25,
                                                                            ),
                                                                            title:
                                                                                Text(
                                                                              '${dateTimeFormat('MMMMEEEEd', widget.jobStatus.createdTime)} at ${dateTimeFormat('jm', widget.jobStatus.createdTime)}',
                                                                              style: FlutterFlowTheme.title3.override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                            subtitle:
                                                                                Text(
                                                                              dateTimeFormat('relative', widget.jobStatus.createdTime),
                                                                              style: FlutterFlowTheme.subtitle2.override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.tertiaryColor,
                                                                            dense:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16,
                                                                              2,
                                                                              16,
                                                                              0),
                                                                          child:
                                                                              ListTile(
                                                                            leading:
                                                                                Icon(
                                                                              Icons.location_history_rounded,
                                                                              size: 25,
                                                                            ),
                                                                            title:
                                                                                Text(
                                                                              'Assigned to',
                                                                              style: FlutterFlowTheme.subtitle1.override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 18,
                                                                              ),
                                                                            ),
                                                                            subtitle:
                                                                                Text(
                                                                              'Maintenance Team',
                                                                              style: FlutterFlowTheme.subtitle2.override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 16,
                                                                              ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.tertiaryColor,
                                                                            dense:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            80,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              width: 150,
                                                                              height: 150,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x00EEEEEE),
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.scaleDown,
                                                                                  image: Image.asset(
                                                                                    'assets/images/undraw_no_data_re_kwbl.png',
                                                                                  ).image,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12,
                                                                            60,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              'No results were found from your seaech.\nPlease try again.',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.bodyText1.override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF9E9E9E),
                                                                              ),
                                                                            ),
                                                                          ],
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
                                                    ],
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
                            ),
                          ],
                        ),
                      ),
                    ),
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
