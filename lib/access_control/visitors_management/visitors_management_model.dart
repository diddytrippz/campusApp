import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogues/cuppertino_alert/cuppertino_alert_widget.dart';
import '/components/dialogues/cuppertino_delete_visitor/cuppertino_delete_visitor_widget.dart';
import '/components/dialogues/option_menu/option_menu_widget.dart';
import '/components/loading_animation/loading_animation_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/components/visitor_confirm/visitor_confirm_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:styled_divider/styled_divider.dart';
import 'visitors_management_widget.dart' show VisitorsManagementWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class VisitorsManagementModel
    extends FlutterFlowModel<VisitorsManagementWidget> {
  ///  Local state fields for this page.

  bool toggle = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Model for topNav component.
  late TopNavModel topNavModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextFieldname widget.
  FocusNode? textFieldnameFocusNode;
  TextEditingController? textFieldnameTextController;
  String? Function(BuildContext, String?)? textFieldnameTextControllerValidator;
  String? _textFieldnameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nops8w8y' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldsurname widget.
  FocusNode? textFieldsurnameFocusNode;
  TextEditingController? textFieldsurnameTextController;
  String? Function(BuildContext, String?)?
      textFieldsurnameTextControllerValidator;
  String? _textFieldsurnameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '732rqido' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldphone widget.
  FocusNode? textFieldphoneFocusNode;
  TextEditingController? textFieldphoneTextController;
  final textFieldphoneMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)?
      textFieldphoneTextControllerValidator;
  String? _textFieldphoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'x128jbj0' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextFielddate widget.
  FocusNode? textFielddateFocusNode;
  TextEditingController? textFielddateTextController;
  String? Function(BuildContext, String?)? textFielddateTextControllerValidator;
  // State field(s) for TextFieldtime widget.
  FocusNode? textFieldtimeFocusNode;
  TextEditingController? textFieldtimeTextController;
  String? Function(BuildContext, String?)? textFieldtimeTextControllerValidator;
  // State field(s) for Signature widget.
  SignatureController? signatureController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  VisitorsRecord? visitoradded2;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    topNavModel = createModel(context, () => TopNavModel());
    textFieldnameTextControllerValidator =
        _textFieldnameTextControllerValidator;
    textFieldsurnameTextControllerValidator =
        _textFieldsurnameTextControllerValidator;
    textFieldphoneTextControllerValidator =
        _textFieldphoneTextControllerValidator;
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    topNavModel.dispose();
    tabBarController?.dispose();
    textFieldnameFocusNode?.dispose();
    textFieldnameTextController?.dispose();

    textFieldsurnameFocusNode?.dispose();
    textFieldsurnameTextController?.dispose();

    textFieldphoneFocusNode?.dispose();
    textFieldphoneTextController?.dispose();

    textFielddateFocusNode?.dispose();
    textFielddateTextController?.dispose();

    textFieldtimeFocusNode?.dispose();
    textFieldtimeTextController?.dispose();

    signatureController?.dispose();
  }
}
