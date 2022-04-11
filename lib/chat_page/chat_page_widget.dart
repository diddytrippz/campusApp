import '../backend/backend.dart';
import '../components/empty_inbox_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    Key key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord chatUser;
  final DocumentReference chatRef;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  FFChatInfo _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ChatPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 50,
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
              onPressed: () async {
                logFirebaseEvent('IconButton-ON_TAP');
                logFirebaseEvent('IconButton-Navigate-Back');
                Navigator.pop(context);
              },
            ),
          ],
        ),
        title: Text(
          widget.chatUser.displayName,
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: InkWell(
              onTap: () async {
                logFirebaseEvent('CircleImage-ON_TAP');
                logFirebaseEvent('CircleImage-Expand-Image');
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: FlutterFlowExpandedImageView(
                      image: Image.network(
                        valueOrDefault<String>(
                          widget.chatUser.photoUrl,
                          'https://www.pngitem.com/pimgs/m/348-3483562_fox-icon-png-transparent-png.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                      allowRotation: false,
                      tag: valueOrDefault<String>(
                        widget.chatUser.photoUrl,
                        'https://www.pngitem.com/pimgs/m/348-3483562_fox-icon-png-transparent-png.png',
                      ),
                      useHeroAnimation: true,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: valueOrDefault<String>(
                  widget.chatUser.photoUrl,
                  'https://www.pngitem.com/pimgs/m/348-3483562_fox-icon-png-transparent-png.png',
                ),
                transitionOnUserGestures: true,
                child: Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.chatUser.photoUrl,
                      'https://www.pngitem.com/pimgs/m/348-3483562_fox-icon-png-transparent-png.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<FFChatInfo>(
            stream: FFChatManager.instance.getChatInfo(
              otherUserRecord: widget.chatUser,
              chatReference: widget.chatRef,
            ),
            builder: (context, snapshot) => snapshot.hasData
                ? FFChatPage(
                    chatInfo: snapshot.data,
                    allowImages: true,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    timeDisplaySetting: TimeDisplaySetting.alwaysVisible,
                    currentUserBoxDecoration: BoxDecoration(
                      color: Color(0xFF0078FF),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    otherUsersBoxDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    currentUserTextStyle: GoogleFonts.getFont(
                      'Open Sans',
                      color: Color(0xE1FFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                    ),
                    otherUsersTextStyle: GoogleFonts.getFont(
                      'Open Sans',
                      color: Color(0xFF080808),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    inputHintTextStyle: GoogleFonts.getFont(
                      'Open Sans',
                      color: FlutterFlowTheme.of(context).campusGrey,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    inputTextStyle: GoogleFonts.getFont(
                      'Open Sans',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    emptyChatWidget: Center(
                      child: EmptyInboxWidget(),
                    ),
                  )
                : Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: SpinKitPulse(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 60,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
