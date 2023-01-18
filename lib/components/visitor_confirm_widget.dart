import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VisitorConfirmWidget extends StatefulWidget {
  const VisitorConfirmWidget({
    Key? key,
    this.myVisitors,
  }) : super(key: key);

  final VisitorsRecord? myVisitors;

  @override
  _VisitorConfirmWidgetState createState() => _VisitorConfirmWidgetState();
}

class _VisitorConfirmWidgetState extends State<VisitorConfirmWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.myVisitors!.tenant!),
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
          final columnUsersRecord = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 80),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'VISITOR_CONFIRM_Icon_003l1pns_ON_TAP');
                          logFirebaseEvent('Icon_bottom_sheet');
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 26,
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'h2l2va3v' /* Visitor Confirmation */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'wevm7gmi' /* Visitor access pass for */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16,
                                  ),
                            ),
                            Text(
                              '${widget.myVisitors!.name} ${widget.myVisitors!.surname}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StyledDivider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
                color: FlutterFlowTheme.of(context).secondaryText,
                lineStyle: DividerLineStyle.dashed,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'gz1ppdm5' /* Invited by */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16,
                                  ),
                            ),
                            Text(
                              columnUsersRecord.firstName!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFFFFD113),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              columnUsersRecord.bedCode!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional(0, 0.10000000000000009),
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFCD350B),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 30),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gevo4gai' /* Valid for */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'r65mpvl4' /* ONCE */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            Text(
                                              'On ${dateTimeFormat(
                                                'd/M/y',
                                                widget.myVisitors!.date,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                StyledDivider(
                                  thickness: 2,
                                  color: Colors.white,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 15),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 25, 0, 0),
                                              child: BarcodeWidget(
                                                data: widget
                                                    .myVisitors!.accessCode!,
                                                barcode: Barcode.code128(),
                                                width: 150,
                                                height: 70,
                                                color: Colors.white,
                                                backgroundColor:
                                                    Colors.transparent,
                                                errorBuilder:
                                                    (_context, _error) =>
                                                        SizedBox(
                                                  width: 150,
                                                  height: 70,
                                                ),
                                                drawText: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, 0.08),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0.2),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
