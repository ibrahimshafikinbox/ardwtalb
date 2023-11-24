// class Language {
//   // bool isSelected = false;

//   // final int id;
//   // final String flag;
//   // final String name;
//   final String languageCode;
//   final String name;
//   final String flag;
//   bool isSelected;
//   Language(
//       {
//       //required this.id,
//       required this.flag,
//       required this.name,
//       required this.languageCode,
//       this.isSelected = false});

//   static List<Language> languageList() {
//     return <Language>[
//       Language(name: 'English', flag: '🇺🇸', languageCode: 'en'),
//       Language(name: 'Arabic', flag: '🇸🇦', languageCode: 'ar'),
//       Language(name: 'Spain', flag: '🇪🇸', languageCode: 'es'),
//       // Language(  flag: 'es', id: 1, languageCode: 'es', name: 'فارسی'),
//       // Language(flag: '🇺🇸', id: 1, languageCode: 'en', name: 'English'),
//       // Language(
//       //     flag: '🇸🇦', id: 2, languageCode: 'ar', name: 'اَلْعَرَبِيَّةُ'),
//       // Language(4, "🇮🇳", "हिंदी", "hi")
//     ];
//   }
// }

// class Language {
//   final String languageCode;
//   final String name;
//   final String flag;
//   bool isSelected;

//   Language({
//     required this.flag,
//     required this.name,
//     required this.languageCode,
//     this.isSelected = false,
//   });

//   static List<Language> languageList() {
//     return <Language>[
//       Language(name: 'English', flag: '🇺🇸', languageCode: 'en'),
//       Language(name: 'Arabic', flag: '🇸🇦', languageCode: 'ar'),
//       Language(name: 'Spain', flag: '🇪🇸', languageCode: 'es'),
//     ];
//   }
// }
class Language {
  final String languageCode;
  final String name;
  final String flag;
  bool isSelected;

  Language({
    required this.flag,
    required this.name,
    required this.languageCode,
    this.isSelected = false,
  });

  static List<Language> languageList() {
    return <Language>[
      Language(name: 'English', flag: '🇺🇸', languageCode: 'en'),
      Language(name: 'Arabic', flag: '🇸🇦', languageCode: 'ar'),
      Language(name: 'Spain', flag: '🇪🇸', languageCode: 'es'),
    ];
  }

  void select() {
    for (var lang in Language.languageList()) {
      lang.isSelected = false;
    }
    this.isSelected = true;
  }
}
