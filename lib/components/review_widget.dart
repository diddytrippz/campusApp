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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 30, 16, 35),
          child: Material(
            color: Colors.transparent,
            elevation: 30,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: AuthUserStreamWidget(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.network(
                            valueOrDefault<String>(
                              currentUserPhoto,
                              'https://images.unsplash.com/photo-1570158268183-d296b2892211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                            ),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
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
                      padding: EdgeInsetsDirectional.fromSTEB(18, 10, 18, 0),
                      child: Text(
                        'Your rating is really important for us as it helps us to improve our services for the future.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) =>
                            setState(() => ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.mellow,
                        ),
                        direction: Axis.horizontal,
                        initialRating: ratingBarValue ??=
                            widget.forReviews.rating.toDouble(),
                        unratedColor: Color(0xFF9E9E9E),
                        itemCount: 5,
                        itemSize: 35,
                        glowColor: FlutterFlowTheme.mellow,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FlutterFlowChoiceChips(
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Your review has been successfully submitted.',
                                style: TextStyle(),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Color(0x00000000),
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                      child: InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'DISMISS',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
