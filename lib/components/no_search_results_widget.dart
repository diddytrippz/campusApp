import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NoSearchResultsWidget extends StatefulWidget {
  const NoSearchResultsWidget({Key key}) : super(key: key);

  @override
  _NoSearchResultsWidgetState createState() => _NoSearchResultsWidgetState();
}

class _NoSearchResultsWidgetState extends State<NoSearchResultsWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1, 1),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.network(
            'https://assets2.lottiefiles.com/packages/lf20_GlZGOi.json',
            width: MediaQuery.of(context).size.width,
            height: 100,
            fit: BoxFit.cover,
            repeat: false,
            animate: true,
          ),
        ],
      ),
    );
  }
}
