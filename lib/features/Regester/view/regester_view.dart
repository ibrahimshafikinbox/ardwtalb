import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/features/Login/View/Widget/Custom_Form_Field.dart';
import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/Login/View/login_View.dart';
import 'package:ardwtalab/features/Regester/widgets/accept_cockies.dart';
import 'package:ardwtalab/features/resources/images/images.dart';
import 'package:ardwtalab/features/terms_and_Conditions/View/terms.dart';

import 'package:flutter/material.dart';

class RegesterView extends StatefulWidget {
  const RegesterView({super.key});

  @override
  State<RegesterView> createState() => _RegesterViewState();
}

class _RegesterViewState extends State<RegesterView> {
  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  String? deviceToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            SizedBox(
              height: 80,
              child: Center(
                child: Image.asset(AppImages.logo),
              ),
            ),
            Center(
              child: Text(
                "اهلا بك معنا سجل الان   ",
                style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultFormField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                label: "الاسم كامل  ",
                hint: 'الاسم كامل ',
                onValidate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'مطلوب ';
                  }
                  return null;
                },
                lines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultFormField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                label: "رقم الجوال  ",
                hint: 'رقم الجوال ',
                suffixPressed: () {},
                onValidate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return '  مطلوب';
                  }
                  return null;
                },
                lines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultFormField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                label: "كلمه المرور  ",
                hint: 'كلمه المرور  ',
                // prefix: Icons.lock_outline,
                suffixPressed: () {},
                onValidate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return '  مطلوب';
                  }
                  return null;
                },
                lines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultFormField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                label: "تاكيد كلمه المرور     ",
                hint: 'تاكيد كلمه المرور     ',
                // prefix: Icons.lock_outline,
                suffixPressed: () {},
                onValidate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return '  مطلوب';
                  }
                  return null;
                },
                lines: null,
              ),
            ),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    navigateTo(context, const TermsAndConditionView());
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "الشروط  و الاحكام ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,

                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                  ),
                ),
                const Text(
                  " اوافق على كافه ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const AcceptCockies(),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
              function: () {
                navigateTo(context, const LoginView());
              },
              text: "التالى    ",
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
                child: TextButton(
              child: RichText(
                text: const TextSpan(
                  text: "الغاء  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,

                    decoration:
                        TextDecoration.underline, // Add underline decoration
                  ),
                ),
              ),
              onPressed: () {
                navigateTo(context, const LoginView());
              },
            )),
          ],
        ),
      ),
    );
  }
}
