import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/dialogues/cuppertino_alert/cuppertino_alert_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/snacks/error_snack/error_snack_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'add_inspection_widget.dart' show AddInspectionWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AddInspectionModel extends FlutterFlowModel<AddInspectionWidget> {
  ///  Local state fields for this page.

  bool accpetance = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for DropDownType widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for bedroomWindows widget.
  FormFieldController<String>? bedroomWindowsValueController;
  // State field(s) for bedroomDoors widget.
  FormFieldController<String>? bedroomDoorsValueController;
  // State field(s) for bedroomLocks widget.
  FormFieldController<String>? bedroomLocksValueController;
  // State field(s) for bedroomLightSwitch widget.
  FormFieldController<String>? bedroomLightSwitchValueController;
  // State field(s) for bedroomPlugs widget.
  FormFieldController<String>? bedroomPlugsValueController;
  // State field(s) for bedroomCarpert widget.
  FormFieldController<String>? bedroomCarpertValueController;
  // State field(s) for booksgelves widget.
  FormFieldController<String>? booksgelvesValueController;
  // State field(s) for cupboard widget.
  FormFieldController<String>? cupboardValueController;
  // State field(s) for drawers widget.
  FormFieldController<String>? drawersValueController;
  // State field(s) for bed widget.
  FormFieldController<String>? bedValueController;
  // State field(s) for curtains widget.
  FormFieldController<String>? curtainsValueController;
  // State field(s) for paint widget.
  FormFieldController<String>? paintValueController;
  // State field(s) for studyTable widget.
  FormFieldController<String>? studyTableValueController1;
  // State field(s) for TextFieldBedroomGeneral widget.
  FocusNode? textFieldBedroomGeneralFocusNode;
  TextEditingController? textFieldBedroomGeneralTextController;
  String? Function(BuildContext, String?)?
      textFieldBedroomGeneralTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for bathroomShower widget.
  FormFieldController<String>? bathroomShowerValueController;
  // State field(s) for hotWaterWorking widget.
  FormFieldController<String>? hotWaterWorkingValueController;
  // State field(s) for mildew widget.
  FormFieldController<String>? mildewValueController;
  // State field(s) for leaks widget.
  FormFieldController<String>? leaksValueController;
  // State field(s) for soapDish widget.
  FormFieldController<String>? soapDishValueController;
  // State field(s) for taps widget.
  FormFieldController<String>? tapsValueController;
  // State field(s) for Tiling widget.
  FormFieldController<String>? tilingValueController;
  // State field(s) for TextFieldBathroomGeneral widget.
  FocusNode? textFieldBathroomGeneralFocusNode;
  TextEditingController? textFieldBathroomGeneralTextController;
  String? Function(BuildContext, String?)?
      textFieldBathroomGeneralTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for stove widget.
  FormFieldController<String>? stoveValueController;
  // State field(s) for fridge widget.
  FormFieldController<String>? fridgeValueController;
  // State field(s) for TextFieldKitchenGeneral widget.
  FocusNode? textFieldKitchenGeneralFocusNode;
  TextEditingController? textFieldKitchenGeneralTextController;
  String? Function(BuildContext, String?)?
      textFieldKitchenGeneralTextControllerValidator;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for keys widget.
  FormFieldController<String>? keysValueController;
  // State field(s) for studyTable widget.
  FormFieldController<String>? studyTableValueController2;
  // State field(s) for chair widget.
  FormFieldController<String>? chairValueController;
  // State field(s) for TextFieldGeneralArea widget.
  FocusNode? textFieldGeneralAreaFocusNode;
  TextEditingController? textFieldGeneralAreaTextController;
  String? Function(BuildContext, String?)?
      textFieldGeneralAreaTextControllerValidator;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldBedroomGeneralFocusNode?.dispose();
    textFieldBedroomGeneralTextController?.dispose();

    textFieldBathroomGeneralFocusNode?.dispose();
    textFieldBathroomGeneralTextController?.dispose();

    textFieldKitchenGeneralFocusNode?.dispose();
    textFieldKitchenGeneralTextController?.dispose();

    textFieldGeneralAreaFocusNode?.dispose();
    textFieldGeneralAreaTextController?.dispose();
  }

  /// Additional helper methods.
  String? get bedroomWindowsValue => bedroomWindowsValueController?.value;
  String? get bedroomDoorsValue => bedroomDoorsValueController?.value;
  String? get bedroomLocksValue => bedroomLocksValueController?.value;
  String? get bedroomLightSwitchValue =>
      bedroomLightSwitchValueController?.value;
  String? get bedroomPlugsValue => bedroomPlugsValueController?.value;
  String? get bedroomCarpertValue => bedroomCarpertValueController?.value;
  String? get booksgelvesValue => booksgelvesValueController?.value;
  String? get cupboardValue => cupboardValueController?.value;
  String? get drawersValue => drawersValueController?.value;
  String? get bedValue => bedValueController?.value;
  String? get curtainsValue => curtainsValueController?.value;
  String? get paintValue => paintValueController?.value;
  String? get studyTableValue1 => studyTableValueController1?.value;
  String? get bathroomShowerValue => bathroomShowerValueController?.value;
  String? get hotWaterWorkingValue => hotWaterWorkingValueController?.value;
  String? get mildewValue => mildewValueController?.value;
  String? get leaksValue => leaksValueController?.value;
  String? get soapDishValue => soapDishValueController?.value;
  String? get tapsValue => tapsValueController?.value;
  String? get tilingValue => tilingValueController?.value;
  String? get stoveValue => stoveValueController?.value;
  String? get fridgeValue => fridgeValueController?.value;
  String? get keysValue => keysValueController?.value;
  String? get studyTableValue2 => studyTableValueController2?.value;
  String? get chairValue => chairValueController?.value;
}
