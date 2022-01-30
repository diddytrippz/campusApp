import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/submitted_icon_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureWidget extends StatefulWidget {
  const FurnitureWidget({Key key}) : super(key: key);

  @override
  _FurnitureWidgetState createState() => _FurnitureWidgetState();
}

class _FurnitureWidgetState extends State<FurnitureWidget> {
  String budgetValue;
  String uploadedFileUrl = '';
  TextEditingController reasonController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    reasonController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: Material(
              color: Colors.transparent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFEFE),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(18, 25, 18, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Report your issue',
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFFFFBA00),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFDBE2E7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                buttonSize: 48,
                                fillColor: Color(0xFFD93A0E),
                                icon: Icon(
                                  Icons.photo_camera_outlined,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                    allowVideo: true,
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
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 40,
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.8,
                          ),
                          decoration: BoxDecoration(),
                          child: Text(
                            'Furniture',
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFD93A0E),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: FlutterFlowDropDown(
                          options: [
                            'Damaged  base',
                            'Damaged mattress',
                            'Curtain rail needs to be replaced',
                            'My study table is damaged',
                            'My window cannot open ',
                            'My window cannot open',
                            'my window has a crack'
                          ].toList(),
                          onChanged: (val) => setState(() => budgetValue = val),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.campusRed,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          hintText: 'Select option',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFFD93A0E),
                            size: 15,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Color(0xFFDBE2E7),
                          borderWidth: 2,
                          borderRadius: 8,
                          margin:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 12, 20),
                          hidesUnderline: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 18),
                        child: TextFormField(
                          controller: reasonController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Additional notes\n',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.campusGrey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.campusGrey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 40, 24, 0),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF1E2429),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 4,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'This field cannot be empty';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 30),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (!formKey.currentState.validate()) {
                              return;
                            }
                            final maintenanceCreateData =
                                createMaintenanceRecordData(
                              issue: budgetValue,
                              status: 'Submitted',
                              email: currentUserEmail,
                              createdTime: getCurrentTimestamp,
                              displayName: currentUserDisplayName,
                              room: currentUserDocument?.room,
                              building: currentUserDocument?.building,
                              notes: reasonController.text,
                              rating: 0,
                              uid: currentUserUid,
                              category: 'Appliances',
                              isDone: false,
                              photoUrl: uploadedFileUrl,
                            );
                            await MaintenanceRecord.collection
                                .doc()
                                .set(maintenanceCreateData);

                            final chatMessagesCreateData =
                                createChatMessagesRecordData(
                              email: currentUserEmail,
                              message:
                                  'Please take note of a status change. Your request status is now \"Submitted\"',
                              timeCreated: getCurrentTimestamp,
                              displayName: currentUserDisplayName,
                              subject: 'Status Update',
                              isSelected: false,
                            );
                            await ChatMessagesRecord.collection
                                .doc()
                                .set(chatMessagesCreateData);
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x64F5F5F5),
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: SubmittedIconWidget(),
                                );
                              },
                            );
                          },
                          text: 'Save',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 55,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
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
    );
  }
}
