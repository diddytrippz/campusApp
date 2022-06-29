import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/signature_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class InspectWidget extends StatefulWidget {
  const InspectWidget({Key? key}) : super(key: key);

  @override
  _InspectWidgetState createState() => _InspectWidgetState();
}

class _InspectWidgetState extends State<InspectWidget> {
  String uploadedFileUrl = '';
  String? choiceChipsValue;
  TextEditingController? commentTextController;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    commentTextController = TextEditingController();
    textController1 = TextEditingController(text: currentUserDisplayName);
    textController2 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.building, ''));
    textController3 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.room, ''));
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'inspect'});
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
            Icons.arrow_back,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            logFirebaseEvent('INSPECT_PAGE_arrow_back_ICN_ON_TAP');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          'Inspection Sheet',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          logFirebaseEvent('INSPECT_FloatingActionButton_amfv05ov_ON');
          logFirebaseEvent('FloatingActionButton_Validate-Form');
          if (formKey.currentState == null ||
              !formKey.currentState!.validate()) {
            return;
          }

          logFirebaseEvent('FloatingActionButton_Bottom-Sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Color(0x1CFFFFFF),
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: SignatureWidget(),
              );
            },
          );
        },
        backgroundColor: Color(0xFF3A8551),
        icon: Icon(
          Icons.done_all_outlined,
          color: FlutterFlowTheme.of(context).primaryBtnText,
        ),
        elevation: 8,
        label: Text(
          'Submit',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryBtnText,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: Container(
                      width: 120,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/campus_logo_1.png',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Name:',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: AuthUserStreamWidget(
                          child: TextFormField(
                            controller: textController1,
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController1',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x2E464749),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x2E464749),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Name:',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: AuthUserStreamWidget(
                          child: TextFormField(
                            controller: textController2,
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController2',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x2E464749),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x2E464749),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Unit no:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: AuthUserStreamWidget(
                            child: TextFormField(
                              controller: textController3,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController3',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x2E464749),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x2E464749),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: StreamBuilder<List<ChecklistRecord>>(
                      stream: queryChecklistRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: SpinKitPulse(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 60,
                              ),
                            ),
                          );
                        }
                        List<ChecklistRecord> columnChecklistRecordList =
                            snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(columnChecklistRecordList.length,
                                    (columnIndex) {
                              final columnChecklistRecord =
                                  columnChecklistRecordList[columnIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 10),
                                child: Container(
                                  width: double.infinity,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  child: ExpandableNotifier(
                                    initialExpanded: true,
                                    child: ExpandablePanel(
                                      header: Text(
                                        columnChecklistRecord!.description!,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18,
                                            ),
                                      ),
                                      collapsed: Text(
                                        'No comment',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      expanded: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 30, 10, 0),
                                            child: FlutterFlowChoiceChips(
                                              initiallySelected: [
                                                choiceChipsValue
                                              ],
                                              options: (columnChecklistRecord!
                                                          .options!
                                                          .toList()! ??
                                                      [])
                                                  .map((label) =>
                                                      ChipData(label))
                                                  .toList(),
                                              onChanged: (val) => setState(() =>
                                                  choiceChipsValue =
                                                      val?.first),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFF040404),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.white,
                                                        ),
                                                iconColor: Colors.white,
                                                iconSize: 18,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(5, 5, 5, 5),
                                                elevation: 4,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor: Colors.white,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color: Color(0xFF323B45),
                                                    ),
                                                iconColor: Color(0xFF323B45),
                                                iconSize: 18,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(5, 5, 5, 5),
                                                elevation: 4,
                                              ),
                                              chipSpacing: 15,
                                              rowSpacing: 10,
                                              multiselect: false,
                                              alignment: WrapAlignment.start,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 30, 0, 10),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'INSPECT_PAGE_Container_jpu5rdw4_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Container_Upload-Photo-Video');
                                                        final selectedMedia =
                                                            await selectMediaWithSourceBottomSheet(
                                                          context: context,
                                                          imageQuality: 100,
                                                          allowPhoto: true,
                                                        );
                                                        if (selectedMedia !=
                                                                null &&
                                                            selectedMedia.every((m) =>
                                                                validateFileFormat(
                                                                    m.storagePath,
                                                                    context))) {
                                                          showUploadMessage(
                                                            context,
                                                            'Uploading file...',
                                                            showLoading: true,
                                                          );
                                                          final downloadUrls =
                                                              (await Future.wait(selectedMedia
                                                                      .map((m) async => await uploadData(
                                                                          m
                                                                              .storagePath,
                                                                          m
                                                                              .bytes))))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                          if (downloadUrls !=
                                                                  null &&
                                                              downloadUrls
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                            setState(() =>
                                                                uploadedFileUrl =
                                                                    downloadUrls
                                                                        .first);
                                                            showUploadMessage(
                                                              context,
                                                              'File Uploaded!',
                                                            );
                                                          } else {
                                                            showUploadMessage(
                                                              context,
                                                              'Failed to upload media',
                                                            );
                                                            return;
                                                          }
                                                        }
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 10,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Container(
                                                          width: 80,
                                                          height: 80,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.network(
                                                                'https://image.pngaaa.com/768/791768-middle.png',
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 10,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Container(
                                                        width: 80,
                                                        height: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              'https://image.pngaaa.com/768/791768-middle.png',
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 10,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Container(
                                                        width: 80,
                                                        height: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              'https://image.pngaaa.com/768/791768-middle.png',
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 10,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Container(
                                                        width: 80,
                                                        height: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              'https://image.pngaaa.com/768/791768-middle.png',
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
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
                                                    10, 20, 0, 20),
                                            child: TextFormField(
                                              controller: commentTextController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                'commentTextController',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Add Comment...',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                filled: true,
                                                fillColor: Color(0x81DEDEDE),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(30, 50, 0, 0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16,
                                                      ),
                                              maxLines: 5,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return 'Field is required';
                                                }

                                                if (val.length > 80) {
                                                  return 'Maximum 80 characters allowed, currently ${val.length}.';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      theme: ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
