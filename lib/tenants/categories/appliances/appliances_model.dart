import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/dialogues/uploading_images/uploading_images_widget.dart';
import '/components/record/record_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/snacks/error_snack/error_snack_widget.dart';
import '/components/snacks/success_snack/success_snack_widget.dart';
import '/components/submitted_icon/submitted_icon_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'appliances_widget.dart' show AppliancesWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppliancesModel extends FlutterFlowModel<AppliancesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Model for topNav component.
  late TopNavModel topNavModel;
  // State field(s) for CategoriesDropdown widget.
  String? categoriesDropdownValue;
  FormFieldController<String>? categoriesDropdownValueController;
  // State field(s) for issue widget.
  String? issueValue;
  FormFieldController<String>? issueValueController;
  // State field(s) for reason widget.
  FocusNode? reasonFocusNode;
  TextEditingController? reasonTextController;
  String? Function(BuildContext, String?)? reasonTextControllerValidator;
  String? _reasonTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4h4ogrcw' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for uploadingImages component.
  late UploadingImagesModel uploadingImagesModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  String? aplliancesAudio1;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    topNavModel = createModel(context, () => TopNavModel());
    reasonTextControllerValidator = _reasonTextControllerValidator;
    uploadingImagesModel = createModel(context, () => UploadingImagesModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    topNavModel.dispose();
    reasonFocusNode?.dispose();
    reasonTextController?.dispose();

    uploadingImagesModel.dispose();
  }
}
