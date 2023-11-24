String filterArabicText(String text) {
  final arabicCharacters = RegExp(r'[\u0600-\u06FF\s]+');
  final matches = arabicCharacters.allMatches(text);
  final arabicText = matches.map((match) => match.group(0)).join();
  return arabicText;
}
