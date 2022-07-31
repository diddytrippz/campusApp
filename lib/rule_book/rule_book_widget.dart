import '../components/side_nav_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RuleBookWidget extends StatefulWidget {
  const RuleBookWidget({Key? key}) : super(key: key);

  @override
  _RuleBookWidgetState createState() => _RuleBookWidgetState();
}

class _RuleBookWidgetState extends State<RuleBookWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ruleBook'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 54,
          icon: Icon(
            FFIcons.kic11,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 22,
          ),
          onPressed: () async {
            logFirebaseEvent('RULE_BOOK_PAGE_ic11_ICN_ON_TAP');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'oft7p3f9' /* Campus Africa */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 1,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                SideNavWidget(
                  nav1Color: FlutterFlowTheme.of(context).primaryText,
                  nav2Color: FlutterFlowTheme.of(context).primaryText,
                  nav3Color: FlutterFlowTheme.of(context).primaryText,
                  nav4Color: FlutterFlowTheme.of(context).primaryText,
                  nav5Color: FlutterFlowTheme.of(context).primaryText,
                  nav6Color: Color(0xFFBB3713),
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: FlutterFlowPdfViewer(
                          assetPath:
                              'assets/pdfs/CampusAfrica_StudentHandbook_2021_V2.pdf',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          horizontalScroll: false,
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
