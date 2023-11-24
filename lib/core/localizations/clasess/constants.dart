import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// const String LAGUAGE_CODE = 'languageCode';

// //languages code
// const String ENGLISH = 'en';
// const String Spanish = 'es';
// const String ARABIC = 'ar';
// const String HINDI = 'hi';

// Future<Locale> setLocale(String languageCode) async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   await _prefs.setString(LAGUAGE_CODE, languageCode);
//   return _locale(languageCode);
// }

// Future<Locale> getLocale() async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   String languageCode = _prefs.getString(LAGUAGE_CODE) ?? ENGLISH;
//   return _locale(languageCode);
// }

// Locale _locale(String languageCode) {
//   switch (languageCode) {
//     case ENGLISH:
//       return const Locale(ENGLISH, '');
//     case Spanish:
//       return const Locale(Spanish, "");
//     case ARABIC:
//       return const Locale(ARABIC, "");
//     case HINDI:
//       return const Locale(HINDI, "");
//     default:
//       return const Locale(ENGLISH, '');
//   }
// }

// AppLocalizations translation(BuildContext context) {
//   return AppLocalizations.of(context)!;
// }
const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String SPANISH = 'es'; // Update this line
const String ARABIC = 'ar';
const String HINDI = 'hi';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case SPANISH: // Update this case
      return const Locale(SPANISH, "");
    case ARABIC:
      return const Locale(ARABIC, "");
    case HINDI:
      return const Locale(HINDI, "");
    default:
      return const Locale(ENGLISH, '');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}
