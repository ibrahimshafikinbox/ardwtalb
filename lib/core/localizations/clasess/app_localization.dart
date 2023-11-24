// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class AppLocalizations {
//   final Locale? locale;
//   AppLocalizations({
//     this.locale,
//   });

//   static AppLocalizations? of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations);
//   }

//   static const LocalizationsDelegate<AppLocalizations> delegate =
//       AppLocalizationsDelegate();

//   late Map<String, String> _localizedStrings;

//   Future loadJsonLanguage() async {
//     String jsonString =
//         await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");

//     Map<String, dynamic> jsonMap = json.decode(jsonString);
//     _localizedStrings = jsonMap.map((key, value) {
//       return MapEntry(key, value.toString());
//     });
//   }

//   String translate(String key) => _localizedStrings[key] ?? "";

//   load() {}
// }

// class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
//   const AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) {
//     // Updated to include 'es'
//     return ['en', 'ar', 'es'].contains(locale.languageCode);
//   }

//   @override
//   Future<AppLocalizations> load(Locale locale) async {
//     final localizations = AppLocalizations(locale: locale);
//     await localizations.load();
//     return localizations;
//   }

//   @override
//   bool shouldReload(AppLocalizationsDelegate old) => false;
// }

// // class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
// //   const AppLocalizationsDelegate();
// //   @override
// //   bool isSupported(Locale locale) {
// //     return ['en', 'ar'].contains(locale.languageCode);
// //   }

// //   @override
// //   Future<AppLocalizations> load(Locale locale) async {
// //     AppLocalizations localizations = AppLocalizations(locale: locale);
// //     await localizations.loadJsonLanguage();
// //     return localizations;
// //   }

// //   @override
// //   bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
// //       false;
// // }

// extension TranslateX on String {
//   String tr(BuildContext context) {
//     return AppLocalizations.of(context)!.translate(this);
//   }
// }
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  late Map<String, String> _localizedStrings;

  AppLocalizations(this.locale);

  Future<void> load() async {
    // Load the appropriate JSON file based on the locale
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String translate(String key) {
    return _localizedStrings[key] ??
        key; // Return the key itself if translation is not found
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
