import '/components/side_nav/side_nav_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'emergency_widget.dart' show EmergencyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyModel extends FlutterFlowModel<EmergencyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topNav component.
  late TopNavModel topNavModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    topNavModel = createModel(context, () => TopNavModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    topNavModel.dispose();
    sideNavModel.dispose();
  }
}
