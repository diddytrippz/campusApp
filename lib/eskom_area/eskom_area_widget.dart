import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EskomAreaWidget extends StatefulWidget {
  const EskomAreaWidget({Key? key}) : super(key: key);

  @override
  _EskomAreaWidgetState createState() => _EskomAreaWidgetState();
}

class _EskomAreaWidgetState extends State<EskomAreaWidget> {
  TextEditingController? textController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'eskomArea'});
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'ESKOM_AREA_PAGE_Icon_n3dbonvt_ON_TAP');
                        logFirebaseEvent('Icon_navigate_back');
                        context.pop();
                      },
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 18, 18, 18),
                child: TextFormField(
                  controller: textController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController',
                    Duration(milliseconds: 500),
                    () => setState(() {}),
                  ),
                  onFieldSubmitted: (_) async {
                    logFirebaseEvent(
                        'ESKOM_AREA_TextField_kujwae8d_ON_TEXTFIE');
                    logFirebaseEvent('TextField_update_local_state');
                    FFAppState().update(() {
                      FFAppState().region = textController!.text;
                    });
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: FFLocalizations.of(context).getText(
                      '6hy3h1xk' /* Search for area */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFCD350B),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFCD350B),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                    prefixIcon: Icon(
                      FFIcons.ksearch,
                      size: 18,
                    ),
                    suffixIcon: textController!.text.isNotEmpty
                        ? InkWell(
                            onTap: () async {
                              textController?.clear();
                              setState(() {});
                            },
                            child: Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: LoadsheddingGroup.getAreaCall.call(
                      text: FFAppState().region,
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
                      final columnGetAreaResponse = snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'ESKOM_AREA_PAGE_Text_l3jedr2h_ON_TAP');
                              logFirebaseEvent('Text_update_local_state');
                              FFAppState().update(() {
                                FFAppState().eskomPlace = getJsonField(
                                  columnGetAreaResponse.jsonBody,
                                  r'''$.areas[:].id''',
                                ).toString();
                              });
                            },
                            child: Text(
                              getJsonField(
                                columnGetAreaResponse.jsonBody,
                                r'''$.areas[:].region''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
