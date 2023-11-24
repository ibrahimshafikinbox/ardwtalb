import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/localizations/clasess/constants.dart';
import 'package:ardwtalab/core/localizations/clasess/language.dart';
import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/Login/View/login_View.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:ardwtalab/main.dart';
import 'package:flutter/material.dart';

class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SelectLanguageViewState createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSizedBox.sizedH100,
            Center(
              child: Text(
                AppLocalizations.of(context)!.translate("select_language"),
              ),
            ),
            AppSizedBox.sizedH15,
            Center(
              child: Text(
                AppLocalizations.of(context)!
                    .translate("select_prefred_language"),
                style: AppTextStyle.textStyleSemiBoldRed,
              ),
            ),
            AppSizedBox.sizedH15,
            Expanded(
              child: ListView.builder(
                itemCount: Language.languageList().length,
                itemBuilder: (context, index) {
                  Language language = Language.languageList()[index];
                  return LanguageTile(
                    language: language,
                    onTap: () async {
                      Locale locale = await setLocale(language.languageCode);
                      // ignore: use_build_context_synchronously
                      MyApp.setLocale(context, locale);
                      setState(() {
                        for (var lang in Language.languageList()) {
                          lang.isSelected = false;
                        }
                        language.isSelected = true;
                      });
                    },
                  );
                },
              ),
            ),
            DefaultButton(
              function: () {
                navigateTo(
                  context,
                  const LoginView(),
                );
              },
              text: AppLocalizations.of(context)!.translate("submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  final Language language;
  final VoidCallback onTap;

  const LanguageTile({Key? key, required this.language, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: language.isSelected ? Colors.blue.withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              language.flag,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 16),
            Text(language.name),
            const Spacer(),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: language.isSelected ? Colors.red : Colors.white,
                border: Border.all(color: Colors.red),
              ),
              child: language.isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
