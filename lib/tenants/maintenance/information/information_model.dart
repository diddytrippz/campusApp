import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ticket_menu/ticket_info/ticket_info_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'information_widget.dart' show InformationWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class InformationModel extends FlutterFlowModel<InformationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in information widget.
  ChatsRecord? chats1;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TextFieldComment widget.
  FocusNode? textFieldCommentFocusNode;
  TextEditingController? textFieldCommentTextController;
  String? Function(BuildContext, String?)?
      textFieldCommentTextControllerValidator;
  String? _textFieldCommentTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vqkt8pjv' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    textFieldCommentTextControllerValidator =
        _textFieldCommentTextControllerValidator;
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    textFieldCommentFocusNode?.dispose();
    textFieldCommentTextController?.dispose();
  }
}
