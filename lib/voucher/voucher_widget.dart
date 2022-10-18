import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VoucherWidget extends StatefulWidget {
  const VoucherWidget({Key? key}) : super(key: key);

  @override
  _VoucherWidgetState createState() => _VoucherWidgetState();
}

class _VoucherWidgetState extends State<VoucherWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'voucher'});
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          textController2?.text = FFLocalizations.of(context).getText(
            '00af2hft' /* 2X7HV4 */,
          );
        }));
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10,
                        borderWidth: 1,
                        buttonSize: 50,
                        fillColor: Color(0xFF6757F1),
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'VOUCHER_PAGE_arrow_back_sharp_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.pop();
                        },
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'dwiccy81' /* Campus Africa */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Open Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF4E3DC7),
                            width: 3,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: Container(
                            width: 75,
                            height: 75,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://sheshaah.com/food%20logo.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: TextFormField(
                            controller: textController1,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'rec1ik1l' /* Share Coupon Code... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  25, 25, 25, 25),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 12,
                          borderWidth: 1,
                          buttonSize: 50,
                          fillColor: FlutterFlowTheme.of(context).primaryText,
                          icon: Icon(
                            FFIcons.kic8,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 50, 25, 50),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.75,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 10),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'k24yibmu' /* Dischem 
Voucher */
                                                      ,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'r629jxbk' /* Get 20 % off on all purchases */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 20, 20, 20),
                                                child: TextFormField(
                                                  controller: textController2,
                                                  autofocus: true,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 20, 20, 20),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 28,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Color(0x00F1F4F8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 0,
                                                    shape: const CircleBorder(),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 0,
                                                    shape: const CircleBorder(),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 0,
                                                    shape: const CircleBorder(),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 0,
                                                    shape: const CircleBorder(),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 0,
                                                    shape: const CircleBorder(),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 20),
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'tiim9xec' /* Valid until 03/09/2022 */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
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
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0.4),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1, 0.4),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                shape: BoxShape.circle,
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
    );
  }
}
