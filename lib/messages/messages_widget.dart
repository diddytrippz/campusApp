import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottom_nav_bar_widget.dart';
import '../components/side_nav_widget.dart';
import '../components/skeleton_messages_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class MessagesWidget extends StatefulWidget {
  const MessagesWidget({Key? key}) : super(key: key);

  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  PagingController<DocumentSnapshot?, ChatsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MESSAGES_PAGE_messages_ON_PAGE_LOAD');
      logFirebaseEvent('messages_update_local_state');
      FFAppState().update(() {
        FFAppState().skeleteMessages = true;
        FFAppState().btmNavVis = false;
      });
      logFirebaseEvent('messages_wait__delay');
      await Future.delayed(const Duration(milliseconds: 3500));
      logFirebaseEvent('messages_update_local_state');
      FFAppState().update(() {
        FFAppState().skeleteMessages = false;
      });
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'messages'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: SideNavWidget(
                    nav1Color: FlutterFlowTheme.of(context).primaryText,
                    nav2Color: FlutterFlowTheme.of(context).primaryText,
                    nav3Color: Color(0xFFC8360E),
                    nav4Color: FlutterFlowTheme.of(context).primaryText,
                    nav5Color: FlutterFlowTheme.of(context).primaryText,
                    nav6Color: FlutterFlowTheme.of(context).primaryText,
                    nav7Color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 40, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'g2apk9v9' /* Inbox */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  FFIcons.kic25,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 25,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MESSAGES_PAGE_ic25_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed('search');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                        child: PagedListView<DocumentSnapshot<Object?>?,
                            ChatsRecord>(
                          pagingController: () {
                            final Query<Object?> Function(Query<Object?>)
                                queryBuilder = (chatsRecord) => chatsRecord
                                    .where('users',
                                        arrayContains: currentUserReference)
                                    .orderBy('last_message_time',
                                        descending: true);
                            if (_pagingController != null) {
                              final query =
                                  queryBuilder(ChatsRecord.collection);
                              if (query != _pagingQuery) {
                                // The query has changed
                                _pagingQuery = query;
                                _streamSubscriptions
                                    .forEach((s) => s?.cancel());
                                _streamSubscriptions.clear();
                                _pagingController!.refresh();
                              }
                              return _pagingController!;
                            }

                            _pagingController =
                                PagingController(firstPageKey: null);
                            _pagingQuery = queryBuilder(ChatsRecord.collection);
                            _pagingController!
                                .addPageRequestListener((nextPageMarker) {
                              queryChatsRecordPage(
                                queryBuilder: (chatsRecord) => chatsRecord
                                    .where('users',
                                        arrayContains: currentUserReference)
                                    .orderBy('last_message_time',
                                        descending: true),
                                nextPageMarker: nextPageMarker,
                                pageSize: 10,
                                isStream: true,
                              ).then((page) {
                                _pagingController!.appendPage(
                                  page.data,
                                  page.nextPageMarker,
                                );
                                final streamSubscription =
                                    page.dataStream?.listen((data) {
                                  data.forEach((item) {
                                    final itemIndexes = _pagingController!
                                        .itemList!
                                        .asMap()
                                        .map((k, v) =>
                                            MapEntry(v.reference.id, k));
                                    final index =
                                        itemIndexes[item.reference.id];
                                    final items = _pagingController!.itemList!;
                                    if (index != null) {
                                      items.replaceRange(
                                          index, index + 1, [item]);
                                      _pagingController!.itemList = {
                                        for (var item in items)
                                          item.reference: item
                                      }.values.toList();
                                    }
                                  });
                                  setState(() {});
                                });
                                _streamSubscriptions.add(streamSubscription);
                              });
                            });
                            return _pagingController!;
                          }(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<ChatsRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SkeletonMessagesWidget(),
                            ),
                            noItemsFoundIndicatorBuilder: (_) => Center(
                              child: SvgPicture.asset(
                                'assets/images/Theme=Accent,_Content=Empty_chat.svg',
                                width: MediaQuery.of(context).size.width * 0.45,
                                height:
                                    MediaQuery.of(context).size.height * 0.45,
                              ),
                            ),
                            itemBuilder: (context, _, listViewIndex) {
                              final listViewChatsRecord =
                                  _pagingController!.itemList![listViewIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                child: StreamBuilder<FFChatInfo>(
                                  stream: FFChatManager.instance.getChatInfo(
                                      chatRecord: listViewChatsRecord),
                                  builder: (context, snapshot) {
                                    final chatInfo = snapshot.data ??
                                        FFChatInfo(listViewChatsRecord);
                                    return FFChatPreview(
                                      onTap: () => context.pushNamed(
                                        'chats',
                                        queryParams: {
                                          'chatUser': serializeParam(
                                            chatInfo.otherUsers.length == 1
                                                ? chatInfo.otherUsersList.first
                                                : null,
                                            ParamType.Document,
                                          ),
                                          'chatRef': serializeParam(
                                            chatInfo.chatRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'chatUser':
                                              chatInfo.otherUsers.length == 1
                                                  ? chatInfo
                                                      .otherUsersList.first
                                                  : null,
                                        },
                                      ),
                                      lastChatText:
                                          chatInfo.chatPreviewMessage(),
                                      lastChatTime:
                                          listViewChatsRecord.lastMessageTime,
                                      seen: listViewChatsRecord
                                          .lastMessageSeenBy!
                                          .contains(currentUserReference),
                                      title: chatInfo.chatPreviewTitle(),
                                      userProfilePic: chatInfo.chatPreviewPic(),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      unreadColor: Color(0xFF0078FF),
                                      titleTextStyle: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      dateTextStyle: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                      previewTextStyle: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .campusGrey,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              3, 3, 3, 3),
                                      borderRadius: BorderRadius.circular(0),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            BottomNavBarWidget(
              homeColor: FlutterFlowTheme.of(context).primaryText,
              messageColor: Color(0xFFC8360E),
              notificationColor: FlutterFlowTheme.of(context).primaryText,
              settingsColor: FlutterFlowTheme.of(context).primaryText,
            ),
        ],
      ),
    );
  }
}
