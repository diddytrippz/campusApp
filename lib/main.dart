import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:campus_africa/onboarding/onboarding_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page/home_page_widget.dart';
import 'view_page/view_page_widget.dart';
import 'inbox_page/inbox_page_widget.dart';
import 'settings_page/settings_page_widget.dart';
import 'messages_page/messages_page_widget.dart';
import 'users_page/users_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  Stream<CampusAfricaFirebaseUser> userStream;
  CampusAfricaFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  void setLocale(Locale value) => setState(() => _locale = value);

  @override
  void initState() {
    super.initState();
    userStream = campusAfricaFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Africa',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null || displaySplashImage
          ? Container(
              color: FlutterFlowTheme.primaryColor,
              child: Center(
                child: Builder(
                  builder: (context) => Image.asset(
                    'assets/images/campus_logo_1.png',
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.75,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : OnboardingWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'homePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'homePage': HomePageWidget(),
      'viewPage': ViewPageWidget(),
      'inboxPage': InboxPageWidget(),
      'settingsPage': SettingsPageWidget(),
      'MessagesPage': MessagesPageWidget(),
      'UsersPage': UsersPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) =>
            setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        color: FlutterFlowTheme.campusGrey,
        activeColor: FlutterFlowTheme.tertiaryColor,
        tabBackgroundColor: FlutterFlowTheme.campusRed,
        tabBorderRadius: 25,
        tabMargin: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 16),
        padding: EdgeInsetsDirectional.fromSTEB(14, 12, 4, 12),
        gap: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        duration: Duration(milliseconds: 1000),
        haptic: true,
        tabs: [
          GButton(
            icon: Icons.home_sharp,
            text: 'HOME',
            iconSize: 24,
          ),
          GButton(
            icon: currentIndex == 1
                ? Icons.markunread_mailbox
                : Icons.markunread_mailbox_outlined,
            text: 'VIEW',
            iconSize: 24,
          ),
          GButton(
            icon: currentIndex == 2
                ? Icons.notifications
                : Icons.notifications_none,
            text: 'Messages',
            iconSize: 24,
          ),
          GButton(
            icon: currentIndex == 3 ? Icons.person : Icons.person_outline,
            text: 'SETTINGS',
            iconSize: 24,
          ),
          GButton(
            icon: currentIndex == 4
                ? Icons.chat_bubble_rounded
                : Icons.chat_bubble_outline,
            text: 'Chats',
            iconSize: 24,
          ),
          GButton(
            icon: Icons.three_k,
            text: 'users',
            iconSize: 24,
          )
        ],
      ),
    );
  }
}
