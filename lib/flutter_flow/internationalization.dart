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
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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
  // login
  {
    'tgskapzx': {
      'en': 'Sign In',
      'af': '',
      'zu': '',
    },
    '7vcpc0mi': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'x0viklun': {
      'en': 'Enter Student Your Email',
      'af': '',
      'zu': '',
    },
    'ekehj1f9': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'a72qcfjf': {
      'en': 'Enter Your Password',
      'af': '',
      'zu': '',
    },
    'd4an6irz': {
      'en': 'Sign In',
      'af': '',
      'zu': '',
    },
    'rppaluuv': {
      'en': 'Forgot Password?',
      'af': '',
      'zu': '',
    },
    '6iiwvi49': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'jhzzqlsx': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '8o3gbjtj': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'iv7yv8qi': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'tgpjg0xr': {
      'en': 'Sign Up',
      'af': '',
      'zu': '',
    },
    'wm8a31zz': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'lf5g9whj': {
      'en': 'Enter Student Your Email',
      'af': '',
      'zu': '',
    },
    'bh05eotq': {
      'en': 'Create account',
      'af': '',
      'zu': '',
    },
    'eaeqw1o6': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'j8ro5rx8': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'p8zu0wua': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // view
  {
    '7lefrg9p': {
      'en': 'Maintenance',
      'af': '',
      'zu': '',
    },
    'fxusdesr': {
      'en': 'Submitted',
      'af': 'Ingedien',
      'zu': 'Kuthunyelwe',
    },
    'x8cw3w69': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    'xliyc9jb': {
      'en': 'Pending',
      'af': 'Hangende',
      'zu': 'Kusalindile',
    },
    '4e2bu1eh': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    'nj9umfeo': {
      'en': 'Completed',
      'af': 'Voltooi',
      'zu': 'Kuqediwe',
    },
    '9zcs84ro': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    '4mu7n5uz': {
      'en': 'Submitted',
      'af': 'Ingedien',
      'zu': 'Kuthunyelwe',
    },
    'epsh7pdm': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    'zset6avm': {
      'en': 'Complete',
      'af': 'Voltooi',
      'zu': 'Qedela',
    },
    '6firyr35': {
      'en': 'Pending',
      'af': 'Hangende',
      'zu': 'Kusalindile',
    },
    'xv02t8u2': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    'r52o7k9c': {
      'en': 'Reject',
      'af': 'Verwerp',
      'zu': 'Yenqaba',
    },
    'ib1fouvv': {
      'en': 'Complete',
      'af': 'Voltooi',
      'zu': 'Qedela',
    },
    'n3dnbo6v': {
      'en': 'Completed',
      'af': 'Voltooi',
      'zu': 'Kuqediwe',
    },
    'afgqhb9l': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
  },
  // rules
  {
    'oft7p3f9': {
      'en': 'Campus Africa',
      'af': 'Kampus Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    'abzkc55j': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // chats
  {
    '25cdx1l2': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // appliances
  {
    'ibkcr8sz': {
      'en': 'Appliances',
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
    'toxrc5ck': {
      'en': 'Stove not working',
      'af': 'Stoof werk nie',
      'zu': 'Isitofu asisebenzi',
    },
    'p1qh14ew': {
      'en': 'Oven not working',
      'af': 'Oond werk nie',
      'zu': 'Ihhavini ayisebenzi',
    },
    'h2rpqdvq': {
      'en': 'Microwave not working',
      'af': 'Mikrogolf werk nie',
      'zu': 'I-microwave ayisebenzi',
    },
    'c4lwl28m': {
      'en': 'Fridge not working',
      'af': 'Yskas werk nie',
      'zu': 'Isiqandisi asisebenzi',
    },
    '9nlfy50w': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
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
    'f07habgj': {
      'en': 'NEXT',
      'af': '',
      'zu': '',
    },
    'rbcxoxon': {
      'en': 'BACK',
      'af': '',
      'zu': '',
    },
    '45sqfe6r': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    'urng33gu': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '0sz8jpa5': {
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
  // Plumbing
  {
    'jc590b1w': {
      'en': 'Plumbing',
      'af': '',
      'zu': '',
    },
    't10bkp7f': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    'a6y9hrd1': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    '2vc9ngr1': {
      'en': 'Damaged toilet sit',
      'af': 'Beskadigde toilet sit',
      'zu': 'Indlu yangasese eyonakele',
    },
    'do6oxews': {
      'en': 'Damaged basin/sink',
      'af': 'Beskadigde wasbak/wasbak',
      'zu': 'Isitsha/usinki owonakele',
    },
    '8mr0zlbr': {
      'en': 'Blocked urinal',
      'af': 'Geblokkeerde urinaal',
      'zu': 'Umchamo ovinjiwe',
    },
    '09gy5buh': {
      'en': 'Blocked toilet',
      'af': 'Geblokkeerde toilet',
      'zu': 'Indlu yangasese evinjiwe',
    },
    'i79m2u0p': {
      'en': 'Blocked shower drain',
      'af': 'Geblokkeerde stortafvoer',
      'zu': 'I-drain yeshawa evinjiwe',
    },
    '8fa9zgzp': {
      'en': 'Low water pressure',
      'af': 'Lae waterdruk',
      'zu': 'Umfutho wamanzi ophansi',
    },
    'umf56x2z': {
      'en': 'No cold water',
      'af': 'Geen koue water nie',
      'zu': 'Awekho amanzi abandayo',
    },
    'vyirhvv7': {
      'en': 'No hot water',
      'af': 'Geen warm water nie',
      'zu': 'Awekho amanzi ashisayo',
    },
    'm6jbubx3': {
      'en': 'Shower head needs to be replaced',
      'af': 'Stortkop moet vervang word',
      'zu': 'Ikhanda leshawa lidinga ukushintshwa',
    },
    'umlmwydw': {
      'en': 'Leaking gyser',
      'af': 'Lekkende gyser',
      'zu': 'I-gyser evuzayo',
    },
    'k43129b3': {
      'en': 'Burst pipes',
      'af': 'Gebarste pype',
      'zu': 'Amapayipi okuqhuma',
    },
    'ozwvoy59': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'ez4u6ntv': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'fdyas7pw': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    'kfu13ryy': {
      'en': 'Description',
      'af': '',
      'zu': '',
    },
    '5warzutq': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'uie1r7ic': {
      'en': 'NEXT',
      'af': '',
      'zu': '',
    },
    '6tfj8vrq': {
      'en': 'BACK',
      'af': '',
      'zu': '',
    },
    'up841yek': {
      'en': '3',
      'af': '',
      'zu': '',
    },
    '2cogiv1q': {
      'en': 'Upload Image (Optional)',
      'af': '',
      'zu': '',
    },
    'zptzjea0': {
      'en': 'NEXT',
      'af': '',
      'zu': '',
    },
    'n52gxogb': {
      'en': 'BACK',
      'af': '',
      'zu': '',
    },
    'sgc93anu': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    'mpuocf3e': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'raezq3qc': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '815c6q5a': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // Furniture
  {
    'cnzlsg7g': {
      'en': 'Furniture',
      'af': '',
      'zu': '',
    },
    'iag9bhkb': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    '1letphyb': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    'i24kdf9p': {
      'en': 'Damaged bed base',
      'af': 'Beskadigde bedbasis',
      'zu': 'Isisekelo sombhede sonakele',
    },
    'd7srlj4i': {
      'en': 'Damaged mattress',
      'af': 'Beskadigde matras',
      'zu': 'Umatilasi owonakele',
    },
    '9573lmce': {
      'en': 'Curtain rail needs to be replaced',
      'af': 'Gordynreling moet vervang word',
      'zu': 'I-Curtain rail idinga ukushintshwa',
    },
    '6anac6hh': {
      'en': 'Damaged study table',
      'af': 'Beskadigde studietafel',
      'zu': 'Ithebula lokufunda elilimele',
    },
    'kfdoltby': {
      'en': 'Damaged chair',
      'af': 'Beskadigde stoel',
      'zu': 'Isitulo esilimele',
    },
    '7m7gnye2': {
      'en': 'Window cannot open',
      'af': 'Venster kan nie oopmaak nie',
      'zu': 'Iwindi alikwazi ukuvuleka',
    },
    'hayz5nqq': {
      'en': 'Window cannot close',
      'af': 'Venster kan nie toemaak nie',
      'zu': 'Iwindi alikwazi ukuvala',
    },
    '2lo0v65o': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'iczhjq0u': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'vqfn8dkd': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    'sj5p7mnl': {
      'en': 'Description',
      'af': '',
      'zu': '',
    },
    'lg4nsj5r': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'm09v6b2c': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'p51osbig': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    '3nwb4z7w': {
      'en': '3',
      'af': '',
      'zu': '',
    },
    'ecd1ezgg': {
      'en': 'Upload Image (Optional)',
      'af': '',
      'zu': '',
    },
    'bdybwejx': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'qrud0g8c': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    'ucmr3r2r': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    '63fsrdrp': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '9tjiv091': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'vlan7oko': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // Electrical
  {
    'xdsj9dhk': {
      'en': 'Electrical',
      'af': '',
      'zu': '',
    },
    '9lz31hm6': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    'fb12aimr': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    'ak9hr78q': {
      'en': 'Emergency lights not working',
      'af': 'Noodligte werk nie',
      'zu': 'Izibani eziphuthumayo azisebenzi',
    },
    'fe30ff33': {
      'en': 'Loose cables',
      'af': 'Los kabels',
      'zu': 'Izintambo ezixegayo',
    },
    'mmdbsyc4': {
      'en': 'No power/electricity',
      'af': 'Geen krag/elektrisiteit',
      'zu': 'Awekho amandla/ugesi',
    },
    'a6dutujg': {
      'en': 'Faulty prepaid meter',
      'af': 'Foutiewe voorafbetaalde meter',
      'zu': 'Imitha ekhokhelwa ngaphambili enephutha',
    },
    'ydxqf8op': {
      'en': 'Lights in my room are not working',
      'af': 'Ligte in my kamer werk nie',
      'zu': 'Izibani ekamelweni lami azisebenzi',
    },
    'nfm4a6ps': {
      'en': 'Lights in my unit are not working',
      'af': 'Ligte in my eenheid werk nie',
      'zu': 'Izibani kuyunithi yami azisebenzi',
    },
    '1ihahwu0': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'bw7tu78u': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'k5f55ozg': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    'fvimu23p': {
      'en': 'Description',
      'af': '',
      'zu': '',
    },
    'metbx39k': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    '0dnexzuv': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'dpf96e62': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    'n3plhg6z': {
      'en': '3',
      'af': '',
      'zu': '',
    },
    'bvmjpwed': {
      'en': 'Upload Image (Optional)',
      'af': '',
      'zu': '',
    },
    'kgslha8a': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'g4aienfa': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    'ksm2gueo': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    '8wz69gts': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'k2zvcmm5': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'euo4611i': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // Locksmith
  {
    '1j75uhkf': {
      'en': 'Locksmith',
      'af': '',
      'zu': '',
    },
    'lfavwnje': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    'su82v2od': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    '6feqgn88': {
      'en': 'Broken door handle (unit)',
      'af': 'Gebreekte deurhandvatsel (eenheid)',
      'zu': 'Isibambo somnyango esiphukile (iyunithi)',
    },
    'r9o29omx': {
      'en': 'Broken door handle (Room)',
      'af': 'Gebreekte deurhandvatsel (kamer)',
      'zu': 'Isibambo somnyango esiphukile (Igumbi)',
    },
    'j3gxrvfc': {
      'en': 'Room key not opening',
      'af': 'Kamersleutel maak nie oop nie',
      'zu': 'Ukhiye wegumbi awuvuli',
    },
    'hlrzud1f': {
      'en': 'Unit key not opening',
      'af': 'Eenheidsleutel maak nie oop nie',
      'zu': 'Ukhiye weyunithi awuvuli',
    },
    '3dhm2b07': {
      'en': 'Lost key',
      'af': 'Sleutel verloor',
      'zu': 'Ukhiye olahlekile',
    },
    'zgpjin84': {
      'en': 'Lost access card',
      'af': 'Toegangskaart verloor',
      'zu': 'Ikhadi lokufinyelela elilahlekile',
    },
    'up7udj4q': {
      'en': 'access card not working',
      'af': 'toegangskaart werk nie',
      'zu': 'ikhadi lokufinyelela alisebenzi',
    },
    'ezmlduz1': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'jko05s52': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'eelyazxx': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    '01i1849c': {
      'en': 'Description',
      'af': '',
      'zu': '',
    },
    'x8x50fi5': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'qp22wf3d': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'kj79gvhf': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    'im5wapxi': {
      'en': '3',
      'af': '',
      'zu': '',
    },
    'b3714jqz': {
      'en': 'Upload Image (Optional)',
      'af': '',
      'zu': '',
    },
    'b1yvt1rw': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    '9x6845m4': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    'ksuamesd': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    'xayl2iiq': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'bp3e7ctv': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'th4f9hb5': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // PestControl
  {
    'ctsohp9i': {
      'en': 'Pest Control',
      'af': '',
      'zu': '',
    },
    '4d9h6gdl': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    'cyzedgny': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    'mrji6w0d': {
      'en': 'Bed bugs',
      'af': 'Bed goggas',
      'zu': 'Izimbungulu zombhede',
    },
    'y0mts8m5': {
      'en': 'Cockroaches in my room/unit',
      'af': 'Kakkerlakke in my kamer/eenheid',
      'zu': 'Amaphela egumbini/eyunithi yami',
    },
    'ummqz3se': {
      'en': 'Fumigation required',
      'af': 'Beroking vereis',
      'zu': 'Ukufuthwa kuyadingeka',
    },
    'scmqufl9': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'xb2dtomc': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    '7hix49jw': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    'iq4m7el3': {
      'en': 'Description',
      'af': '',
      'zu': '',
    },
    'nnp8rcw2': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'vyy868yq': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'pviiw42u': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    'ecv6832q': {
      'en': '3',
      'af': '',
      'zu': '',
    },
    'zu5a0xl6': {
      'en': 'Upload Image (Optional)',
      'af': '',
      'zu': '',
    },
    'xhvvti7y': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    '2d7b66qp': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    '0ab4f6ky': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    '77lx5s79': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'ys749s2v': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'n3qa8opo': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // Painting
  {
    'g0v9lpxx': {
      'en': 'Painting',
      'af': '',
      'zu': '',
    },
    'n62nxh7s': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    'wtp2npbv': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    'pr4oiy9x': {
      'en': 'Ceiling needs to be painted',
      'af': 'Die plafon moet geverf word',
      'zu': 'Uphahla ludinga ukupendwa',
    },
    '3y7iu9o0': {
      'en': 'Door frame needs to be painted',
      'af': 'Deurkosyn moet geverf word',
      'zu': 'Uhlaka lomnyango ludinga ukupendwa',
    },
    'ue5525j0': {
      'en': 'Skirting needs to be painted',
      'af': 'Plint moet geverf word',
      'zu': 'I-Skirting idinga ukupendwa',
    },
    'teczjl4u': {
      'en': 'Walls needs to be painted',
      'af': 'Mure moet geverf word',
      'zu': 'Izindonga zidinga ukupendwa',
    },
    'xfy2bhdn': {
      'en': 'Window frames needs to be painted',
      'af': 'Vensterrame moet geverf word',
      'zu': 'Amawindi ozimele adinga ukupendwa',
    },
    'mrf6ro5d': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'c1ywlkfj': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    '2jv616qo': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    'nhoh7o4r': {
      'en': 'Description',
      'af': '',
      'zu': '',
    },
    'x0bi4e7a': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    '1roi7vl4': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'hi8usp36': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    'tz1lc9ci': {
      'en': '3',
      'af': '',
      'zu': '',
    },
    'cf90wuho': {
      'en': 'Upload Image (Optional)',
      'af': '',
      'zu': '',
    },
    '5f035azs': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'chifyicf': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    '8riu3sxb': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    'pzx40sjr': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'p9bnccwn': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '9s7h1q1e': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // Others
  {
    '7b9xxwp2': {
      'en': 'Others',
      'af': '',
      'zu': '',
    },
    '51vidsdu': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    '8cj9etg9': {
      'en': 'Description',
      'af': '',
      'zu': '',
    },
    'xrq9znk8': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    '0g2k6aeu': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'rfy73g3v': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    't7kyr3qr': {
      'en': 'Upload Image (Optional)',
      'af': '',
      'zu': '',
    },
    '3sj3mqiw': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    '62ce3e0s': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    '6tkbw036': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    '3t91n54h': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'zu8ut6m1': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'nsoj6kzm': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // reviews
  {
    'o4ma2plr': {
      'en': 'Review',
      'af': 'Resensie',
      'zu': 'Buyekeza',
    },
    'odl0y290': {
      'en': 'Private Feedback',
      'af': 'Privaat terugvoer',
      'zu': 'Impendulo Eyimfihlo',
    },
    'h6wfwt01': {
      'en': 'What was your most important concern with this  ticket?',
      'af': 'Wat was jou belangrikste bekommernis met hierdie kaartjie?',
      'zu': 'Yini ebikukhathaza kakhulu ngaleli thikithi?',
    },
    'rwc60qez': {
      'en': '    Time     ',
      'af': 'Tyd',
      'zu': 'Isikhathi',
    },
    'm5pnsb3h': {
      'en': 'Convinience',
      'af': 'Gerieflikheid',
      'zu': 'Convinience',
    },
    '0ggkswrv': {
      'en': 'Cleanliness',
      'af': 'Netheid',
      'zu': 'Inhlanzeko',
    },
    'su9q3z9r': {
      'en': 'Communication',
      'af': 'Kommunikasie',
      'zu': 'Ukuxhumana',
    },
    'tqdmj591': {
      'en': 'Quality',
      'af': 'Kwaliteit',
      'zu': 'Ikhwalithi',
    },
    'gmravdzl': {
      'en': 'Option ',
      'af': 'Opsie',
      'zu': 'Inketho',
    },
    'sl49hlqg': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af': 'Wat was jou belangrikste bekommernis met hierdie kaartjie?',
      'zu': 'Yini ebikukhathaza kakhulu ngaleli thikithi?',
    },
    '82iy1uqp': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af':
          'Jou gradering is baie belangrik vir ons aangesien dit ons help om ons dienste vir die toekoms te verbeter.',
      'zu':
          'Isilinganiso sakho sibaluleke ngempela kithi njengoba sisisiza ukuthuthukisa amasevisi ethu esikhathini esizayo.',
    },
    'm1rx4wqf': {
      'en': 'Confirm',
      'af': 'Bevestig',
      'zu': 'Qinisekisa',
    },
    'v4ofqfkx': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // settings
  {
    'n9zmnk1o': {
      'en': 'Settings',
      'af': '',
      'zu': '',
    },
    'l75068ci': {
      'en': 'Account',
      'af': 'Rekening',
      'zu': 'I-akhawunti',
    },
    'nj9u6e42': {
      'en': 'Loadshedding',
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
  // home
  {
    '2koevdog': {
      'en': 'Hello World',
      'af': 'Hello Wêreld',
      'zu': 'Sawubona Mhlaba',
    },
    '0vs51h5t': {
      'en': '1',
      'af': '1',
      'zu': '1',
    },
    'pmvue1v1': {
      'en': 'Hi,',
      'af': 'Hi,',
      'zu': 'Sawubona,',
    },
    '8ih9im8a': {
      'en': ' ',
      'af': '1',
      'zu': '1',
    },
    'kio6wtr0': {
      'en': 'Appliances',
      'af': 'Toestelle',
      'zu': 'Izinto zikagesi',
    },
    '1rfe0xpc': {
      'en': 'Plumbing',
      'af': 'Loodgieterswerk',
      'zu': 'Amapayipi amanzi',
    },
    'wq0kyint': {
      'en': 'Electrical',
      'af': 'Elektries',
      'zu': 'Ezogesi',
    },
    '4oirn1hi': {
      'en': 'Painting',
      'af': 'Skildery',
      'zu': 'Ukudweba',
    },
    'gb7cjba5': {
      'en': 'Locksmith',
      'af': 'Slotmaker',
      'zu': 'Umkhandi wezikhiye',
    },
    '5apgpz66': {
      'en': 'Furniture',
      'af': 'Meubels',
      'zu': 'Ifenisha',
    },
    '88a17nqi': {
      'en': 'Communal',
      'af': 'Gemeenskaplik',
      'zu': 'Umphakathi',
    },
    'lnhucv5s': {
      'en': 'Others',
      'af': 'Ander',
      'zu': 'Abanye',
    },
  },
  // messages
  {
    'g2apk9v9': {
      'en': 'Inbox',
      'af': '',
      'zu': '',
    },
  },
  // sendNotifications
  {
    'fc8z4311': {
      'en': 'Subject',
      'af': '',
      'zu': '',
    },
    'ucbou6nm': {
      'en': 'Body',
      'af': '',
      'zu': '',
    },
    'bsc4cpul': {
      'en': 'General',
      'af': '',
      'zu': '',
    },
    'ouzqm2gc': {
      'en': 'Bookings',
      'af': '',
      'zu': '',
    },
    'lde99z2p': {
      'en': 'Announcement',
      'af': '',
      'zu': '',
    },
    'y4dnvzss': {
      'en': 'Events',
      'af': '',
      'zu': '',
    },
    'maaax0p4': {
      'en': 'Select Topic',
      'af': '',
      'zu': '',
    },
    '1orthxv6': {
      'en': 'Send to everyone',
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
    'ouy56u3e': {
      'en': '1',
      'af': '1',
      'zu': '1',
    },
    '0t9srtqf': {
      'en': 'Details',
      'af': 'Besonderhede',
      'zu': 'Imininingwane',
    },
    '311u38tb': {
      'en': 'Category',
      'af': 'Kategorie',
      'zu': 'Isigaba',
    },
    'nq1dzwbf': {
      'en': 'Status',
      'af': 'Status',
      'zu': 'Isimo',
    },
    '91tagy0g': {
      'en': 'Assigned',
      'af': 'Toegewys',
      'zu': 'Kwabelwe',
    },
    'a2kbfvsf': {
      'en': 'View Ratings',
      'af': 'Bekyk graderings',
      'zu': 'Buka Izilinganiso',
    },
    'tnem7t9x': {
      'en': 'Private Feedback',
      'af': 'Privaat terugvoer',
      'zu': 'Impendulo Eyimfihlo',
    },
    'syeofsym': {
      'en': 'What was your most important concern with this  ticket?',
      'af': 'Wat was jou belangrikste bekommernis met hierdie kaartjie?',
      'zu': 'Yini ebikukhathaza kakhulu ngaleli thikithi?',
    },
    '8oumguvt': {
      'en': 'Time',
      'af': 'Tyd',
      'zu': 'Isikhathi',
    },
    'tv6lydnw': {
      'en': 'Convinience',
      'af': 'Gerieflikheid',
      'zu': 'Convinience',
    },
    'ocqgtcv5': {
      'en': 'Cleanliness',
      'af': 'Netheid',
      'zu': 'Inhlanzeko',
    },
    'yhga0jiz': {
      'en': 'Communication',
      'af': 'Kommunikasie',
      'zu': 'Ukuxhumana',
    },
    '6gje4u7i': {
      'en': 'Quality',
      'af': 'Kwaliteit',
      'zu': 'Ikhwalithi',
    },
    'w7u0acsg': {
      'en': 'Option ',
      'af': 'Opsie',
      'zu': 'Inketho',
    },
    'pzbwczjq': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af':
          'Jou gradering is baie belangrik vir ons aangesien dit ons help om ons dienste vir die toekoms te verbeter.',
      'zu':
          'Isilinganiso sakho sibaluleke ngempela kithi njengoba sisisiza ukuthuthukisa amasevisi ethu esikhathini esizayo.',
    },
    'epp10j9k': {
      'en': 'Comments',
      'af': 'Kommentaar',
      'zu': 'Amazwana',
    },
    '8z1kpy7m': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // notifications
  {
    '45q9r5x8': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    '21r1cns5': {
      'en': '1',
      'af': '1',
      'zu': '1',
    },
    '7xadpfse': {
      'en': 'Latest',
      'af': 'Nuutste',
      'zu': 'Okwakamuva',
    },
    't43thx66': {
      'en': 'Following',
      'af': 'Volgende',
      'zu': 'Ukulandela',
    },
    '9npa5ulh': {
      'en': 'All',
      'af': 'Almal',
      'zu': 'Konke',
    },
  },
  // addInspection
  {
    'hc0sgg24': {
      'en': 'PROPERTY INSPECTION',
      'af': '',
      'zu': '',
    },
    'u740c6t1': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    'wg5xzsdu': {
      'en': 'BEDROOM',
      'af': '',
      'zu': '',
    },
    '22h154gr': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    'ph9fkpp0': {
      'en': 'BATHROOM',
      'af': '',
      'zu': '',
    },
    'aadwvt1i': {
      'en': '3',
      'af': '',
      'zu': '',
    },
    'kzdnbhgd': {
      'en': 'KITCHEN',
      'af': '',
      'zu': '',
    },
    '16l0g8hp': {
      'en': 'Issue',
      'af': '',
      'zu': '',
    },
    'k3vm8kee': {
      'en': 'INSPECT PROPERTY',
      'af': '',
      'zu': '',
    },
    'x1gr0syr': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    'yclrg9p6': {
      'en': 'WINDOWS (BEDROOM)',
      'af': '',
      'zu': '',
    },
    'nep1tnoe': {
      'en': 'Better Condition',
      'af': '',
      'zu': '',
    },
    'pahxgznc': {
      'en': 'Good Condition',
      'af': '',
      'zu': '',
    },
    'e8qhtvh9': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    '19hdumvr': {
      'en': 'Gallery',
      'af': '',
      'zu': '',
    },
    '75g7llyt': {
      'en': 'Comments',
      'af': '',
      'zu': '',
    },
    '94czi21b': {
      'en': 'Comments',
      'af': '',
      'zu': '',
    },
    'bcy603ah': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'q97u56wf': {
      'en': 'NEXT',
      'af': '',
      'zu': '',
    },
    'qbew9eyl': {
      'en': 'BACK',
      'af': '',
      'zu': '',
    },
    '1ja0gg0u': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    'dn3pcsgw': {
      'en': 'DOORS (BEDROOM)',
      'af': '',
      'zu': '',
    },
    'di1d0jbi': {
      'en': 'Better Condition',
      'af': '',
      'zu': '',
    },
    'jxnsc5zx': {
      'en': 'Good Condition',
      'af': '',
      'zu': '',
    },
    '4scg0y76': {
      'en': 'Bad Condition',
      'af': '',
      'zu': '',
    },
    'qpoiz94u': {
      'en': 'Gallery',
      'af': '',
      'zu': '',
    },
    'wfaq1knf': {
      'en': 'Comments',
      'af': '',
      'zu': '',
    },
    '6g1c4u5m': {
      'en': 'Comments',
      'af': '',
      'zu': '',
    },
    'yu6hjikz': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    '7xxpadtl': {
      'en': 'NEXT',
      'af': '',
      'zu': '',
    },
    'qs5m2p77': {
      'en': 'BACK',
      'af': '',
      'zu': '',
    },
    'eg5n5rsa': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    'j3e4neph': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'pc652j6c': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'wcislfe0': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // search
  {
    '1ehqp1x6': {
      'en': 'Contacts',
      'af': 'Soek vriende om te gesels',
      'zu': 'Sesha Abangane ukuze uxoxe',
    },
    '593y5qak': {
      'en': 'Icon',
      'af': '',
      'zu': '',
    },
    'iubu6zvf': {
      'en': 'Name',
      'af': '',
      'zu': '',
    },
    'jhhj8vn4': {
      'en': 'Building',
      'af': '',
      'zu': '',
    },
  },
  // Communal
  {
    'bwlhzqrz': {
      'en': 'Communal',
      'af': '',
      'zu': '',
    },
    'whf6k7wr': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    'ad5xvh29': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    '7x9r696z': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'cecu9o59': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'ahjjbbua': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    'mg6c7rhm': {
      'en': 'Location',
      'af': '',
      'zu': '',
    },
    'ykvekxmb': {
      'en': 'Place',
      'af': 'Plek',
      'zu': 'Indawo',
    },
    '63ydfioy': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '9oq3bi3q': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'x6nksghb': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    'xz1yi6d7': {
      'en': '3',
      'af': '',
      'zu': '',
    },
    'fmurf3ax': {
      'en': 'Upload Image (Optional)',
      'af': '',
      'zu': '',
    },
    'yp50ke9c': {
      'en': 'CONTINUE',
      'af': '',
      'zu': '',
    },
    'vukc9a0s': {
      'en': 'PREVIOUS',
      'af': '',
      'zu': '',
    },
    '2o1vcxx8': {
      'en': 'SUBMIT',
      'af': '',
      'zu': '',
    },
    '5t3v8gun': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '36wdv2i6': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '5h1aegic': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'b9cesqbq': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'dngzqonl': {
      'en': 'Home',
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
    '200ulvqn': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    'ed4ozvy3': {
      'en': 'INFO',
      'af': '',
      'zu': '',
    },
    'dcs33zv1': {
      'en': '2',
      'af': '',
      'zu': '',
    },
    '8s1luxju': {
      'en': 'CONFIRM',
      'af': '',
      'zu': '',
    },
    'o43dfb2j': {
      'en': 'Add Visitor',
      'af': '',
      'zu': '',
    },
    'qaucrpbi': {
      'en': 'Add Visitor',
      'af': '',
      'zu': '',
    },
    'soozfrtx': {
      'en': 'My Visitors',
      'af': '',
      'zu': '',
    },
    'w1v13cgb': {
      'en': 'My Visitors',
      'af': '',
      'zu': '',
    },
    '1v5yxi9e': {
      'en': '1',
      'af': '',
      'zu': '',
    },
    '0xx0fuef': {
      'en': 'Visitor\'s Information',
      'af': '',
      'zu': '',
    },
    'rwrg7zgk': {
      'en': 'Name',
      'af': '',
      'zu': '',
    },
    'ftjw4j6b': {
      'en': 'Surname',
      'af': '',
      'zu': '',
    },
    '68h9a1nr': {
      'en': 'Mobile Number',
      'af': '',
      'zu': '',
    },
    'kem2ldzv': {
      'en': 'Save Visitor',
      'af': '',
      'zu': '',
    },
    '7ohca520': {
      'en': 'Save contact for future visits',
      'af': '',
      'zu': '',
    },
    '9109iscq': {
      'en': 'Sign Below',
      'af': '',
      'zu': '',
    },
    'veqmfpf2': {
      'en': 'CLEAR SIGNATURE',
      'af': '',
      'zu': '',
    },
    'e2hpdjqj': {
      'en': 'INVITE',
      'af': '',
      'zu': '',
    },
    '3jjua61p': {
      'en': 'Image',
      'af': '',
      'zu': '',
    },
    'u7aq6yf7': {
      'en': 'Visitor',
      'af': '',
      'zu': '',
    },
    'slu3ils9': {
      'en': 'Action',
      'af': '',
      'zu': '',
    },
    'hxa4nqpi': {
      'en': 'INVITE',
      'af': '',
      'zu': '',
    },
    'wf6vx8w9': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'kdlz12o9': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '4n4s2del': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'p2g146m6': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'jqs5jbff': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'c3er6fb2': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '7wmydnot': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    '20qo61g6': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'gzdfb96v': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'ds1gxcl1': {
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
  // myVisitors
  {
    'l07pfqe0': {
      'en': 'Visitors',
      'af': '',
      'zu': '',
    },
    'cibgwe4j': {
      'en': 'RECENT VISITORS',
      'af': '',
      'zu': '',
    },
    '7i2i58a7': {
      'en': 'Image',
      'af': '',
      'zu': '',
    },
    'm7up3tfn': {
      'en': 'Visitor',
      'af': '',
      'zu': '',
    },
    'qeoctn9d': {
      'en': 'Action',
      'af': '',
      'zu': '',
    },
    'nrwwghrw': {
      'en': 'INVITE',
      'af': '',
      'zu': '',
    },
    'l8amubu5': {
      'en': 'UPCOMING VISITORS',
      'af': '',
      'zu': '',
    },
    'yipoxakw': {
      'en': 'Image',
      'af': '',
      'zu': '',
    },
    'tlimulfa': {
      'en': 'Visitor',
      'af': '',
      'zu': '',
    },
    'gq3kwenf': {
      'en': 'Action',
      'af': '',
      'zu': '',
    },
    'tpxz7ti3': {
      'en': 'CANCEL',
      'af': '',
      'zu': '',
    },
    '3lh76wqf': {
      'en': 'CHECKED-IN VISITORS',
      'af': '',
      'zu': '',
    },
    'to34x0dh': {
      'en': 'Image',
      'af': '',
      'zu': '',
    },
    'bs0pe6vv': {
      'en': 'Visitor',
      'af': '',
      'zu': '',
    },
    'ccyol0pi': {
      'en': 'Action',
      'af': '',
      'zu': '',
    },
    '7lrw2yvy': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // dashboard
  {
    'hzzki391': {
      'en': 'Pending',
      'af': '',
      'zu': '',
    },
    'tyv96zi0': {
      'en': 'Today',
      'af': '',
      'zu': '',
    },
    'nhzef5yo': {
      'en': '0',
      'af': '',
      'zu': '',
    },
    'hzoyxswg': {
      'en': '49 Jorissen',
      'af': '',
      'zu': '',
    },
    '5vh13noj': {
      'en': '80 Jorissen',
      'af': '',
      'zu': '',
    },
    'uwkywxdr': {
      'en': 'YMCA',
      'af': '',
      'zu': '',
    },
    'e5n5fz5l': {
      'en': 'Rennie House',
      'af': '',
      'zu': '',
    },
    'd4p384vz': {
      'en': ' ALL',
      'af': '',
      'zu': '',
    },
    'lb985odu': {
      'en': 'Residence',
      'af': '',
      'zu': '',
    },
    'nk4zetrl': {
      'en': 'Download CSV',
      'af': '',
      'zu': '',
    },
    'cm8gs4mk': {
      'en': 'Open Tickets',
      'af': '',
      'zu': '',
    },
    'weggynv7': {
      'en': 'In Review',
      'af': '',
      'zu': '',
    },
    'kqgsu3ac': {
      'en': 'Closed Tickets',
      'af': '',
      'zu': '',
    },
    'j5gdkyr8': {
      'en': 'Name',
      'af': '',
      'zu': '',
    },
    'a762gje1': {
      'en': 'Ticket',
      'af': '',
      'zu': '',
    },
    'obsm1oly': {
      'en': 'Description',
      'af': '',
      'zu': '',
    },
    'zm35kjqt': {
      'en': 'Room',
      'af': '',
      'zu': '',
    },
    '6zino7yi': {
      'en': 'Created_date',
      'af': '',
      'zu': '',
    },
    '4ws0f2ea': {
      'en': 'Status',
      'af': '',
      'zu': '',
    },
    'tswk8th8': {
      'en': 'Building',
      'af': '',
      'zu': '',
    },
    'fhh84s8c': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // loadshedding
  {
    'dek3wfym': {
      'en': 'Options',
      'af': '',
      'zu': '',
    },
    'vhf9e770': {
      'en': 'Date',
      'af': '',
      'zu': '',
    },
    'zk1r9vny': {
      'en': 'Stage',
      'af': '',
      'zu': '',
    },
    'ikxnucie': {
      'en': 'Edit Column 2',
      'af': '',
      'zu': '',
    },
    '7d2ojpet': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // eskomArea
  {
    '6hy3h1xk': {
      'en': 'Search for area',
      'af': '',
      'zu': '',
    },
    '59hhwh5q': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // submittedIcon
  {
    'ua7ubrzs': {
      'en': 'Success!',
      'af': 'Sukses!',
      'zu': 'Impumelelo!',
    },
    'eelep3l0': {
      'en':
          'Your ticket has been received\nby the Campus Africa maintenance\nteam.',
      'af': 'Jou versoek is deur die Campus Africa-instandhoudingspan ontvang.',
      'zu': 'Isicelo sakho sitholwe yithimba elinakekela i-Campus Africa.',
    },
    '6vhy0doc': {
      'en': 'Continue',
      'af': 'Aanhou',
      'zu': 'Qhubeka',
    },
  },
  // emptyList
  {
    'cf85lsih': {
      'en': 'No results were found.\nPlease try again :)',
      'af':
          'Geen resultate is van jou soektog gevind nie. Probeer asseblief weer.',
      'zu':
          'Ayikho imiphumela etholakele oseshweni lwakho. Ngicela uzame futhi.',
    },
  },
  // darkMode
  {
    '1ni48z6d': {
      'en': 'Light theme',
      'af': 'Ligte tema',
      'zu': 'Itimu ekhanyayo',
    },
    'lhga9n6k': {
      'en': 'Dark theme',
      'af': 'Donker tema',
      'zu': 'Itimu emnyama',
    },
    'cgkby2zl': {
      'en': 'From device settings',
      'af': 'Van toestelinstellings',
      'zu': 'Kusuka kuzilungiselelo zedivayisi',
    },
  },
  // sideNav
  {
    'x0l4kq51': {
      'en': 'Campus Africa',
      'af': 'Kampus Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    'mdh6tpe4': {
      'en': 'MENU',
      'af': 'SPYSKAART',
      'zu': 'IMENU',
    },
    'kw4npc6y': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
    'qa3se4pd': {
      'en': 'Admin Dashboard',
      'af': 'Bekyk versoeke',
      'zu': 'Buka Izicelo',
    },
    't5vq29q1': {
      'en': 'View Tickets',
      'af': 'Bekyk versoeke',
      'zu': 'Buka Izicelo',
    },
    'j8681eie': {
      'en': 'Messages',
      'af': 'Boodskappe',
      'zu': 'Imilayezo',
    },
    'ep2r2in9': {
      'en': 'ADVANCED SETTINGS',
      'af': 'GEVORDERDE INSTELLINGS',
      'zu': 'IZILUNGISELELO EZITHUTHUKILE',
    },
    'vblitw5u': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    'bls7d7dx': {
      'en': 'Manage Visitors',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    'eqk2sg1h': {
      'en': 'Add Visitors',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    'kvxrkvlp': {
      'en': 'Manage Visitors',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    'hdqqhj1s': {
      'en': 'Inspections',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    '1ifk0xp2': {
      'en': 'Users',
      'af': 'Gebruikers',
      'zu': 'Abasebenzisi',
    },
    'f638xly7': {
      'en': 'Settings',
      'af': 'Instellings',
      'zu': 'Izilungiselelo',
    },
    'hpde03g2': {
      'en': 'Logout',
      'af': 'Teken uit',
      'zu': 'Phuma',
    },
  },
  // ticket
  {
    '36k5t7bv': {
      'en': 'Dischem \nVoucher',
      'af': '',
      'zu': '',
    },
    'jpd5zrn3': {
      'en': 'Get 20 % off on all purchases',
      'af': '',
      'zu': '',
    },
    'jg01c455': {
      'en': '2X7HV4',
      'af': '',
      'zu': '',
    },
    'hdynqqno': {
      'en': 'Valid until 03/09/2022',
      'af': '',
      'zu': '',
    },
  },
  // skeletonInfo
  {
    'h7mk5f53': {
      'en': 'Time',
      'af': 'Tyd',
      'zu': 'Isikhathi',
    },
    'myqkd4g0': {
      'en': 'Convinience',
      'af': 'Gerieflikheid',
      'zu': 'Convinience',
    },
    'ccr0js2s': {
      'en': 'Cleanliness',
      'af': 'Netheid',
      'zu': 'Inhlanzeko',
    },
    'zgil29a2': {
      'en': 'Communication',
      'af': 'Kommunikasie',
      'zu': 'Ukuxhumana',
    },
    '91adx62k': {
      'en': 'Quality',
      'af': 'Kwaliteit',
      'zu': 'Ikhwalithi',
    },
    'odeegdal': {
      'en': 'Option ',
      'af': 'Opsie',
      'zu': 'Inketho',
    },
    'oge88a04': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af':
          'Jou gradering is baie belangrik vir ons aangesien dit ons help om ons dienste vir die toekoms te verbeter.',
      'zu':
          'Isilinganiso sakho sibaluleke ngempela kithi njengoba sisisiza ukuthuthukisa amasevisi ethu esikhathini esizayo.',
    },
  },
  // resetPassword
  {
    'fpmtun0a': {
      'en': 'Password Reset',
      'af': 'Sukses!',
      'zu': 'Impumelelo!',
    },
    '5xnejcaa': {
      'en':
          'If successful, a link to create a new password has been sent to your email. Please check your spam/junk folder if you can not find the email',
      'af': 'Jou versoek is deur die Campus Africa-instandhoudingspan ontvang.',
      'zu': 'Isicelo sakho sitholwe yithimba elinakekela i-Campus Africa.',
    },
    '7qg09j8y': {
      'en': 'Continue',
      'af': 'Aanhou',
      'zu': 'Qhubeka',
    },
  },
  // notificationsComponent
  {
    '5s8l0mfa': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    'cx4ukq4k': {
      'en': 'Latest',
      'af': 'Nuutste',
      'zu': 'Okwakamuva',
    },
    'w3bonag1': {
      'en': 'Following',
      'af': 'Volgende',
      'zu': 'Ukulandela',
    },
    'h935li2l': {
      'en': 'All',
      'af': 'Almal',
      'zu': 'Konke',
    },
  },
  // notifBottomSheet
  {
    'dz1ghic9': {
      'en': 'Schedule send',
      'af': '',
      'zu': '',
    },
    'uioanb3n': {
      'en': 'Discard',
      'af': '',
      'zu': '',
    },
    '02x8d75o': {
      'en': 'Cancel',
      'af': '',
      'zu': '',
    },
  },
  // addLink
  {
    'k2ycu2a4': {
      'en': 'Add link for additional information',
      'af': '',
      'zu': '',
    },
    'ceg3wrbq': {
      'en':
          'This could include the link to the social networks containing more information about the relevant post.',
      'af': '',
      'zu': '',
    },
    'igppq1yv': {
      'en': 'Paste link here',
      'af': '',
      'zu': '',
    },
    'ian8r4nd': {
      'en': 'https://campusafrica.co.za/',
      'af': '',
      'zu': '',
    },
    'zpjjymsh': {
      'en': 'https://apply.campusafrica.co.za/login',
      'af': '',
      'zu': '',
    },
    '3p6ry6ef': {
      'en': 'https://www.instagram.com/campus.africa/?hl=en',
      'af': '',
      'zu': '',
    },
    '7o8joatx': {
      'en': 'Done',
      'af': '',
      'zu': '',
    },
  },
  // codeTicket
  {
    'm12rfg4j': {
      'en': 'Valid for',
      'af': '',
      'zu': '',
    },
    'fmqifbmh': {
      'en': 'Once Off',
      'af': '',
      'zu': '',
    },
    'nxp7icp9': {
      'en': 'On 12/12/2022',
      'af': '',
      'zu': '',
    },
    'qyd2993a': {
      'en': 'Access Code',
      'af': '',
      'zu': '',
    },
    'gzlnhpk0': {
      'en': '49907',
      'af': '',
      'zu': '',
    },
  },
  // visitorConfirm
  {
    'h2l2va3v': {
      'en': 'Visitor Confirmation',
      'af': '',
      'zu': '',
    },
    'wevm7gmi': {
      'en': 'Visitor access pass for',
      'af': '',
      'zu': '',
    },
    'gz1ppdm5': {
      'en': 'Invited by',
      'af': '',
      'zu': '',
    },
    'gevo4gai': {
      'en': 'Valid for',
      'af': '',
      'zu': '',
    },
    'r65mpvl4': {
      'en': 'ONCE',
      'af': '',
      'zu': '',
    },
  },
  // emptyTickets
  {
    'p84x7nn6': {
      'en': 'No tickets were found.\nPlease try again :)',
      'af':
          'Geen resultate is van jou soektog gevind nie. Probeer asseblief weer.',
      'zu':
          'Ayikho imiphumela etholakele oseshweni lwakho. Ngicela uzame futhi.',
    },
  },
  // emptyTicketsCopy
  {
    '7o3f73y6': {
      'en': 'View not available on mobile. \nPlease use your desktop/tablet.',
      'af':
          'Geen resultate is van jou soektog gevind nie. Probeer asseblief weer.',
      'zu':
          'Ayikho imiphumela etholakele oseshweni lwakho. Ngicela uzame futhi.',
    },
  },
  // Miscellaneous
  {
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
      'en': '',
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
