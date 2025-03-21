import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/snacks/error_snack/error_snack_widget.dart';
import '/components/snacks/success_snack/success_snack_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'send_notifications_widget.dart' show SendNotificationsWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SendNotificationsModel extends FlutterFlowModel<SendNotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in sendNotifications widget.
  List<UsersRecord>? users;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue1;
  FormFieldController<List<String>>? dropDownValueController1;
  // State field(s) for TextFieldSubject widget.
  FocusNode? textFieldSubjectFocusNode;
  TextEditingController? textFieldSubjectTextController;
  String? Function(BuildContext, String?)?
      textFieldSubjectTextControllerValidator;
  // State field(s) for TextFieldBody widget.
  FocusNode? textFieldBodyFocusNode;
  TextEditingController? textFieldBodyTextController;
  String? Function(BuildContext, String?)? textFieldBodyTextControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for TextFieldLink widget.
  FocusNode? textFieldLinkFocusNode;
  TextEditingController? textFieldLinkTextController;
  String? Function(BuildContext, String?)? textFieldLinkTextControllerValidator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    textFieldSubjectFocusNode?.dispose();
    textFieldSubjectTextController?.dispose();

    textFieldBodyFocusNode?.dispose();
    textFieldBodyTextController?.dispose();

    textFieldLinkFocusNode?.dispose();
    textFieldLinkTextController?.dispose();
  }
}
