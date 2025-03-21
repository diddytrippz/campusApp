import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'af', 'zu'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? afText = '',
    String? zuText = '',
  }) =>
      [enText, afText, zuText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // onboarding
  {
    '7rm5hpzh': {
      'en': 'Campus Africa',
      'af': 'Kampus Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    'til09yqe': {
      'en': 'Campus Africa',
      'af': 'Kampus Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    '5fjqqbhk': {
      'en': 'Login',
      'af': 'Teken aan',
      'zu': 'Ngena ngemvume',
    },
    'toce9ejh': {
      'en': 'Register',
      'af': 'Registreer',
      'zu': 'Bhalisa',
    },
    '274gqvvp': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // rules
  {
    'oft7p3f9': {
      'en': 'Campus Africa',
      'af': 'Kampus Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    'mn4p3euq': {
      'en': 'Done',
      'af': '',
      'zu': '',
    },
    'abzkc55j': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // appliances
  {
    'mcuj0h22': {
      'en': '    ',
      'af': '',
      'zu': '',
    },
    'j4i8c04h': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    'yhlmssun': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    '0xxeg05f': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'rbbb12h0': {
      'en': 'Select Category...',
      'af': '',
      'zu': '',
    },
    '1ymfn53x': {
      'en': 'Search ',
      'af': '',
      'zu': '',
    },
    'bcykrgie': {
      'en': 'Appliances',
      'af': '',
      'zu': '',
    },
    'evqktkcs': {
      'en': 'Communal',
      'af': '',
      'zu': '',
    },
    'axgudevg': {
      'en': 'Electrical',
      'af': '',
      'zu': '',
    },
    'izjk3avq': {
      'en': 'Furniture',
      'af': '',
      'zu': '',
    },
    'l8mf71w8': {
      'en': 'Locksmith',
      'af': '',
      'zu': '',
    },
    'hz720lzz': {
      'en': 'Plumbing',
      'af': '',
      'zu': '',
    },
    '67uspftl': {
      'en': 'Painting',
      'af': '',
      'zu': '',
    },
    'zm3yinsm': {
      'en': 'Others',
      'af': '',
      'zu': '',
    },
    'fpqoe4gn': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'ffay1pf7': {
      'en': 'Search category',
      'af': '',
      'zu': '',
    },
    'xd8kg3r9': {
      'en': 'Stove not working',
      'af': 'Stoof werk nie',
      'zu': 'Isitofu asisebenzi',
    },
    'qvpsryf0': {
      'en': 'Oven not working',
      'af': 'Oond werk nie',
      'zu': 'Ihhavini ayisebenzi',
    },
    '5b1oxqzd': {
      'en': 'Microwave not working',
      'af': 'Mikrogolf werk nie',
      'zu': 'I-microwave ayisebenzi',
    },
    '6t6m1zbb': {
      'en': 'Fridge not working',
      'af': 'Yskas werk nie',
      'zu': 'Isiqandisi asisebenzi',
    },
    'oph1annr': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'gkp8ykl4': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    '6l4g8dr5': {
      'en': 'Description',
      'af': '',
      'zu': '',
    },
    'pyjp2ix4': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'o36f8c85': {
      'en': 'Low Priority',
      'af': '',
      'zu': '',
    },
    'cv0e4coy': {
      'en': 'Select Priority...',
      'af': '',
      'zu': '',
    },
    'kei12ey5': {
      'en': 'Search ',
      'af': '',
      'zu': '',
    },
    'le1frokg': {
      'en': 'Urgent',
      'af': '',
      'zu': '',
    },
    '7kwh5u5d': {
      'en': 'High Priority',
      'af': '',
      'zu': '',
    },
    '865356wg': {
      'en': 'Medium Priority',
      'af': '',
      'zu': '',
    },
    'wv10jye7': {
      'en': 'Low Priority',
      'af': '',
      'zu': '',
    },
    'mg3zonlo': {
      'en':
          'Please use the \'High Priority\' option for maintenance requests only if the situation requires immediate attention. Choosing this option unnecessarily may delay response times for users with genuine urgent issues. ',
      'af': '',
      'zu': '',
    },
    '24yljy29': {
      'en': 'NEXT',
      'af': '',
      'zu': '',
    },
    'b52wt0z7': {
      'en': 'BACK',
      'af': '',
      'zu': '',
    },
    '1fuuet1j': {
      'en': '3',
      'af': '',
      'zu': '',
    },
    '5mgeoo3h': {
      'en': 'Upload Image (Optional)',
      'af': '',
      'zu': '',
    },
    'xu7sgl64': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    'rbcxoxon': {
      'en': 'BACK',
      'af': '',
      'zu': '',
    },
    '4h4ogrcw': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '1751uhyb': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '0g9f1v2a': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // settings
  {
    'n9zmnk1o': {
      'en': 'Settings',
      'af': '',
      'zu': '',
    },
    'nj9u6e42': {
      'en': 'Contatcs',
      'af': 'Boodskappe',
      'zu': 'Imilayezo',
    },
    '7wn5mpz4': {
      'en': 'Manage Visitors',
      'af': 'Boodskappe',
      'zu': 'Imilayezo',
    },
    't9754pmw': {
      'en': 'Appearance',
      'af': 'Voorkoms',
      'zu': 'Ukubukeka',
    },
    'mv65usit': {
      'en': 'Student handbook',
      'af': 'Studentehandboek',
      'zu': 'Incwadi yomfundi',
    },
    'w3kgqtsc': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    '1acimcx6': {
      'en': 'Add Inspections',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    'lfkifcv6': {
      'en': 'Download CSV',
      'af': 'Taal',
      'zu': 'Ulimi',
    },
    '2u2thzj6': {
      'en': 'About us',
      'af': 'Oor ons',
      'zu': 'Mayelana NATHI',
    },
    'ak9vojgx': {
      'en': 'Logout',
      'af': 'Teken uit',
      'zu': 'Phuma',
    },
    'ugb9k6b5': {
      'en': '',
      'af': '',
      'zu': '',
    },
  },
  // messages
  {
    'ltqvlm0z': {
      'en': 'Messages',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    'sujt0c2e': {
      'en': 'All Messages',
      'af': '',
      'zu': '',
    },
    '5f28es5t': {
      'en': 'Read',
      'af': '',
      'zu': '',
    },
    'wqis7mxt': {
      'en': 'Search',
      'af': '',
      'zu': '',
    },
    'c2ekpuc8': {
      'en': 'Inbox',
      'af': '',
      'zu': '',
    },
    'tpbhhuou': {
      'en': 'Settings',
      'af': '',
      'zu': '',
    },
    '057la5a5': {
      'en': 'Notifications',
      'af': '',
      'zu': '',
    },
  },
  // sendNotifications
  {
    'ltqt3ksk': {
      'en': 'Back',
      'af': '',
      'zu': '',
    },
    '03oqvhbx': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    '5dl7h4zz': {
      'en': 'Building',
      'af': '',
      'zu': '',
    },
    'jtsn6tg0': {
      'en': 'Buildings',
      'af': '',
      'zu': '',
    },
    '30caj4ko': {
      'en': 'Search',
      'af': '',
      'zu': '',
    },
    'g7ddbuwo': {
      'en': 'Amani',
      'af': '',
      'zu': '',
    },
    'el6h8p3a': {
      'en': '80 Jorissen',
      'af': '',
      'zu': '',
    },
    'rzgeg9gi': {
      'en': '126 Siemert ',
      'af': '',
      'zu': '',
    },
    'z19gh0ri': {
      'en': '277 Bree',
      'af': '',
      'zu': '',
    },
    'a7qforvs': {
      'en': 'Braamlofts',
      'af': '',
      'zu': '',
    },
    'l779bgqm': {
      'en': 'Dunvista ',
      'af': '',
      'zu': '',
    },
    'ye82nk6p': {
      'en': 'Rennie House Apartments',
      'af': '',
      'zu': '',
    },
    '06hsq1gw': {
      'en': 'YMCA',
      'af': '',
      'zu': '',
    },
    '37h6k4vu': {
      'en': 'Title',
      'af': '',
      'zu': '',
    },
    'ribk891o': {
      'en': 'Subject',
      'af': '',
      'zu': '',
    },
    'za5svuwv': {
      'en': 'Message',
      'af': '',
      'zu': '',
    },
    'zuj4d9ow': {
      'en': 'Enter a link url source ',
      'af': '',
      'zu': '',
    },
    'hg90g3li': {
      'en': 'Copy',
      'af': '',
      'zu': '',
    },
    '2r8jabey': {
      'en': 'RSVP Required?',
      'af': '',
      'zu': '',
    },
    '2mig9zgq': {
      'en': 'Tags',
      'af': '',
      'zu': '',
    },
    'lwuooudm': {
      'en': 'General',
      'af': '',
      'zu': '',
    },
    'egbq54hd': {
      'en': 'Select Topic',
      'af': '',
      'zu': '',
    },
    'pn907v44': {
      'en': 'Search',
      'af': '',
      'zu': '',
    },
    'dtw40tvi': {
      'en': 'General',
      'af': '',
      'zu': '',
    },
    'cyqvzm8y': {
      'en': 'Bookings',
      'af': '',
      'zu': '',
    },
    'eyy94w2e': {
      'en': 'Announcement',
      'af': '',
      'zu': '',
    },
    'vfh6f4y5': {
      'en': 'Events',
      'af': '',
      'zu': '',
    },
    'qbmy4qza': {
      'en': 'Cancel',
      'af': '',
      'zu': '',
    },
    't741xcxe': {
      'en': 'Publish',
      'af': '',
      'zu': '',
    },
    '4kbcixms': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'ygjxkyww': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '9nl0yfpd': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'lrktkns3': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'hzafsymq': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // information
  {
    'p51mj787': {
      'en': 'Description',
      'af': '',
      'zu': '',
    },
    'fbswq68v': {
      'en': 'Status',
      'af': '',
      'zu': '',
    },
    'vo3etien': {
      'en': 'Bed Code',
      'af': '',
      'zu': '',
    },
    'jxcjiula': {
      'en': 'Priority',
      'af': '',
      'zu': '',
    },
    'ji50b00j': {
      'en': 'Assigned',
      'af': '',
      'zu': '',
    },
    'jjtcfobi': {
      'en': 'Duration',
      'af': '',
      'zu': '',
    },
    '6mtzkbvc': {
      'en': 'Dates',
      'af': '',
      'zu': '',
    },
    'ukws265c': {
      'en': 'Add a comment',
      'af': '',
      'zu': '',
    },
    'vqkt8pjv': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'serijtnq': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '8z1kpy7m': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // notifications
  {
    'h39o2eq7': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    '7xadpfse': {
      'en': 'For me',
      'af': 'Nuutste',
      'zu': 'Okwakamuva',
    },
    't43thx66': {
      'en': 'Following',
      'af': 'Volgende',
      'zu': 'Ukulandela',
    },
    'izarklkn': {
      'en': 'Search',
      'af': '',
      'zu': '',
    },
    'g3h9qkzx': {
      'en': 'Inbox',
      'af': '',
      'zu': '',
    },
    'vhu3mjx5': {
      'en': 'Settings',
      'af': '',
      'zu': '',
    },
    'mlb2zxgo': {
      'en': 'Notifications',
      'af': '',
      'zu': '',
    },
  },
  // visitorsManagement
  {
    '38imdsjz': {
      'en': 'VISITORS MANAGEMENT',
      'af': '',
      'zu': '',
    },
    'mexfsl4w': {
      'en': ' Visitors',
      'af': '',
      'zu': '',
    },
    'raz3azaw': {
      'en': 'RECENT VISITORS',
      'af': '',
      'zu': '',
    },
    'brdo65wq': {
      'en': 'Visitor Information',
      'af': '',
      'zu': '',
    },
    'baaf0aeu': {
      'en': 'Check in ',
      'af': '',
      'zu': '',
    },
    '8cd7d43h': {
      'en': 'Access Code',
      'af': '',
      'zu': '',
    },
    'kg3ljj12': {
      'en': 'Check Out',
      'af': '',
      'zu': '',
    },
    'fp8daous': {
      'en': 'Actions',
      'af': '',
      'zu': '',
    },
    '15js75uu': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'mx91ja07': {
      'en': 'UPCOMING VISITORS',
      'af': '',
      'zu': '',
    },
    '3yh45aj2': {
      'en': 'Visitor Information',
      'af': '',
      'zu': '',
    },
    '8ek4jbg0': {
      'en': 'Check in ',
      'af': '',
      'zu': '',
    },
    'pp6fxgr8': {
      'en': 'Access Code',
      'af': '',
      'zu': '',
    },
    'o71v1eqb': {
      'en': 'Check Out',
      'af': '',
      'zu': '',
    },
    'mwr46182': {
      'en': 'Actions',
      'af': '',
      'zu': '',
    },
    '3m4702uq': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'gfdyck6u': {
      'en': 'CHECKED-IN VISITORS',
      'af': '',
      'zu': '',
    },
    'gv2sgpws': {
      'en': 'Visitor Information',
      'af': '',
      'zu': '',
    },
    '0z91b624': {
      'en': 'Check in ',
      'af': '',
      'zu': '',
    },
    'dcnsgy12': {
      'en': 'Access Code',
      'af': '',
      'zu': '',
    },
    '6mxfaab2': {
      'en': 'Check Out',
      'af': '',
      'zu': '',
    },
    '6zjnj2f7': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    '47o5ry8x': {
      'en': 'Add Visitor',
      'af': '',
      'zu': '',
    },
    '5lzwejky': {
      'en': 'Name',
      'af': '',
      'zu': '',
    },
    'bm10tdy0': {
      'en': 'Surname',
      'af': '',
      'zu': '',
    },
    'hojpaqai': {
      'en': 'Mobile Number',
      'af': '',
      'zu': '',
    },
    'h3j0ndf7': {
      'en': 'Submit',
      'af': '',
      'zu': '',
    },
    'nops8w8y': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '4g4dyq62': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '732rqido': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'xlkb5iwz': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'x128jbj0': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '7jehq8km': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '595ap7n9': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'bicmv44j': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'qyfs1apw': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '2qao2ed3': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '2srtb8xv': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // dashboard
  {
    '0qtv0ylh': {
      'en': 'Buildings...',
      'af': '',
      'zu': '',
    },
    '8h3j8byn': {
      'en': 'Search for an item...',
      'af': '',
      'zu': '',
    },
    'efi3qam4': {
      'en': 'Amani',
      'af': '',
      'zu': '',
    },
    'ikg2x1oe': {
      'en': '80 Jorissen',
      'af': '',
      'zu': '',
    },
    'drtcf1wb': {
      'en': '126 Siemert',
      'af': '',
      'zu': '',
    },
    'w4zelvdp': {
      'en': '277 Bree',
      'af': '',
      'zu': '',
    },
    '6w6crqcz': {
      'en': 'Braamlofts',
      'af': '',
      'zu': '',
    },
    'kaejz9ki': {
      'en': 'Dunvista',
      'af': '',
      'zu': '',
    },
    '2kxkb4wz': {
      'en': 'Rennie House Apartments',
      'af': '',
      'zu': '',
    },
    'ead5vtf4': {
      'en': 'YMCA',
      'af': '',
      'zu': '',
    },
    'zv2w4py1': {
      'en': 'Bed Code',
      'af': '',
      'zu': '',
    },
    '9pjkh50z': {
      'en': 'Search for an item...',
      'af': '',
      'zu': '',
    },
    '5jfl025h': {
      'en': 'Option 1',
      'af': '',
      'zu': '',
    },
    '48c43zxa': {
      'en': 'Status',
      'af': '',
      'zu': '',
    },
    '293vm1bw': {
      'en': 'Search for an item...',
      'af': '',
      'zu': '',
    },
    'rdlec4pr': {
      'en': 'Open',
      'af': '',
      'zu': '',
    },
    'w0w3svvl': {
      'en': 'In Progress',
      'af': '',
      'zu': '',
    },
    'bhn4w6le': {
      'en': 'Closed',
      'af': '',
      'zu': '',
    },
    'a9jzgocz': {
      'en': 'All',
      'af': '',
      'zu': '',
    },
    'gchav805': {
      'en': 'Category',
      'af': '',
      'zu': '',
    },
    '9zas42t6': {
      'en': 'Search for an item...',
      'af': '',
      'zu': '',
    },
    'u1jhumu8': {
      'en': 'Plumbing',
      'af': '',
      'zu': '',
    },
    'p3n3dyc7': {
      'en': 'Appliances',
      'af': '',
      'zu': '',
    },
    '8v6dm8j7': {
      'en': 'Locksmith',
      'af': '',
      'zu': '',
    },
    'hk8cgcmx': {
      'en': 'Furniture',
      'af': '',
      'zu': '',
    },
    '5wqf0evn': {
      'en': 'Electrical',
      'af': '',
      'zu': '',
    },
    'mcf6d7r6': {
      'en': 'Others',
      'af': '',
      'zu': '',
    },
    '8n8yv9j3': {
      'en': 'Days',
      'af': '',
      'zu': '',
    },
    'pq2dl7kd': {
      'en': 'Search for an item...',
      'af': '',
      'zu': '',
    },
    '4oyd5g7e': {
      'en': '0 - 7 Days',
      'af': '',
      'zu': '',
    },
    't21kdw3n': {
      'en': '7 - 14 Days',
      'af': '',
      'zu': '',
    },
    'sek7c45b': {
      'en': '14 - 30 Days',
      'af': '',
      'zu': '',
    },
    '7uiv6ngv': {
      'en': 'Older than 30 days',
      'af': '',
      'zu': '',
    },
    '6lxw3lvm': {
      'en': 'Overview',
      'af': '',
      'zu': '',
    },
    'ij748wj8': {
      'en': 'Overview',
      'af': '',
      'zu': '',
    },
    'rxfqqrzt': {
      'en': 'Open',
      'af': '',
      'zu': '',
    },
    'v5d1vu0j': {
      'en': 'In Progress',
      'af': '',
      'zu': '',
    },
    'dgandi6f': {
      'en': 'Closed',
      'af': '',
      'zu': '',
    },
    '2zkl5ybh': {
      'en': 'Tasks List',
      'af': '',
      'zu': '',
    },
    'qpurk7bz': {
      'en': 'TASKS',
      'af': '',
      'zu': '',
    },
    '425nt8o7': {
      'en': 'ASSIGNEE',
      'af': '',
      'zu': '',
    },
    'paar5min': {
      'en': 'Categories',
      'af': '',
      'zu': '',
    },
    'n4uegmy6': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    '2p02pmta': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'fuwu13x1': {
      'en': 'Team',
      'af': '',
      'zu': '',
    },
    'k3vx8m34': {
      'en': 'Team',
      'af': '',
      'zu': '',
    },
    's2j07eh1': {
      'en': 'Sello',
      'af': '',
      'zu': '',
    },
    'xawlc7xl': {
      'en': 'Rapudi',
      'af': '',
      'zu': '',
    },
    'qvgj73ke': {
      'en': 'Frank',
      'af': '',
      'zu': '',
    },
    'lj13a75c': {
      'en': 'Thabo',
      'af': '',
      'zu': '',
    },
    'ax9m7xgd': {
      'en': 'Chats',
      'af': '',
      'zu': '',
    },
    'ph52sovw': {
      'en': ' commented',
      'af': '',
      'zu': '',
    },
    'h0bmaa0x': {
      'en': 'Maintenance',
      'af': '',
      'zu': '',
    },
    '82ymy3mu': {
      'en': 'DATE',
      'af': '',
      'zu': '',
    },
    'wqk7bcbs': {
      'en': 'STATUS',
      'af': '',
      'zu': '',
    },
    'qo35awg2': {
      'en': 'TICKET',
      'af': '',
      'zu': '',
    },
    'y0y0e251': {
      'en': 'RESIDENCE',
      'af': '',
      'zu': '',
    },
    'wnhhf5pe': {
      'en': 'BED CODE',
      'af': '',
      'zu': '',
    },
    'xo7wiavv': {
      'en': 'PRIORITY',
      'af': '',
      'zu': '',
    },
    'ektga1r0': {
      'en': 'ASSIGNEE',
      'af': '',
      'zu': '',
    },
    'nj4jmwz7': {
      'en': 'Occupants',
      'af': '',
      'zu': '',
    },
    '7k65gj47': {
      'en': 'Full Names',
      'af': '',
      'zu': '',
    },
    '7xycbo2z': {
      'en': 'Email',
      'af': '',
      'zu': '',
    },
    '2tb167wu': {
      'en': 'Building',
      'af': '',
      'zu': '',
    },
    '4f7pmw6r': {
      'en': 'Bed Code',
      'af': '',
      'zu': '',
    },
    'xxo630s9': {
      'en': 'Residency',
      'af': '',
      'zu': '',
    },
    'fs2kx27i': {
      'en': 'Document',
      'af': '',
      'zu': '',
    },
    'p8y0tj4u': {
      'en': 'Lease',
      'af': '',
      'zu': '',
    },
    '6zxrydhb': {
      'en': 'Active',
      'af': '',
      'zu': '',
    },
    '81umdlso': {
      'en': 'Access Control',
      'af': '',
      'zu': '',
    },
    '8ukwsqhu': {
      'en': 'Visitors',
      'af': '',
      'zu': '',
    },
    'o5clhjb3': {
      'en': 'ID No',
      'af': '',
      'zu': '',
    },
    'fi5q7bp6': {
      'en': 'Residence',
      'af': '',
      'zu': '',
    },
    'r9yocpyc': {
      'en': 'Bed',
      'af': '',
      'zu': '',
    },
    't1f47ob3': {
      'en': 'Date',
      'af': '',
      'zu': '',
    },
    'fbqs2pyo': {
      'en': 'Tenant',
      'af': '',
      'zu': '',
    },
    'etehqe62': {
      'en': 'Code',
      'af': '',
      'zu': '',
    },
    'c77qo87x': {
      'en': 'Documents',
      'af': '',
      'zu': '',
    },
    '6ob3txhp': {
      'en': 'Example 6',
      'af': '',
      'zu': '',
    },
    '8a3occw3': {
      'en': 'Tenant',
      'af': '',
      'zu': '',
    },
    'jqy1p5k6': {
      'en': 'Building',
      'af': '',
      'zu': '',
    },
    'fb0dkz6c': {
      'en': 'Date',
      'af': '',
      'zu': '',
    },
    'rbshe81f': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    '69l9z224': {
      'en': 'Status',
      'af': '',
      'zu': '',
    },
    'bfidpmzn': {
      'en': 'Actions',
      'af': '',
      'zu': '',
    },
    'updt3ql6': {
      'en': 'Overview',
      'af': '',
      'zu': '',
    },
    'yxbroam0': {
      'en': 'Open',
      'af': '',
      'zu': '',
    },
    'cx7hata7': {
      'en': 'In Progress',
      'af': '',
      'zu': '',
    },
    '1y2hb6do': {
      'en': 'Closed',
      'af': '',
      'zu': '',
    },
    '4f51omjy': {
      'en': 'Tasks List',
      'af': '',
      'zu': '',
    },
    'rk9wi21c': {
      'en': 'TASKS',
      'af': '',
      'zu': '',
    },
    'ce8zc8u9': {
      'en': 'ASSIGNEE',
      'af': '',
      'zu': '',
    },
    'k9qtamzd': {
      'en': 'Categories',
      'af': '',
      'zu': '',
    },
    'xn6kkqv0': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'azh8ld22': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'wl6uxhsb': {
      'en': 'Team',
      'af': '',
      'zu': '',
    },
    'hw9qewxe': {
      'en': 'Team',
      'af': '',
      'zu': '',
    },
    'mtotzmk6': {
      'en': 'Sello',
      'af': '',
      'zu': '',
    },
    '9oat4mil': {
      'en': 'Rapudi',
      'af': '',
      'zu': '',
    },
    'jh89geko': {
      'en': 'Frank',
      'af': '',
      'zu': '',
    },
    'ed9xgtr9': {
      'en': 'Thabo',
      'af': '',
      'zu': '',
    },
    '9qz876jt': {
      'en': 'Chats',
      'af': '',
      'zu': '',
    },
    'l273sli1': {
      'en': ' commented',
      'af': '',
      'zu': '',
    },
    'fhh84s8c': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // addInspection
  {
    'cz7s1ddv': {
      'en': 'Inspection',
      'af': '',
      'zu': '',
    },
    'dulbzqja': {
      'en': ' [FirstName]',
      'af': '',
      'zu': '',
    },
    '3t5wtfw0': {
      'en': '[lastName]',
      'af': '',
      'zu': '',
    },
    'jn977kyg': {
      'en': ' [email]',
      'af': '',
      'zu': '',
    },
    'w8o2lz88': {
      'en': ' [studentNumber]',
      'af': '',
      'zu': '',
    },
    '2lfmh6dl': {
      'en': 'Inspection Type',
      'af': '',
      'zu': '',
    },
    'dn715sr5': {
      'en': 'Search',
      'af': '',
      'zu': '',
    },
    'met76ug2': {
      'en': 'Entry',
      'af': '',
      'zu': '',
    },
    'tmvkkx8y': {
      'en': 'Exit',
      'af': '',
      'zu': '',
    },
    'flzhxivr': {
      'en': ' [Date]',
      'af': '',
      'zu': '',
    },
    'm5mbvrrw': {
      'en': '[Time]',
      'af': '',
      'zu': '',
    },
    '85yqd7tt': {
      'en': 'Acceptance',
      'af': '',
      'zu': '',
    },
    'e37mo1gz': {
      'en': 'I Agree & Understand',
      'af': '',
      'zu': '',
    },
    'p29u89ba': {
      'en': '*  ',
      'af': '',
      'zu': '',
    },
    'ksc7kp7v': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'pb6t04qk': {
      'en':
          'I confirm that I have read, understood, and will adhere to the House Rules, and agree to abide by the amendments thereof if such become applicable from time-to-time by Management or Government specific requirements. I understand the importance of the Entry Inspection: To ensure that I am not held liable or charged for damages that were present when I entered the room.',
      'af': '',
      'zu': '',
    },
    'pk9frm1j': {
      'en': 'Bedroom Check',
      'af': '',
      'zu': '',
    },
    'utlwawpd': {
      'en': 'Bedroom Windows',
      'af': '',
      'zu': '',
    },
    'sz27lhzt': {
      'en': 'Good Condition',
      'af': '',
      'zu': '',
    },
    'jajr0ce6': {
      'en': 'Moderate',
      'af': '',
      'zu': '',
    },
    'tu2t9tmg': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    'ahv8phol': {
      'en': 'Bedroom Doors',
      'af': '',
      'zu': '',
    },
    '10sc443e': {
      'en': 'Good Condition',
      'af': '',
      'zu': '',
    },
    'm501rftq': {
      'en': 'Moderate',
      'af': '',
      'zu': '',
    },
    '8u7kzkfd': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    'q3ik4r3o': {
      'en': 'Bedroom Doors Locks',
      'af': '',
      'zu': '',
    },
    '508mbowq': {
      'en': 'Good Condition',
      'af': '',
      'zu': '',
    },
    'o3jq0z26': {
      'en': 'Moderate',
      'af': '',
      'zu': '',
    },
    'gjmtc4hd': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    '4833y0e1': {
      'en': 'Bedroom Light Switches',
      'af': '',
      'zu': '',
    },
    '3no620np': {
      'en': 'In Order',
      'af': '',
      'zu': '',
    },
    'si2zl3fv': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    'e0bc1zji': {
      'en': 'Bedroom Plugs',
      'af': '',
      'zu': '',
    },
    '59yt99zi': {
      'en': 'In Order',
      'af': '',
      'zu': '',
    },
    'psfhey8o': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    '8b7jc8ys': {
      'en': 'Bedroom Carpet',
      'af': '',
      'zu': '',
    },
    'i6ry739z': {
      'en': 'In Order',
      'af': '',
      'zu': '',
    },
    'lct0lyr4': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    'qoyy8gs2': {
      'en': 'No Carpet',
      'af': '',
      'zu': '',
    },
    'sbajaapl': {
      'en': 'Bookshelves',
      'af': '',
      'zu': '',
    },
    'kw9moq5y': {
      'en': 'In Order',
      'af': '',
      'zu': '',
    },
    'iau8x0vw': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    'nv1zavbm': {
      'en': 'Cupboard Shelves',
      'af': '',
      'zu': '',
    },
    'vki8nly9': {
      'en': 'In Order',
      'af': '',
      'zu': '',
    },
    'lkhci452': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    'rbyfz0jn': {
      'en': 'Cupboard Drawers',
      'af': '',
      'zu': '',
    },
    '7tzbch20': {
      'en': 'In Order',
      'af': '',
      'zu': '',
    },
    'aax849w0': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    'mo5zukgo': {
      'en': 'Bed',
      'af': '',
      'zu': '',
    },
    'duqnw2if': {
      'en': 'In The Room',
      'af': '',
      'zu': '',
    },
    'yte9nvq9': {
      'en': 'Not In The Room',
      'af': '',
      'zu': '',
    },
    '0zsdznpx': {
      'en': 'Curtains',
      'af': '',
      'zu': '',
    },
    'ttquqjnf': {
      'en': 'In The Room',
      'af': '',
      'zu': '',
    },
    'jlz6z39k': {
      'en': 'Not In The Room',
      'af': '',
      'zu': '',
    },
    'ffx1gx0i': {
      'en': 'Paint/Walls/Ceiling',
      'af': '',
      'zu': '',
    },
    '0gkusmxv': {
      'en': 'Good Condition',
      'af': '',
      'zu': '',
    },
    'rxeobdkx': {
      'en': 'Moderate',
      'af': '',
      'zu': '',
    },
    'w5shel3p': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    '3fxhigie': {
      'en': 'Study Table',
      'af': '',
      'zu': '',
    },
    'm9w38hk1': {
      'en': 'Good Condition',
      'af': '',
      'zu': '',
    },
    '41p3wza2': {
      'en': 'Moderate',
      'af': '',
      'zu': '',
    },
    'orly3zv6': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    'p5saba4v': {
      'en': 'Bedroom General Comments',
      'af': '',
      'zu': '',
    },
    'suohfvzh': {
      'en': 'Explain the general condition that you found the bedroom in.',
      'af': '',
      'zu': '',
    },
    'pd4myzo7': {
      'en': 'Upload Bedroom Pictures',
      'af': '',
      'zu': '',
    },
    'iczr60f2': {
      'en': 'Click or drag files to this area to upload.',
      'af': '',
      'zu': '',
    },
    '7b7yeg86': {
      'en': 'You can upload only one file.',
      'af': '',
      'zu': '',
    },
    '850mjuzk': {
      'en': 'image.jpg',
      'af': '',
      'zu': '',
    },
    'brro38kn': {
      'en': ' x ',
      'af': '',
      'zu': '',
    },
    'xqmypmlw': {
      'en': 'Bathroom Check',
      'af': '',
      'zu': '',
    },
    'hcupvxrg': {
      'en': 'Bathroom Shower',
      'af': '',
      'zu': '',
    },
    'u97jwvb3': {
      'en': 'Good Condition',
      'af': '',
      'zu': '',
    },
    'ycffhye1': {
      'en': 'Moderate',
      'af': '',
      'zu': '',
    },
    '2d0ybyoc': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    'hy3fjnie': {
      'en': 'Hot water working',
      'af': '',
      'zu': '',
    },
    'egnst1b3': {
      'en': 'Yes',
      'af': '',
      'zu': '',
    },
    '2dsl9vgq': {
      'en': 'No',
      'af': '',
      'zu': '',
    },
    'hbbtcpbk': {
      'en': 'Mildew build up',
      'af': '',
      'zu': '',
    },
    'det84xiz': {
      'en': 'Yes',
      'af': '',
      'zu': '',
    },
    'jqmcqbod': {
      'en': 'No',
      'af': '',
      'zu': '',
    },
    'mi0dkylr': {
      'en': 'Any major leaks',
      'af': '',
      'zu': '',
    },
    'j8t0vj7y': {
      'en': 'Yes',
      'af': '',
      'zu': '',
    },
    'zhwbrf30': {
      'en': 'No',
      'af': '',
      'zu': '',
    },
    '2mwagrs1': {
      'en': 'Soap dish',
      'af': '',
      'zu': '',
    },
    'n8py1zwc': {
      'en': 'In the unit',
      'af': '',
      'zu': '',
    },
    '3vibx656': {
      'en': 'Not in the unit',
      'af': '',
      'zu': '',
    },
    '41g369d4': {
      'en': 'Taps',
      'af': '',
      'zu': '',
    },
    '6pab08b9': {
      'en': 'Working',
      'af': '',
      'zu': '',
    },
    'oqah7q5f': {
      'en': 'Not working',
      'af': '',
      'zu': '',
    },
    'cz9haj5q': {
      'en': 'Tiling needed',
      'af': '',
      'zu': '',
    },
    'l16rb60z': {
      'en': 'Yes',
      'af': '',
      'zu': '',
    },
    'bsz6zk4p': {
      'en': 'No',
      'af': '',
      'zu': '',
    },
    '8eqks1wm': {
      'en': 'Bathroom General Comments',
      'af': '',
      'zu': '',
    },
    '0oecqfe0': {
      'en': 'Explain the general condition that you found the bathroom in.',
      'af': '',
      'zu': '',
    },
    'jjbejs47': {
      'en': 'Upload Bathroom Pictures',
      'af': '',
      'zu': '',
    },
    '25y7kbvf': {
      'en': 'Click or drag files to this area to upload.',
      'af': '',
      'zu': '',
    },
    '824m2izp': {
      'en': 'You can upload up to 3 files.',
      'af': '',
      'zu': '',
    },
    'obnwre8b': {
      'en': 'image.jpg',
      'af': '',
      'zu': '',
    },
    'elppg3yb': {
      'en': ' x ',
      'af': '',
      'zu': '',
    },
    'x15qady6': {
      'en': 'Kitchen Check',
      'af': '',
      'zu': '',
    },
    'pamtclc1': {
      'en': 'Stove working',
      'af': '',
      'zu': '',
    },
    'ifygqa84': {
      'en': 'Yes',
      'af': '',
      'zu': '',
    },
    'sr6l8urg': {
      'en': 'No',
      'af': '',
      'zu': '',
    },
    'k0l58kn4': {
      'en': 'Fridge',
      'af': '',
      'zu': '',
    },
    'kii3qize': {
      'en': 'In the unit',
      'af': '',
      'zu': '',
    },
    'slyhmq8o': {
      'en': 'Not in the unit',
      'af': '',
      'zu': '',
    },
    'j814pzrr': {
      'en': 'Kitchen General Comments',
      'af': '',
      'zu': '',
    },
    'dm20oshn': {
      'en': 'Explain the general condition that you found the kitchen in.',
      'af': '',
      'zu': '',
    },
    'l8ad3c6e': {
      'en': 'Upload Kitchen Pictures',
      'af': '',
      'zu': '',
    },
    'ifizpjaw': {
      'en': 'Click or drag files to this area to upload.',
      'af': '',
      'zu': '',
    },
    '0xg54lrq': {
      'en': 'You can upload up to 3 files.',
      'af': '',
      'zu': '',
    },
    '0g2kqvpu': {
      'en': 'image3.jpg',
      'af': '',
      'zu': '',
    },
    'v5ng5tgh': {
      'en': ' x ',
      'af': '',
      'zu': '',
    },
    'xlh94m9t': {
      'en': 'General Check',
      'af': '',
      'zu': '',
    },
    'idybr36t': {
      'en': 'Keys',
      'af': '',
      'zu': '',
    },
    'vbfda02q': {
      'en': 'In order',
      'af': '',
      'zu': '',
    },
    'iett6hra': {
      'en': 'Not in order',
      'af': '',
      'zu': '',
    },
    'mumno3v2': {
      'en': 'Study table',
      'af': '',
      'zu': '',
    },
    'gakiwv4b': {
      'en': 'In the unit',
      'af': '',
      'zu': '',
    },
    '4cj0d3p4': {
      'en': 'Not in the unit',
      'af': '',
      'zu': '',
    },
    'x8px6kou': {
      'en': 'Study chair',
      'af': '',
      'zu': '',
    },
    'wxqn2iin': {
      'en': 'In the unit',
      'af': '',
      'zu': '',
    },
    'lsr0iao8': {
      'en': 'Not in the unit',
      'af': '',
      'zu': '',
    },
    'b22fmz5e': {
      'en': 'General Area Comments',
      'af': '',
      'zu': '',
    },
    '10fyc9ap': {
      'en': 'Explain the general condition that you found the bathroom in.',
      'af': '',
      'zu': '',
    },
    'xzm45pkt': {
      'en': 'Upload General Area Pictures',
      'af': '',
      'zu': '',
    },
    '3q6i94aa': {
      'en': 'Click or drag files to this area to upload.',
      'af': '',
      'zu': '',
    },
    'id2h2oma': {
      'en': 'You can upload up to 3 files.',
      'af': '',
      'zu': '',
    },
    'egs87r27': {
      'en': 'image.jpg',
      'af': '',
      'zu': '',
    },
    'u39tvro4': {
      'en': ' x ',
      'af': '',
      'zu': '',
    },
    'zpaee8u5': {
      'en': 'Confirmation of Inspection',
      'af': '',
      'zu': '',
    },
    '7f4rl9f0': {
      'en': 'I Agree',
      'af': '',
      'zu': '',
    },
    'hkzg6cp6': {
      'en':
          'I can confirm that all information added to the inspection form is correct.',
      'af': '',
      'zu': '',
    },
    'kojozupo': {
      'en': 'Submit',
      'af': '',
      'zu': '',
    },
    'zpa9g5r4': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '6rsjpybr': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'm3uo6le4': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'ved5lu7t': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'mh2coi6u': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'dwvyrkms': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'sfbv8t9w': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '9dbmn46i': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'cz03aejy': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '5r48szm7': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '9m88hvmb': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'm7m0xixn': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'hftsp1wm': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'w66ub2u8': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'ex5x73dd': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'dhi5ybeo': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'ixtxtvgk': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'ueyvy9zs': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'cu4tavv9': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'rb651yuk': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'ph0kuuiz': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // inspectionConfirm
  {
    'p79mh9ri': {
      'en': 'Thank you for\nsubmitting',
      'af': '',
      'zu': '',
    },
    'j5df3frn': {
      'en':
          'Thank you for submitting your room inspection form. Your input is important to us and we appreciate your efforts in helping us maintain a safe and comfortable living environment. ',
      'af': '',
      'zu': '',
    },
    'ujs6ha1x': {
      'en': 'Exit',
      'af': '',
      'zu': '',
    },
    '8ku78kza': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // login
  {
    'c0uz3sd0': {
      'en': 'Login',
      'af': '',
      'zu': '',
    },
    '86rr2w85': {
      'en': 'Please sign in to continue',
      'af': '',
      'zu': '',
    },
    'hcd0xsbj': {
      'en': 'Email',
      'af': '',
      'zu': '',
    },
    'xl9q50wr': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '2dm0ra52': {
      'en': 'Password',
      'af': '',
      'zu': '',
    },
    't1uwz00m': {
      'en': '••••••',
      'af': '',
      'zu': '',
    },
    'pzc6sd4e': {
      'en': 'LOGIN',
      'af': '',
      'zu': '',
    },
    '79gv1sgj': {
      'en': 'Forgot password?',
      'af': '',
      'zu': '',
    },
    'axkjgdku': {
      'en': ' Click here',
      'af': '',
      'zu': '',
    },
    'ezwehfil': {
      'en': 'Attention!',
      'af': '',
      'zu': '',
    },
    'qbqi1vl7': {
      'en': 'To log in, please follow these steps:',
      'af': '',
      'zu': '',
    },
    'hm5xop3n': {
      'en': '1. Enter your ',
      'af': '',
      'zu': '',
    },
    'snxmm87l': {
      'en': 'student email',
      'af': '',
      'zu': '',
    },
    '6bsd2hx7': {
      'en': ' in the input field.',
      'af': '',
      'zu': '',
    },
    '522gzu2i': {
      'en': '2. Click on \'Create New Password\'.',
      'af': '',
      'zu': '',
    },
    '8h9rlrb6': {
      'en': '3. Check your student email ',
      'af': '',
      'zu': '',
    },
    'i1ezxph2': {
      'en': '(including your junk/spam folder)',
      'af': '',
      'zu': '',
    },
    'l3rlmfw2': {
      'en': ' for an email from us with a link to set up your new password.',
      'af': '',
      'zu': '',
    },
    '59ls5auv': {
      'en': '4. Click on the link in the email to set up your new password.',
      'af': '',
      'zu': '',
    },
    'wmosae42': {
      'en':
          '5. Once you have set up your new password, return to the app and enter your email and new password to log in.',
      'af': '',
      'zu': '',
    },
    'fgaldz78': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // testMessage
  {
    'ebjmk519': {
      'en': 'Message...',
      'af': '',
      'zu': '',
    },
    '0vevtql5': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // search
  {
    'c0jqp3n7': {
      'en': 'Contacts',
      'af': '',
      'zu': '',
    },
    'gp55q4ft': {
      'en': 'Search',
      'af': '',
      'zu': '',
    },
  },
  // emergency
  {
    'uzj1n6vt': {
      'en': 'Are you in an emergency?',
      'af': '',
      'zu': '',
    },
    'fwusd467': {
      'en': 'Emergency Contacts',
      'af': '',
      'zu': '',
    },
    '1prlu8on': {
      'en': 'Ambulance',
      'af': '',
      'zu': '',
    },
    'yrmal24v': {
      'en': '(011 375 5911)',
      'af': '',
      'zu': '',
    },
    'pwglhhwo': {
      'en': 'SAPS',
      'af': '',
      'zu': '',
    },
    '3jj8pmam': {
      'en': '(011 497 7000)',
      'af': '',
      'zu': '',
    },
    'z9umnbor': {
      'en': 'Suicide Hotline',
      'af': '',
      'zu': '',
    },
    '2n95vjje': {
      'en': '(0800 567 567)',
      'af': '',
      'zu': '',
    },
    '9plrhagg': {
      'en': 'Fire Dept',
      'af': '',
      'zu': '',
    },
    'kbu0jjta': {
      'en': '(011 248 550)',
      'af': '',
      'zu': '',
    },
  },
  // viewNotifications
  {
    'q0g77akf': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    '92kftkq5': {
      'en': 'A',
      'af': '',
      'zu': '',
    },
    '5k6v6j4y': {
      'en': 'Admin',
      'af': '',
      'zu': '',
    },
    'b0zjw1n3': {
      'en': 'Rennie House',
      'af': '',
      'zu': '',
    },
    'iej5nw34': {
      'en': 'YMCA',
      'af': '',
      'zu': '',
    },
    'npl3m49t': {
      'en': 'Amani',
      'af': '',
      'zu': '',
    },
    '6veyljh1': {
      'en': 'Campus Africa',
      'af': '',
      'zu': '',
    },
    'o1qf9cav': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '5eq8eclt': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'ch6qki9e': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'fxnnl5yr': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '4vkqp847': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // lease
  {
    'xlp0zdu1': {
      'en': 'Lease Agreement',
      'af': '',
      'zu': '',
    },
    '534zaz9h': {
      'en': 'Done',
      'af': '',
      'zu': '',
    },
    '5g7mz4vm': {
      'en': 'Upload Action',
      'af': '',
      'zu': '',
    },
    'rm5u5hw9': {
      'en': 'Upload Action',
      'af': '',
      'zu': '',
    },
    '7jbr9leg': {
      'en': 'Search',
      'af': '',
      'zu': '',
    },
    'tutbypcp': {
      'en': 'New Upload',
      'af': '',
      'zu': '',
    },
    'adfer8np': {
      'en': 'Existing Upload',
      'af': '',
      'zu': '',
    },
    'hus72wrt': {
      'en': 'View All Uploads',
      'af': '',
      'zu': '',
    },
    'csstlw7b': {
      'en':
          ' Upload New Document:\nTo upload a new document, follow these steps:\n\n• Step 1: Click the \"Upload New Document\" button.\n\n• Step 2: Select the document you want to upload from your device.\n\n•Step 3:  Add a relevant title or description to make it easy to find later on our cloud.',
      'af': '',
      'zu': '',
    },
    'o8emqrod': {
      'en': 'Upload Lease Agreement',
      'af': '',
      'zu': '',
    },
    'ke1zpa5h': {
      'en': 'Upload a file (5MB max)',
      'af': '',
      'zu': '',
    },
    'ipy2ctkf': {
      'en': 'Drop files here\n',
      'af': '',
      'zu': '',
    },
    '7rex618b': {
      'en': 'or ',
      'af': '',
      'zu': '',
    },
    '27y3hp4w': {
      'en': 'select files',
      'af': '',
      'zu': '',
    },
    'wm81ypum': {
      'en': 'Successfully Uploaded!',
      'af': '',
      'zu': '',
    },
    'a7sw7tjt': {
      'en': 'No Files Uploaded',
      'af': '',
      'zu': '',
    },
    '3ns4bi44': {
      'en': 'Successfully Uploaded!',
      'af': '',
      'zu': '',
    },
    'kq3fisqk': {
      'en': 'No Files Uploaded',
      'af': '',
      'zu': '',
    },
    'q1fqiyk0': {
      'en': 'Successfully Uploaded!',
      'af': '',
      'zu': '',
    },
    'r7uaj818': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // viewlease
  {
    '7t8gg04d': {
      'en': 'Done',
      'af': '',
      'zu': '',
    },
    '3gxyhlvo': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // personal
  {
    'dm3v4mui': {
      'en': 'Personal Information',
      'af': '',
      'zu': '',
    },
    'c2x56evy': {
      'en': 'Done',
      'af': '',
      'zu': '',
    },
    'pfi4skl7': {
      'en': 'Update Contact Information',
      'af': '',
      'zu': '',
    },
    'lhfll531': {
      'en': 'Email',
      'af': '',
      'zu': '',
    },
    'hcjl679l': {
      'en': 'Legal Name',
      'af': '',
      'zu': '',
    },
    '0nnl4wws': {
      'en': 'First Name (s)',
      'af': '',
      'zu': '',
    },
    'tbaebejw': {
      'en': 'Last Name',
      'af': '',
      'zu': '',
    },
    'brtmsmz4': {
      'en': 'Student Number',
      'af': '',
      'zu': '',
    },
    '3lo1lz51': {
      'en': 'Cancel',
      'af': '',
      'zu': '',
    },
    'r9kirjvg': {
      'en': 'Save',
      'af': '',
      'zu': '',
    },
    '0rwgqtgg': {
      'en': 'Address',
      'af': '',
      'zu': '',
    },
    'qq86u3sz': {
      'en': 'Building',
      'af': '',
      'zu': '',
    },
    '6t8f775x': {
      'en': 'Unit',
      'af': '',
      'zu': '',
    },
    'si1xld2f': {
      'en': 'Documents',
      'af': '',
      'zu': '',
    },
    'x3pj0xev': {
      'en': 'Successfully Uploaded!',
      'af': '',
      'zu': '',
    },
    '9ffhnyjt': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // other_Profile
  {
    '98wzv0xe': {
      'en': 'Personal Information',
      'af': '',
      'zu': '',
    },
    'kxe0u5p1': {
      'en': 'Done',
      'af': '',
      'zu': '',
    },
    'vqaqkrcp': {
      'en': 'Update Contact Information',
      'af': '',
      'zu': '',
    },
    '0a1tg2tq': {
      'en': 'Email',
      'af': '',
      'zu': '',
    },
    'w5efrl3q': {
      'en': 'Legal Name',
      'af': '',
      'zu': '',
    },
    'i95zb966': {
      'en': 'First Name (s)',
      'af': '',
      'zu': '',
    },
    '3cy8jnwa': {
      'en': 'Last Name',
      'af': '',
      'zu': '',
    },
    '1ehrvz7v': {
      'en': 'Student Number',
      'af': '',
      'zu': '',
    },
    'mqtd0wer': {
      'en': 'Address',
      'af': '',
      'zu': '',
    },
    'w9sigzdr': {
      'en': 'Building',
      'af': '',
      'zu': '',
    },
    'se4z2cwn': {
      'en': 'Unit',
      'af': '',
      'zu': '',
    },
    'bgm75t6e': {
      'en': 'Documents',
      'af': '',
      'zu': '',
    },
    '6b9obtnv': {
      'en': 'Successfully Uploaded!',
      'af': '',
      'zu': '',
    },
    'mcpd7trv': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // registration
  {
    '83jg9muy': {
      'en': 'Registration',
      'af': '',
      'zu': '',
    },
    'fbfhvumv': {
      'en': 'Create Profile',
      'af': '',
      'zu': '',
    },
    'jirxceda': {
      'en': 'Student Number',
      'af': '',
      'zu': '',
    },
    'dtmsa6d0': {
      'en': 'Option 1',
      'af': '',
      'zu': '',
    },
    'z9jprs01': {
      'en': 'Name',
      'af': '',
      'zu': '',
    },
    '155x41il': {
      'en': 'Option 1',
      'af': '',
      'zu': '',
    },
    'xuze5ffm': {
      'en': 'Surname',
      'af': '',
      'zu': '',
    },
    'bsgmgqf9': {
      'en': 'Email',
      'af': '',
      'zu': '',
    },
    '1m2hbn3p': {
      'en': '+27',
      'af': '',
      'zu': '',
    },
    'ujga5z7g': {
      'en': 'Phone',
      'af': '',
      'zu': '',
    },
    'iy64w4xh': {
      'en': 'Select your Apartment or Residence',
      'af': '',
      'zu': '',
    },
    'km9j0wzk': {
      'en': 'Search for an item...',
      'af': '',
      'zu': '',
    },
    'v4jk7gm8': {
      'en': 'Option 1',
      'af': '',
      'zu': '',
    },
    'd0yauq83': {
      'en': 'Room Number',
      'af': '',
      'zu': '',
    },
    'r6zc5zpw': {
      'en': 'Create Password',
      'af': '',
      'zu': '',
    },
    'hrwwjsqq': {
      'en': 'Password',
      'af': '',
      'zu': '',
    },
    '9x3j1f12': {
      'en': 'Confirm Password',
      'af': '',
      'zu': '',
    },
    '6k7q167e': {
      'en': 'Terms & Conditions',
      'af': '',
      'zu': '',
    },
    '9d6wbd0b': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // view
  {
    'l93u0skm': {
      'en': 'Campus Africa',
      'af': '',
      'zu': '',
    },
    'eoiistge': {
      'en': 'Submitted',
      'af': '',
      'zu': '',
    },
    'xjhygysu': {
      'en': 'Tap here to view ALL tasks',
      'af': '',
      'zu': '',
    },
    'bmafe6dg': {
      'en': 'Complete',
      'af': '',
      'zu': '',
    },
    'xc8d1801': {
      'en': 'Pending',
      'af': '',
      'zu': '',
    },
    '7bmrgc01': {
      'en': 'Tap here to view ALL tasks',
      'af': '',
      'zu': '',
    },
    'm7v64mic': {
      'en': 'Complete',
      'af': '',
      'zu': '',
    },
    '4sexau43': {
      'en': 'Completed',
      'af': '',
      'zu': '',
    },
    '0019a2aj': {
      'en': 'Tap here to view ALL tasks',
      'af': '',
      'zu': '',
    },
    'k5oijbsp': {
      'en': 'Submitted',
      'af': '',
      'zu': '',
    },
    'vx2j2hju': {
      'en': 'Tap here to view ALL tasks',
      'af': '',
      'zu': '',
    },
    'l6ipyjih': {
      'en': 'Pending',
      'af': '',
      'zu': '',
    },
    'smgg9g31': {
      'en': 'Tap here to view ALL tasks',
      'af': '',
      'zu': '',
    },
    '0wfwrsgr': {
      'en': 'Completed',
      'af': '',
      'zu': '',
    },
    'vy9oywqu': {
      'en': 'Tap here to view ALL tasks',
      'af': '',
      'zu': '',
    },
    '7wtwwcdo': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    'qbz4vedv': {
      'en': 'Search',
      'af': '',
      'zu': '',
    },
    'm1s3pp1p': {
      'en': 'Inbox',
      'af': '',
      'zu': '',
    },
    'bg62n1xb': {
      'en': 'Settings',
      'af': '',
      'zu': '',
    },
    '1qb5t95q': {
      'en': 'Notifications',
      'af': '',
      'zu': '',
    },
    'hlvsqotk': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // settingsCopy
  {
    'hry3a3dn': {
      'en': 'Settings',
      'af': '',
      'zu': '',
    },
    'zzt7ocqb': {
      'en': 'General',
      'af': '',
      'zu': '',
    },
    'plthauye': {
      'en': 'Student handbook',
      'af': '',
      'zu': '',
    },
    'db66zc8l': {
      'en': 'Manage Visitors',
      'af': '',
      'zu': '',
    },
    'bo2axg6q': {
      'en': 'Contacts',
      'af': '',
      'zu': '',
    },
    'y6y4rp1k': {
      'en': 'Download CSV',
      'af': '',
      'zu': '',
    },
    '34mkf28y': {
      'en': 'Theme',
      'af': '',
      'zu': '',
    },
    'pfy2mgip': {
      'en': 'Dark',
      'af': '',
      'zu': '',
    },
    'f4x6wgl0': {
      'en': 'Light',
      'af': '',
      'zu': '',
    },
    'wifqkc10': {
      'en': 'System',
      'af': '',
      'zu': '',
    },
    '3jz52a4x': {
      'en': 'Support',
      'af': '',
      'zu': '',
    },
    'jawkbr7f': {
      'en': 'Help center',
      'af': '',
      'zu': '',
    },
    '6dcerd43': {
      'en': 'Report a bug',
      'af': '',
      'zu': '',
    },
    'ymo0mz0a': {
      'en': 'About',
      'af': '',
      'zu': '',
    },
    'k6ujhdb2': {
      'en': 'Terms of service',
      'af': '',
      'zu': '',
    },
    '4hg8949x': {
      'en': 'Privacy Policy',
      'af': '',
      'zu': '',
    },
    'ehi3wj29': {
      'en': 'App version',
      'af': '',
      'zu': '',
    },
    'uqtb52ro': {
      'en': 'V2.0.0.0 (13898)',
      'af': '',
      'zu': '',
    },
    '9jj0k7tb': {
      'en': 'More',
      'af': '',
      'zu': '',
    },
    'ly1e84c8': {
      'en': 'Rate this app',
      'af': '',
      'zu': '',
    },
    'wj3rh1yx': {
      'en': 'Reset Password',
      'af': '',
      'zu': '',
    },
    'fpmy5gjw': {
      'en': 'Log out',
      'af': '',
      'zu': '',
    },
    'ysi3sfvr': {
      'en': 'Search',
      'af': '',
      'zu': '',
    },
    'uiqhdyvg': {
      'en': 'Inbox',
      'af': '',
      'zu': '',
    },
    'el2l9460': {
      'en': 'Settings',
      'af': '',
      'zu': '',
    },
    'h78vx67a': {
      'en': 'Notifications',
      'af': '',
      'zu': '',
    },
    'a1s4dyqt': {
      'en': '',
      'af': '',
      'zu': '',
    },
  },
  // submittedIcon
  {
    '02drb4ho': {
      'en': 'FPG Property Fund',
      'af': '',
      'zu': '',
    },
    '1iu4w8c1': {
      'en': 'Success!',
      'af': '',
      'zu': '',
    },
    'nyzsxlkf': {
      'en':
          'Your ticket has been received\nby the Campus Africa maintenance\nteam.',
      'af': '',
      'zu': '',
    },
    'va601mml': {
      'en': 'Continue',
      'af': '',
      'zu': '',
    },
  },
  // darkMode
  {
    'fokdmcpy': {
      'en': 'Light Theme',
      'af': '',
      'zu': '',
    },
    'dz9vonjh': {
      'en': 'Dark Theme',
      'af': '',
      'zu': '',
    },
    'td20jus6': {
      'en': 'System Settings',
      'af': '',
      'zu': '',
    },
    'lp2avool': {
      'en': 'Close',
      'af': '',
      'zu': '',
    },
  },
  // sideNav
  {
    'a5z6pvay': {
      'en': 'Menu',
      'af': '',
      'zu': '',
    },
    'teclu4th': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
    'husv3bm9': {
      'en': 'Dashboard',
      'af': '',
      'zu': '',
    },
    'n08xop2m': {
      'en': 'Tickets',
      'af': '',
      'zu': '',
    },
    'z7ejebqi': {
      'en': 'Message',
      'af': '',
      'zu': '',
    },
    'tgbtfu8s': {
      'en': 'Users...',
      'af': '',
      'zu': '',
    },
    'pfxaeomv': {
      'en': 'Settings...',
      'af': '',
      'zu': '',
    },
    '8bz1e13i': {
      'en': 'Notifications',
      'af': '',
      'zu': '',
    },
    '7uv5pczt': {
      'en': 'Campus \nAfrica',
      'af': '',
      'zu': '',
    },
    'sd35ivuc': {
      'en': 'Dashboard',
      'af': '',
      'zu': '',
    },
    'fkgpvev9': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
    'u6t1u6c4': {
      'en': 'Admin',
      'af': '',
      'zu': '',
    },
    '6hypbbx3': {
      'en': 'Inbox',
      'af': '',
      'zu': '',
    },
    '50xme04h': {
      'en': 'Others',
      'af': '',
      'zu': '',
    },
    'fknxlrrz': {
      'en': 'Notifications',
      'af': '',
      'zu': '',
    },
    '0abiumlx': {
      'en': 'Users',
      'af': '',
      'zu': '',
    },
    'wv558bxv': {
      'en': 'Settings',
      'af': '',
      'zu': '',
    },
    '1uofyoiq': {
      'en': 'Close',
      'af': '',
      'zu': '',
    },
  },
  // passwordReset
  {
    'y1hn9pdi': {
      'en': 'Password Reset',
      'af': '',
      'zu': '',
    },
    'f2a6bau6': {
      'en':
          'If successful, a link to create a new password has been sent to your email. Please check your spam/junk folder if you can not find the email',
      'af': '',
      'zu': '',
    },
    '883c28pi': {
      'en': 'Continue',
      'af': '',
      'zu': '',
    },
  },
  // cuppertinoNewLink
  {
    'q87219u2': {
      'en': 'Add Link',
      'af': '',
      'zu': '',
    },
    'sk68b1sn': {
      'en': 'https://www.example.co.za',
      'af': '',
      'zu': '',
    },
    'oakboe48': {
      'en': 'Add',
      'af': '',
      'zu': '',
    },
    'bmgjqqec': {
      'en': 'Cancel',
      'af': '',
      'zu': '',
    },
  },
  // visitorConfirm
  {
    'ldow1jak': {
      'en': 'Access Pass for:',
      'af': '',
      'zu': '',
    },
    'qizjwmcb': {
      'en': 'Invited by',
      'af': '',
      'zu': '',
    },
    'yfd5j3k9': {
      'en': 'Dismiss',
      'af': '',
      'zu': '',
    },
  },
  // nullView
  {
    '7o3f73y6': {
      'en': 'View not available on mobile. \nPlease use your desktop/tablet.',
      'af':
          'Geen resultate is van jou soektog gevind nie. Probeer asseblief weer.',
      'zu':
          'Ayikho imiphumela etholakele oseshweni lwakho. Ngicela uzame futhi.',
    },
  },
  // optionMenu
  {
    'ce7n0qsj': {
      'en': 'Pin Visitor',
      'af': '',
      'zu': '',
    },
    '5jau58hq': {
      'en': 'Resend Invite',
      'af': '',
      'zu': '',
    },
    'njs7586o': {
      'en': 'Close',
      'af': '',
      'zu': '',
    },
  },
  // noNetwork
  {
    'hqus7opr': {
      'en': 'No network\nconnection',
      'af': '',
      'zu': '',
    },
    'eenc4t50': {
      'en': 'No network Connection. Try\nagain later',
      'af': '',
      'zu': '',
    },
    'svrjury2': {
      'en': 'Ok',
      'af': '',
      'zu': '',
    },
  },
  // rateTicket
  {
    'q3o19w0e': {
      'en': 'Rate',
      'af': '',
      'zu': '',
    },
    '014l59jt': {
      'en': 'Add Review',
      'af': '',
      'zu': '',
    },
    '5a7tzow9': {
      'en': 'Rate Ticket',
      'af': '',
      'zu': '',
    },
  },
  // messagePreview
  {
    'fdvq9jx9': {
      'en': 'Copy',
      'af': '',
      'zu': '',
    },
    'xomp38t5': {
      'en': 'Close',
      'af': '',
      'zu': '',
    },
  },
  // cuppertinoDeleteMaintenance
  {
    '4nr030s2': {
      'en': 'Please Confirm',
      'af': '',
      'zu': '',
    },
    'e1d21xjh': {
      'en': 'Are you sure you want to permanently remove this item?',
      'af': '',
      'zu': '',
    },
    'qxnpfg66': {
      'en': 'Yes',
      'af': '',
      'zu': '',
    },
    'lpeqd3vb': {
      'en': 'No',
      'af': '',
      'zu': '',
    },
  },
  // cuppertinoDeleteVisitor
  {
    '6bb3ab1p': {
      'en': 'Please Confirm',
      'af': '',
      'zu': '',
    },
    'l3fs39ae': {
      'en': 'Are you sure you want to permanently remove this item?',
      'af': '',
      'zu': '',
    },
    'b1j0rhxz': {
      'en': 'Yes',
      'af': '',
      'zu': '',
    },
    't7q0mb77': {
      'en': 'No',
      'af': '',
      'zu': '',
    },
  },
  // uploadingImages
  {
    'yf18l76u': {
      'en': 'Uploading Images',
      'af': '',
      'zu': '',
    },
    'wcx9k66x': {
      'en': 'Uploading 1 of 1',
      'af': '',
      'zu': '',
    },
  },
  // cuppertinoAlert
  {
    'pppymaa3': {
      'en': 'Alert',
      'af': '',
      'zu': '',
    },
    'qoddwrxq': {
      'en': 'Dismiss',
      'af': '',
      'zu': '',
    },
  },
  // cuppertinoDeleteNotifications
  {
    '9egzr7w3': {
      'en': 'Please Confirm',
      'af': '',
      'zu': '',
    },
    '8wa6v6ld': {
      'en': 'Are you sure you want to permanently remove this item?',
      'af': '',
      'zu': '',
    },
    'wrswo2qr': {
      'en': 'Yes',
      'af': '',
      'zu': '',
    },
    'bzz79a3d': {
      'en': 'No',
      'af': '',
      'zu': '',
    },
  },
  // passwordResetCopy
  {
    '319gxguy': {
      'en': 'Attention!',
      'af': '',
      'zu': '',
    },
    'cmg7nj10': {
      'en': 'Welcome to ',
      'af': '',
      'zu': '',
    },
    'qxfhgvk3': {
      'en': 'Campus Africa ',
      'af': '',
      'zu': '',
    },
    'j4bclbrq': {
      'en': 'App',
      'af': '',
      'zu': '',
    },
    'ugfria37': {
      'en': 'To log in, please follow these steps:',
      'af': '',
      'zu': '',
    },
    'xuhdk1e0': {
      'en': '1. Enter your ',
      'af': '',
      'zu': '',
    },
    'j5k9wmpo': {
      'en': 'student email',
      'af': '',
      'zu': '',
    },
    's61em5s8': {
      'en': ' in the input field.',
      'af': '',
      'zu': '',
    },
    'srmgeu88': {
      'en': '2. Click on \'Create New Password\'.',
      'af': '',
      'zu': '',
    },
    'xki6bntz': {
      'en': '3. Check your student email ',
      'af': '',
      'zu': '',
    },
    'azvd9zc2': {
      'en': '(including your junk/spam folder)',
      'af': '',
      'zu': '',
    },
    '6ixti1wn': {
      'en': ' for an email from us with a link to set up your new password.',
      'af': '',
      'zu': '',
    },
    '4omh5wyl': {
      'en': '4. Click on the link in the email to set up your new password.',
      'af': '',
      'zu': '',
    },
    'nlt5nps1': {
      'en':
          '5. Once you have set up your new password, return to the app and enter your email and new password to log in.',
      'af': '',
      'zu': '',
    },
    'tgv3rh11': {
      'en': 'Continue',
      'af': '',
      'zu': '',
    },
  },
  // errorSnack
  {
    'mwz8o1e4': {
      'en': 'Dismiss',
      'af': '',
      'zu': '',
    },
  },
  // successSnack
  {
    'uqxfed1e': {
      'en': 'Dismiss',
      'af': '',
      'zu': '',
    },
  },
  // infoSnack
  {
    'rkdao32k': {
      'en': 'Dismiss',
      'af': '',
      'zu': '',
    },
  },
  // topNav
  {
    'pz3wfgla': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'qqo7e29q': {
      'en': 'Notifications',
      'af': '',
      'zu': '',
    },
  },
  // record
  {
    'nxtiw8aq': {
      'en': 'Start Recording',
      'af': '',
      'zu': '',
    },
    'nstzpulz': {
      'en': 'Stop Recording',
      'af': '',
      'zu': '',
    },
    '0zay41zg': {
      'en': 'Dismiss',
      'af': '',
      'zu': '',
    },
  },
  // topSlice
  {
    'p16snx1h': {
      'en': 'New Ticket',
      'af': '',
      'zu': '',
    },
    '388w2leh': {
      'en': 'Visitors',
      'af': '',
      'zu': '',
    },
    'qwwy2fct': {
      'en': 'New Inspections',
      'af': '',
      'zu': '',
    },
    'jkmzox3h': {
      'en': 'Messages',
      'af': '',
      'zu': '',
    },
  },
  // network
  {
    'x376wlh8': {
      'en': 'No Internet Connection',
      'af': '',
      'zu': '',
    },
    'g3dsoyku': {
      'en': 'Save',
      'af': '',
      'zu': '',
    },
  },
  // notification_menus
  {
    'gusa8p3p': {
      'en': 'Edit Post',
      'af': '',
      'zu': '',
    },
    'yugdjmrz': {
      'en': 'Add information to the post',
      'af': '',
      'zu': '',
    },
    'sqm2dt1t': {
      'en': 'Delete',
      'af': '',
      'zu': '',
    },
    'l8bvadbe': {
      'en': 'Remove current post',
      'af': '',
      'zu': '',
    },
    'tczeboxc': {
      'en': 'Follow Post',
      'af': '',
      'zu': '',
    },
    'jrjppu89': {
      'en': 'Follow this post',
      'af': '',
      'zu': '',
    },
    'o5yubxmv': {
      'en': 'Unfollow Post',
      'af': '',
      'zu': '',
    },
    'ctz2nwrk': {
      'en': 'Unfollow this post',
      'af': '',
      'zu': '',
    },
    'jgefdl3c': {
      'en': 'RSVP',
      'af': '',
      'zu': '',
    },
    'a8nwh6hk': {
      'en': 'RSVP to this event',
      'af': '',
      'zu': '',
    },
    'dp2129n1': {
      'en': 'Dismiss',
      'af': '',
      'zu': '',
    },
    'y7r24fy9': {
      'en': 'Close this dialogue',
      'af': '',
      'zu': '',
    },
  },
  // pdf_menu
  {
    'ydhed888': {
      'en': 'PDF Document • 176 KB',
      'af': '',
      'zu': '',
    },
  },
  // ticket_Info
  {
    'tifu7na1': {
      'en': 'Mark as high priority ',
      'af': '',
      'zu': '',
    },
    '6jiwvcfa': {
      'en': 'Message User',
      'af': '',
      'zu': '',
    },
    '6q7wuy73': {
      'en': 'Rate this ticket',
      'af': '',
      'zu': '',
    },
    'ufobh2fh': {
      'en': 'Delete',
      'af': '',
      'zu': '',
    },
    'gdpd5j03': {
      'en': 'Close  ',
      'af': '',
      'zu': '',
    },
  },
  // admin_menu
  {
    'fwxrwhbd': {
      'en': 'Refresh',
      'af': '',
      'zu': '',
    },
    'fofd7wo8': {
      'en': 'Export CSV',
      'af': '',
      'zu': '',
    },
    '38t31t6j': {
      'en': 'Close',
      'af': '',
      'zu': '',
    },
  },
  // admin_menuCopy
  {
    'h77e4adn': {
      'en': 'View',
      'af': '',
      'zu': '',
    },
    '9w0f1x2r': {
      'en': 'Download',
      'af': '',
      'zu': '',
    },
    '7wpoqvmv': {
      'en': 'Close',
      'af': '',
      'zu': '',
    },
  },
  // rsvp
  {
    'ttggmgf0': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'irnhtufc': {
      'en': 'List of all contacts who will attend the event',
      'af': '',
      'zu': '',
    },
    'myz6qbeq': {
      'en': 'Attending',
      'af': '',
      'zu': '',
    },
  },
  // notifications_popUP
  {
    '7xkt82f7': {
      'en': 'Settings',
      'af': '',
      'zu': '',
    },
    'j5fe0lo3': {
      'en': 'LM',
      'af': '',
      'zu': '',
    },
    'ydw6x92n': {
      'en': 'Lincoln Mudau',
      'af': '',
      'zu': '',
    },
    'lihhh97i': {
      'en': 'LincolnMudau1@gmail.com',
      'af': '',
      'zu': '',
    },
    'yl1o6hkh': {
      'en': 'General',
      'af': '',
      'zu': '',
    },
    'd5e4aov5': {
      'en': 'Sound Effects',
      'af': '',
      'zu': '',
    },
    '1aj21fnu': {
      'en': 'Contacts',
      'af': '',
      'zu': '',
    },
    'szmvs1gv': {
      'en': 'Sound Effects',
      'af': '',
      'zu': '',
    },
    'pxj6ui4f': {
      'en': 'Theme',
      'af': '',
      'zu': '',
    },
    '2nezwin3': {
      'en': 'Dark',
      'af': '',
      'zu': '',
    },
    'vvdfv2pk': {
      'en': 'Light',
      'af': '',
      'zu': '',
    },
    'i9hwfygn': {
      'en': 'System',
      'af': '',
      'zu': '',
    },
    'uy462dpg': {
      'en': 'Support',
      'af': '',
      'zu': '',
    },
    'rbuhpf48': {
      'en': 'Help center',
      'af': '',
      'zu': '',
    },
    'b92y0h8m': {
      'en': 'Report a bug',
      'af': '',
      'zu': '',
    },
    'qhpbi0uz': {
      'en': 'About',
      'af': '',
      'zu': '',
    },
    'jif5t3m9': {
      'en': 'Terms of service',
      'af': '',
      'zu': '',
    },
    '5euzdubc': {
      'en': 'Privacy Policy',
      'af': '',
      'zu': '',
    },
    '9bc2tbbn': {
      'en': 'App version',
      'af': '',
      'zu': '',
    },
    '5a4chqmz': {
      'en': 'V2.0.0.0 (13898)',
      'af': '',
      'zu': '',
    },
    'd32b9s8h': {
      'en': 'More',
      'af': '',
      'zu': '',
    },
    'dwbzamcw': {
      'en': 'Rate this app',
      'af': '',
      'zu': '',
    },
    '6azfccth': {
      'en': 'Reset Password',
      'af': '',
      'zu': '',
    },
  },
  // thing
  {
    'n8d92m1j': {
      'en': 'Tickets',
      'af': '',
      'zu': '',
    },
    'df2kpt1i': {
      'en': 'Add Ticket',
      'af': '',
      'zu': '',
    },
    'c3oyb9a6': {
      'en': 'View Ticket',
      'af': '',
      'zu': '',
    },
  },
  // Miscellaneous
  {
    'tyqdleqy': {
      'en': '[Some hint text...]',
      'af': '',
      'zu': '',
    },
    'v0qzd8i3': {
      'en': 'Option 1',
      'af': '',
      'zu': '',
    },
    'gh66cq6k': {
      'en': 'Please select...',
      'af': '',
      'zu': '',
    },
    '1ujpu9zn': {
      'en': 'Search for an item...',
      'af': '',
      'zu': '',
    },
    'lvpj234m': {
      'en':
          'Enable access so you can take photos of your maintenance reports and update your profile picture.',
      'af':
          'Aktiveer toegang sodat jy foto&#39;s van jou instandhoudingsverslae kan neem en jou profielfoto kan opdateer.',
      'zu':
          'Nika amandla ukufinyelela ukuze ukwazi ukuthatha izithombe zemibiko yakho yokulungisa futhi ubuyekeze isithombe sakho sephrofayela.',
    },
    'tpjlcilr': {
      'en':
          'Let Campus Africa access your library so you can upload photos to your maintenance reports and update your profile picture',
      'af':
          'Laat Campus Africa toegang tot jou biblioteek sodat jy foto&#39;s na jou instandhoudingsverslae kan oplaai en jou profielfoto kan opdateer',
      'zu':
          'Vumela i-Campus Africa ifinyelele umtapo wakho wolwazi ukuze ukwazi ukulayisha izithombe emibikweni yakho yokulungisa futhi ubuyekeze isithombe sakho sephrofayela',
    },
    'uo3dfuv5': {
      'en':
          'Allow Campus Africa to access your microphone so you can report maintenance using audio recordings',
      'af': '',
      'zu': '',
    },
    '0oulxlkm': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'xjjji9rx': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '961yscwv': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'agtamtgc': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'nkzdpl8c': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'r9k8vtxj': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'zd5kzz0m': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '23zbtirm': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'i1ah4uwk': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'r627evom': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'dg3dveyp': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'tt9qlhvb': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'zd4vyvrw': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'z40c2u6r': {
      'en': 'File Uploaded!',
      'af': 'Lêer opgelaai!',
      'zu': 'Ifayela Lilayishiwe!',
    },
    'gpuitegy': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '7rz9brmh': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'op5eft6x': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'pkybakmu': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '4bfkhv86': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'zxholu79': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '82ragmeh': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'qvd9w3uo': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '6z8c56bm': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'pjyanqy2': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'h2dm6i3z': {
      'en': '',
      'af': '',
      'zu': '',
    },
  },
].reduce((a, b) => a..addAll(b));
