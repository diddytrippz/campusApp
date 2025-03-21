import '/auth/firebase_auth/auth_util.dart';
import '/components/thing_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'side_nav_widget.dart' show SideNavWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideNavModel extends FlutterFlowModel<SideNavWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for thing component.
  late ThingModel thingModel;

  @override
  void initState(BuildContext context) {
    thingModel = createModel(context, () => ThingModel());
  }

  @override
  void dispose() {
    thingModel.dispose();
  }
}
