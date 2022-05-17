import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
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
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'moreInfo'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 54,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            logFirebaseEvent('IconButton-ON_TAP');
            logFirebaseEvent('IconButton-Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          'Info',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 18,
              ),
        ),
        actions: [
          FutureBuilder<List<UsersRecord>>(
            future: queryUsersRecordOnce(
              queryBuilder: (usersRecord) => usersRecord.where('email',
                  isEqualTo: widget.jobStatus.email != ''
                      ? widget.jobStatus.email
                      : null),
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
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 60,
                    ),
                  ),
                );
              }
              List<UsersRecord> rowUsersRecordList = snapshot.data;
              // Return an empty Container when the document does not exist.
              if (snapshot.data.isEmpty) {
                return Container();
              }
              final rowUsersRecord = rowUsersRecordList.isNotEmpty
                  ? rowUsersRecordList.first
                  : null;
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('Icon-ON_TAP');
                        if ((widget.jobStatus.status) == 'Completed') {
                          if ((widget.jobStatus.email) == (currentUserEmail)) {
                            logFirebaseEvent('Icon-Navigate-To');
                            context.pushNamed(
                              'reviews',
                              queryParams: {
                                'jobReviews': serializeParam(
                                    widget.jobStatus, ParamType.Document),
                              },
                              extra: <String, dynamic>{
                                'jobReviews': widget.jobStatus,
                              },
                            );
                          } else {
                            return;
                          }
                        } else {
                          logFirebaseEvent('Icon-Show-Snack-Bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Item not ready to be reviewed',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          );
                        }
                      },
                      child: Icon(
                        FFIcons.kedit,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('Badge-ON_TAP');
                        logFirebaseEvent('Badge-Navigate-To');
                        context.pushNamed(
                          'ChatPage',
                          queryParams: {
                            'chatUser': serializeParam(
                                rowUsersRecord, ParamType.Document),
                          },
                          extra: <String, dynamic>{
                            'chatUser': rowUsersRecord,
                          },
                        );
                      },
                      child: Badge(
                        badgeContent: Text(
                          '0',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                        ),
                        showBadge: true,
                        shape: BadgeShape.circle,
                        badgeColor: FlutterFlowTheme.of(context).primaryColor,
                        elevation: 4,
                        padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                        position: BadgePosition.topEnd(),
                        animationType: BadgeAnimationType.scale,
                        toAnimate: true,
                        child: Icon(
                          FFIcons.kmessage3,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
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
                  Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((widget.jobStatus.photoUrl != null) &&
                              (widget.jobStatus.photoUrl != ''))
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent('Image-ON_TAP');
                                            logFirebaseEvent(
                                                'Image-Expand-Image');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: CachedNetworkImage(
                                                    imageUrl: widget
                                                        .jobStatus.photoUrl,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag:
                                                      widget.jobStatus.photoUrl,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: widget.jobStatus.photoUrl,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    widget.jobStatus.photoUrl,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 12, 0),
                                        child: DefaultTabController(
                                          length: 2,
                                          initialIndex: 0,
                                          child: Column(
                                            children: [
                                              TabBar(
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                indicatorWeight: 4,
                                                tabs: [
                                                  Tab(
                                                    text: 'Info',
                                                  ),
                                                  Tab(
                                                    text: 'Attachments',
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x00FFFFFF),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  if ((widget.jobStatus
                                                                              .notes !=
                                                                          null) &&
                                                                      (widget.jobStatus
                                                                              .notes !=
                                                                          ''))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              8,
                                                                              16,
                                                                              2),
                                                                      child:
                                                                          AutoSizeText(
                                                                        'Issue:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: Color(0xFFA2A2A2),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            20,
                                                                            0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      widget
                                                                          .jobStatus
                                                                          .issue,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  if ((widget.jobStatus
                                                                              .notes !=
                                                                          null) &&
                                                                      (widget.jobStatus
                                                                              .notes !=
                                                                          ''))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              2),
                                                                      child:
                                                                          AutoSizeText(
                                                                        'Description:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: Color(0xFFA2A2A2),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  if ((widget.jobStatus
                                                                              .notes !=
                                                                          null) &&
                                                                      (widget.jobStatus
                                                                              .notes !=
                                                                          ''))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              8,
                                                                              16,
                                                                              2),
                                                                      child:
                                                                          AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          widget
                                                                              .jobStatus
                                                                              .notes,
                                                                          'This section is currently empty. No additional notes/attachments were added in this request',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: Color(0xFF595959),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  1,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    color: Color(
                                                                        0x00FFFFFF),
                                                                    child:
                                                                        ExpandableNotifier(
                                                                      initialExpanded:
                                                                          true,
                                                                      child:
                                                                          ExpandablePanel(
                                                                        header:
                                                                            Text(
                                                                          'Tenant details',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title1
                                                                              .override(
                                                                                fontFamily: 'Open Sans',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 18,
                                                                              ),
                                                                        ),
                                                                        collapsed:
                                                                            Container(),
                                                                        expanded:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            ListTile(
                                                                              leading: Icon(
                                                                                FFIcons.kprofile,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 30,
                                                                              ),
                                                                              title: Text(
                                                                                'Tenant ID',
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: 'Open Sans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              subtitle: Text(
                                                                                widget.jobStatus.displayName,
                                                                                style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                      fontFamily: 'Open Sans',
                                                                                      fontSize: 18,
                                                                                    ),
                                                                              ),
                                                                              tileColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              dense: true,
                                                                            ),
                                                                            ListTile(
                                                                              leading: Icon(
                                                                                FFIcons.kpins,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 30,
                                                                              ),
                                                                              title: Text(
                                                                                widget.jobStatus.building,
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: 'Open Sans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              subtitle: Text(
                                                                                'Room: ${widget.jobStatus.room}',
                                                                                style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                      fontFamily: 'Open Sans',
                                                                                      fontSize: 18,
                                                                                    ),
                                                                              ),
                                                                              tileColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              dense: true,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        theme:
                                                                            ExpandableThemeData(
                                                                          tapHeaderToExpand:
                                                                              true,
                                                                          tapBodyToExpand:
                                                                              true,
                                                                          tapBodyToCollapse:
                                                                              true,
                                                                          headerAlignment:
                                                                              ExpandablePanelHeaderAlignment.center,
                                                                          hasIcon:
                                                                              true,
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      color: Color(
                                                                          0x00FFFFFF),
                                                                      child:
                                                                          ExpandableNotifier(
                                                                        initialExpanded:
                                                                            false,
                                                                        child:
                                                                            ExpandablePanel(
                                                                          header:
                                                                              Text(
                                                                            'Request details',
                                                                            style: FlutterFlowTheme.of(context).title1.override(
                                                                                  fontFamily: 'Open Sans',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 18,
                                                                                ),
                                                                          ),
                                                                          collapsed:
                                                                              Container(),
                                                                          expanded:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              ListTile(
                                                                                leading: Icon(
                                                                                  FFIcons.kcalendar1,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 28,
                                                                                ),
                                                                                title: Text(
                                                                                  '${dateTimeFormat('MMMMEEEEd', widget.jobStatus.createdTime)} at ${dateTimeFormat('jm', widget.jobStatus.createdTime)}',
                                                                                  style: FlutterFlowTheme.of(context).title3.override(
                                                                                        fontFamily: 'Open Sans',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 16,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                subtitle: Text(
                                                                                  dateTimeFormat('EEEE', widget.jobStatus.createdTime),
                                                                                  style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: 'Open Sans',
                                                                                        fontSize: 16,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                                tileColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                dense: true,
                                                                              ),
                                                                              if ((widget.jobStatus.isDone) == false)
                                                                                ListTile(
                                                                                  leading: Icon(
                                                                                    FFIcons.kdownload1,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 30,
                                                                                  ),
                                                                                  title: Text(
                                                                                    'Status',
                                                                                    style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                          fontFamily: 'Open Sans',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  subtitle: Text(
                                                                                    widget.jobStatus.status,
                                                                                    style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'Open Sans',
                                                                                          fontSize: 16,
                                                                                        ),
                                                                                  ),
                                                                                  tileColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  dense: true,
                                                                                ),
                                                                              if ((widget.jobStatus.isDone) == false)
                                                                                ListTile(
                                                                                  leading: Icon(
                                                                                    FFIcons.kapps,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 30,
                                                                                  ),
                                                                                  title: Text(
                                                                                    'Category',
                                                                                    style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                          fontFamily: 'Open Sans',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  subtitle: Text(
                                                                                    widget.jobStatus.category,
                                                                                    style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'Open Sans',
                                                                                          fontSize: 16,
                                                                                        ),
                                                                                  ),
                                                                                  tileColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  dense: true,
                                                                                ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
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
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
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
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                              child: Icon(
                                                                                                FFIcons.kedit,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 30,
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              'Job Rating',
                                                                                              style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                                    fontFamily: 'Open Sans',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 16,
                                                                                                    fontWeight: FontWeight.w600,
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
                                                                                              style: FlutterFlowTheme.of(context).bodyText2,
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
                                                                                                    style: FlutterFlowTheme.of(context).title3.override(
                                                                                                          fontFamily: 'Open Sans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 18,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Icon(
                                                                                                  Icons.star_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
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
                                                                              if ((widget.jobStatus.isDone) == false)
                                                                                ListTile(
                                                                                  leading: Icon(
                                                                                    FFIcons.kworker,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 30,
                                                                                  ),
                                                                                  title: Text(
                                                                                    'Team Member ID',
                                                                                    style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                          fontFamily: 'Open Sans',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  subtitle: Text(
                                                                                    widget.jobStatus.assigned,
                                                                                    style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'Open Sans',
                                                                                          fontSize: 16,
                                                                                        ),
                                                                                  ),
                                                                                  tileColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  dense: true,
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          theme:
                                                                              ExpandableThemeData(
                                                                            tapHeaderToExpand:
                                                                                true,
                                                                            tapBodyToExpand:
                                                                                true,
                                                                            tapBodyToCollapse:
                                                                                true,
                                                                            headerAlignment:
                                                                                ExpandablePanelHeaderAlignment.center,
                                                                            hasIcon:
                                                                                true,
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            80,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          150,
                                                                      height:
                                                                          150,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00EEEEEE),
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .scaleDown,
                                                                          image:
                                                                              Image.asset(
                                                                            'assets/images/undraw_no_data_re_kwbl.png',
                                                                          ).image,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            60,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'No attachments were found.\nPlease try again.',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Color(0xFF9E9E9E),
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
        ],
      ),
    );
  }
}
