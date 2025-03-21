import '';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'record_model.dart';
export 'record_model.dart';

class RecordWidget extends StatefulWidget {
  const RecordWidget({super.key});

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {
  late RecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_model.showStop == true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 2.0, 10.0, 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Icon(
                                Icons.keyboard_voice,
                                color: FlutterFlowTheme.of(context).campusRed,
                                size: 20.0,
                              ),
                            ),
                            FlutterFlowTimer(
                              initialTime: _model.timerInitialTimeMs,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                milliSecond: false,
                              ),
                              controller: _model.timerController,
                              updateStateInterval: Duration(milliseconds: 1000),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.timerMilliseconds = value;
                                _model.timerValue = displayTime;
                                if (shouldUpdate) safeSetState(() {});
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'nxtiw8aq' /* Start Recording */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 35.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  fillColor: FlutterFlowTheme.of(context).campusRed,
                  icon: Icon(
                    Icons.keyboard_voice,
                    color: Colors.white,
                    size: 26.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('RECORD_COMP_keyboard_voice_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_request_permissions');
                    await requestPermission(microphonePermission);
                    if (await getPermissionStatus(microphonePermission)) {
                      logFirebaseEvent('IconButton_timer');
                      _model.timerController.onStartTimer();
                      logFirebaseEvent('IconButton_start_audio_recording');
                      await startAudioRecording(
                        context,
                        audioRecorder: _model.audioRecorder ??= AudioRecorder(),
                      );

                      logFirebaseEvent('IconButton_update_component_state');
                      _model.showStop = true;
                      safeSetState(() {});
                    }
                  },
                ),
              ],
            ),
          ),
          if (_model.showStop == true)
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 5.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'nstzpulz' /* Stop Recording */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 35.0,
                    borderWidth: 1.0,
                    buttonSize: 45.0,
                    fillColor: FlutterFlowTheme.of(context).campusRed,
                    icon: Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.white,
                      size: 26.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'RECORD_stop_circle_outlined_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_stop_audio_recording');
                      await stopAudioRecording(
                        audioRecorder: _model.audioRecorder,
                        audioName: 'recordedFileBytes',
                        onRecordingComplete: (audioFilePath, audioBytes) {
                          _model.appliancesAudioSound = audioFilePath;
                          _model.recordedFileBytes = audioBytes;
                        },
                      );

                      logFirebaseEvent('IconButton_timer');
                      _model.timerController.onStopTimer();
                      logFirebaseEvent('IconButton_update_app_state');
                      FFAppState().sound = _model.appliancesAudioSound!;
                      FFAppState().update(() {});

                      safeSetState(() {});
                    },
                  ),
                ],
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 100.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '0zay41zg' /* Dismiss */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 35.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  fillColor: FlutterFlowTheme.of(context).campusRed,
                  icon: Icon(
                    Icons.clear_rounded,
                    color: Colors.white,
                    size: 26.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('RECORD_COMP_clear_rounded_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_dismiss_dialog');
                    Navigator.pop(context, _model.appliancesAudioSound);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
