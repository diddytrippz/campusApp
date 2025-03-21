import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/rate_ticket/rate_ticket_widget.dart';
import '/components/snacks/error_snack/error_snack_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ticket_info_model.dart';
export 'ticket_info_model.dart';

class TicketInfoWidget extends StatefulWidget {
  const TicketInfoWidget({
    super.key,
    this.ticket,
    this.user,
    this.chats,
  });

  final MaintenanceRecord? ticket;
  final UsersRecord? user;
  final ChatsRecord? chats;

  @override
  State<TicketInfoWidget> createState() => _TicketInfoWidgetState();
}

class _TicketInfoWidgetState extends State<TicketInfoWidget> {
  late TicketInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketInfoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.7, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(25.0, 40.0, 25.0, 0.0),
        child: Container(
          width: 300.0,
          constraints: BoxConstraints(
            minWidth: 300.0,
            maxWidth: 300.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (valueOrDefault(currentUserDocument?.role, '') != 'Tenant')
                  AuthUserStreamWidget(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'TICKET_INFO_COMP_Row_qihzhfk6_ON_TAP');
                        logFirebaseEvent('Row_backend_call');

                        await widget!.ticket!.reference
                            .update(createMaintenanceRecordData(
                          priority: 'High Priority',
                        ));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'tifu7na1' /* Mark as high priority  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 0.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).lineColor,
                            icon: Icon(
                              Icons.priority_high_rounded,
                              color: FlutterFlowTheme.of(context).error,
                              size: 22.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('TICKET_INFO_COMP_Row_391obnmh_ON_TAP');
                    var _shouldSetState = false;
                    if (widget!.chats != null) {
                      logFirebaseEvent('Row_navigate_to');

                      context.pushNamed(
                        TestMessageWidget.routeName,
                        queryParameters: {
                          'users': serializeParam(
                            widget!.user,
                            ParamType.Document,
                          ),
                          'chat': serializeParam(
                            widget!.chats?.reference,
                            ParamType.DocumentReference,
                          ),
                          'issue': serializeParam(
                            widget!.ticket?.issue,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'users': widget!.user,
                        },
                      );

                      if (_shouldSetState) safeSetState(() {});
                      return;
                    } else {
                      logFirebaseEvent('Row_update_app_state');
                      FFAppState().tempUserList = [];
                      FFAppState().update(() {});
                      logFirebaseEvent('Row_update_app_state');
                      FFAppState().addToTempUserList(widget!.user!.reference);
                      FFAppState().update(() {});
                      logFirebaseEvent('Row_backend_call');

                      var chatsRecordReference = ChatsRecord.collection.doc();
                      await chatsRecordReference.set({
                        ...createChatsRecordData(
                          userA: widget!.ticket?.userRec,
                          userB: currentUserReference,
                        ),
                        ...mapToFirestore(
                          {
                            'users': FFAppState().tempUserList,
                          },
                        ),
                      });
                      _model.myNewChats = ChatsRecord.getDocumentFromData({
                        ...createChatsRecordData(
                          userA: widget!.ticket?.userRec,
                          userB: currentUserReference,
                        ),
                        ...mapToFirestore(
                          {
                            'users': FFAppState().tempUserList,
                          },
                        ),
                      }, chatsRecordReference);
                      _shouldSetState = true;
                      logFirebaseEvent('Row_navigate_to');

                      context.pushNamed(
                        TestMessageWidget.routeName,
                        queryParameters: {
                          'users': serializeParam(
                            widget!.user,
                            ParamType.Document,
                          ),
                          'chat': serializeParam(
                            _model.myNewChats?.reference,
                            ParamType.DocumentReference,
                          ),
                          'issue': serializeParam(
                            widget!.ticket?.issue,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'users': widget!.user,
                        },
                      );

                      if (_shouldSetState) safeSetState(() {});
                      return;
                    }

                    if (_shouldSetState) safeSetState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '6jiwvcfa' /* Message User */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).lineColor,
                        icon: Icon(
                          FFIcons.kmessages3,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),
                if (widget!.ticket?.email == currentUserEmail)
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'TICKET_INFO_COMP_Row_741ud5ep_ON_TAP');
                        if (widget!.ticket?.status == 'Completed') {
                          if (widget!.ticket?.email == currentUserEmail) {
                            logFirebaseEvent('Row_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x00000000),
                              enableDrag: false,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: RateTicketWidget(
                                    refNo: widget!.ticket,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            return;
                          }
                        } else {
                          logFirebaseEvent('Row_alert_dialog');
                          await showAlignedDialog(
                            context: context,
                            isGlobal: false,
                            avoidOverflow: true,
                            targetAnchor: AlignmentDirectional(-1.0, 1.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: AlignmentDirectional(0.0, -1.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: ErrorSnackWidget(
                                  title: 'Ticket cannot be rated',
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '6q7wuy73' /* Rate this ticket */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 0.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).lineColor,
                            icon: Icon(
                              FFIcons.kclipboardTick,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 22.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.ticket?.email == currentUserEmail)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('TICKET_INFO_COMP_Row_vgd5pnx3_ON_TAP');
                      logFirebaseEvent('Row_backend_call');
                      await widget!.ticket!.reference.delete();
                      logFirebaseEvent('Row_dismiss_dialog');
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ufobh2fh' /* Delete */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 0.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).lineColor,
                          icon: FaIcon(
                            FontAwesomeIcons.solidTrashAlt,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('TICKET_INFO_COMP_Row_6vz6xl42_ON_TAP');
                    logFirebaseEvent('Row_dismiss_dialog');
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'gdpd5j03' /* Close   */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).lineColor,
                        icon: Icon(
                          Icons.clear_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'TICKET_INFO_clear_rounded_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_dismiss_dialog');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(height: 15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
