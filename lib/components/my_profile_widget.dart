import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({
    Key key,
    this.profPic,
  }) : super(key: key);

  final String profPic;

  @override
  _MyProfileWidgetState createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  String uploadedFileUrl = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 1),
                child: FutureBuilder<List<UsersRecord>>(
                  future: queryUsersRecordOnce(
                    queryBuilder: (usersRecord) =>
                        usersRecord.where('email', isEqualTo: currentUserEmail),
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
                    List<UsersRecord> columnUsersRecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final columnUsersRecord = columnUsersRecordList.isNotEmpty
                        ? columnUsersRecordList.first
                        : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 35),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.tertiaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 18),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: Container(
                                          width: 50,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.campusRed,
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFDBE2E7),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2, 2, 2, 2),
                                  child: AuthUserStreamWidget(
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://images.unsplash.com/photo-1570158268183-d296b2892211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: 'circleImageTag',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: 'circleImageTag',
                                        transitionOnUserGestures: true,
                                        child: Container(
                                          width: 90,
                                          height: 90,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://images.unsplash.com/photo-1570158268183-d296b2892211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                              child: AuthUserStreamWidget(
                                child: Text(
                                  currentUserDisplayName,
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 14),
                          child: Text(
                            currentUserEmail,
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      validateFileFormat(
                                          selectedMedia.storagePath, context)) {
                                    showUploadMessage(
                                        context, 'Uploading file...',
                                        showLoading: true);
                                    final downloadUrl = await uploadData(
                                        selectedMedia.storagePath,
                                        selectedMedia.bytes);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (downloadUrl != null) {
                                      setState(
                                          () => uploadedFileUrl = downloadUrl);
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      showUploadMessage(
                                          context, 'Failed to upload media');
                                      return;
                                    }
                                  }

                                  final usersUpdateData =
                                      createUsersRecordData();
                                  await currentUserReference
                                      .update(usersUpdateData);
                                },
                                text: 'Change Photo',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Colors.white,
                                  textStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.campusRed,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 40),
                          child: InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'DISMISS',
                              style: FlutterFlowTheme.title3.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.campusGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
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
      ],
    );
  }
}
