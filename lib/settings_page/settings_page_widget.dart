import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../onboarding/onboarding_widget.dart';
import '../rules_book/rules_book_widget.dart';
import '../trash/trash_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({Key key}) : super(key: key);

  @override
  _SettingsPageWidgetState createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  bool switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFEFE),
        iconTheme: IconThemeData(color: FlutterFlowTheme.campusGrey),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'Settings',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 1,
      ),
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.tertiaryColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(1),
                          bottomRight: Radius.circular(1),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(1),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(1),
                            bottomRight: Radius.circular(1),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(1),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 80, 0, 0),
                            child: FutureBuilder<List<UsersRecord>>(
                              future: queryUsersRecordOnce(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where('email',
                                        isEqualTo: currentUserEmail),
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
                                List<UsersRecord> columnUsersRecordList =
                                    snapshot.data;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data.isEmpty) {
                                  return Container();
                                }
                                final columnUsersRecord =
                                    columnUsersRecordList.isNotEmpty
                                        ? columnUsersRecordList.first
                                        : null;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFDBE2E7),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2, 2, 2, 2),
                                              child: AuthUserStreamWidget(
                                                child: InkWell(
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
                                                              currentUserPhoto,
                                                              'https://www.clipartmax.com/png/middle/15-153139_big-image-login-icon-with-transparent-background.png',
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: valueOrDefault<
                                                              String>(
                                                            currentUserPhoto,
                                                            'https://www.clipartmax.com/png/middle/15-153139_big-image-login-icon-with-transparent-background.png',
                                                          ),
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: valueOrDefault<String>(
                                                      currentUserPhoto,
                                                      'https://www.clipartmax.com/png/middle/15-153139_big-image-login-icon-with-transparent-background.png',
                                                    ),
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            valueOrDefault<
                                                                String>(
                                                          currentUserPhoto,
                                                          'https://www.clipartmax.com/png/middle/15-153139_big-image-login-icon-with-transparent-background.png',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
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
                                          8, 30, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: AuthUserStreamWidget(
                                              child: Text(
                                                currentUserDisplayName,
                                                style: FlutterFlowTheme.title1
                                                    .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 12, 0, 14),
                                      child: Text(
                                        currentUserEmail,
                                        style:
                                            FlutterFlowTheme.subtitle1.override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: EditProfileWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.person_outline_sharp,
                      ),
                      title: Text(
                        'Profile',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0x00F5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: NavBarPage(initialPage: 'MessagesPage'),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.message_outlined,
                      ),
                      title: Text(
                        'Messages',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0x00F5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: NavBarPage(initialPage: 'viewPage'),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.forum,
                      ),
                      title: Text(
                        'Mantenance',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0x00F5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: TrashWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.delete_outline_rounded,
                      ),
                      title: Text(
                        'Trash',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0x00F5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await signOut();
                      await Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: OnboardingWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                      ),
                      title: Text(
                        'Sign Out',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0x00F5F5F5),
                      dense: false,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'VERSION 1.0.1',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                        child: Text(
                          'USERS',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFF9E9E9E),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.bottomToTop,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: EditProfileWidget(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.person_outline,
                                color: Color(0xFF9E9E9E),
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Text(
                                  'My account',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.9, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF95A1AC),
                                    size: 18,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await actions.settings();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.accessibility_new_sharp,
                                color: Color(0xFF9E9E9E),
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Text(
                                  'Accessibility',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.9, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF95A1AC),
                                    size: 18,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.nights_stay,
                            color: Color(0xFF9E9E9E),
                            size: 24,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                            child: Text(
                              'Dark Mode',
                              style: FlutterFlowTheme.bodyText1,
                            ),
                          ),
                          Expanded(
                            child: SwitchListTile(
                              value: switchListTileValue ??= false,
                              onChanged: (newValue) => setState(
                                  () => switchListTileValue = newValue),
                              tileColor: Color(0xFFF5F5F5),
                              dense: true,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                    child: Text(
                      'STUDENTS',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: Color(0xFF9E9E9E),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.content_paste_outlined,
                              color: Color(0xFF9E9E9E),
                              size: 24,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'Checklist',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.9, 0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF95A1AC),
                                  size: 18,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.bottomToTop,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: RulesBookWidget(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.download_sharp,
                                color: Color(0xFF9E9E9E),
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Text(
                                  'Student Handbook',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.9, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF95A1AC),
                                    size: 18,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.delete_outline_outlined,
                                color: Color(0xFF9E9E9E),
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Text(
                                  'Trash',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.9, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF95A1AC),
                                    size: 18,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 14, 0, 14),
                    child: Text(
                      'MORE',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        color: Color(0xFF9E9E9E),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.language_sharp,
                              color: Color(0xFF9E9E9E),
                              size: 24,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'Copyright policy',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.9, 0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF95A1AC),
                                  size: 18,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: InkWell(
                  onTap: () async {
                    await launchURL('https://campusafrica.co.za');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.lock_outline,
                                color: Color(0xFF9E9E9E),
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Text(
                                  'About us',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.9, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF95A1AC),
                                    size: 18,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await signOut();
                          await Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: OnboardingWidget(),
                            ),
                            (r) => false,
                          );
                        },
                        text: 'Log Out',
                        options: FFButtonOptions(
                          width: 90,
                          height: 40,
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.primaryColor,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
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
    );
  }
}
