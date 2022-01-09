import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({
    Key key,
    this.forReviews,
  }) : super(key: key);

  final MaintenanceRecord forReviews;

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  String choiceChipsValue;
  double ratingBarValue;
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(150, 0, 150, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Divider(
                            thickness: 4,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                          FFAppState().profilePic,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'Your Review',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 20),
                      child: Text(
                        'Your rating is really important for us as it helps us to improve our services for the future.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) =>
                            setState(() => ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.mellow,
                        ),
                        direction: Axis.horizontal,
                        initialRating: ratingBarValue ??= 0,
                        unratedColor: Color(0xFF9E9E9E),
                        itemCount: 5,
                        itemSize: 40,
                        glowColor: FlutterFlowTheme.mellow,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 25),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.spaceEvenly,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            initialOption: choiceChipsValue ??= 'Quality',
                            options: [
                              ChipData('Quality'),
                              ChipData('Time'),
                              ChipData('Convinience')
                            ],
                            onChanged: (val) =>
                                setState(() => choiceChipsValue = val),
                            selectedChipStyle: ChipStyle(
                              backgroundColor: Color(0xFF262D34),
                              textStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              iconColor: Colors.white,
                              iconSize: 18,
                              elevation: 4,
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: Colors.white,
                              textStyle: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF262D34),
                              ),
                              iconColor: Color(0xFF262D34),
                              iconSize: 18,
                              elevation: 4,
                            ),
                            chipSpacing: 20,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                      child: TextFormField(
                        controller: textController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Add Comment',
                          labelStyle: FlutterFlowTheme.bodyText1,
                          hintText: 'dd Comment',
                          hintStyle: FlutterFlowTheme.bodyText1,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF888888),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF888888),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: FlutterFlowTheme.bodyText1,
                        maxLines: 4,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Please add a comment to help us understand the reason for your review';
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final maintenanceUpdateData =
                              createMaintenanceRecordData(
                            rating: ratingBarValue.round(),
                          );
                          await widget.forReviews.reference
                              .update(maintenanceUpdateData);
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: NavBarPage(initialPage: 'viewPage'),
                            ),
                          );
                        },
                        text: 'Confirm',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                      child: InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Skip',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
