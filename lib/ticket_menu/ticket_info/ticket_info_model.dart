import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/rate_ticket/rate_ticket_widget.dart';
import '/components/snacks/error_snack/error_snack_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'ticket_info_widget.dart' show TicketInfoWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TicketInfoModel extends FlutterFlowModel<TicketInfoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  ChatsRecord? myNewChats;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
