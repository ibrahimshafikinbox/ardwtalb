// ignore_for_file: file_names

import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ardwtalab/core/helper/navigation_helper.dart';

import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/features/Login/Cubit/cubit/Login_Cubit.dart';
import 'package:ardwtalab/features/Login/Cubit/cubit/Login_States.dart';
import 'package:ardwtalab/features/Login/View/Widget/Custom_Form_Field.dart';
import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/Regester/view/regester_view.dart';
import 'package:ardwtalab/features/forgot_Password/presentation/view/forgot_password_view.dart';
import 'package:ardwtalab/features/layout/views/Home_View.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';

import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
//555555566

// 555555578

// 510001099
// 543216549

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is LoginError) {
          showToast(
            text: "error",
            state: ToastStates.ERROR,
          );
        }
        if (state is LoginSuccess) {
          showToast(
            text: "Success ",
            state: ToastStates.SUCCESS,
          );
          navigateAndFinish(context, const HomeView());
        } else {}
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                // AppSizedBox.sizedH40,
                Image.asset("assets/image/app_logo.png"),

                Text(
                  AppLocalizations.of(context).translate("hello_agian"),
                  style: TextStyle(
                      color: Colors.red[800],
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),

                AppSizedBox.sizedH10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: phoneController,
                    type: TextInputType.visiblePassword,
                    label: AppLocalizations.of(context)!.translate("phone"),

                    hint: '0545478848',
                    // prefix: Icons.phone,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'phone number is required ';
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
                    label: AppLocalizations.of(context)!.translate("password"),

                    hint: '********************',
                    // prefix: Icons.lock_outline,
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'password is required ';
                      }
                      return null;
                    },
                    lines: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      TextButton(
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate("forgot_pass"),
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        onPressed: () {
                          navigateTo(context, const ForgotPasswordView());
                        },
                      ),
                      // const ConfirmBox(
                      //   text: 'remmember me',
                      // ),
                    ],
                  ),
                ),
                BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition: state is! LoginLoading,
                      builder: (BuildContext context) => DefaultButton(
                        text: AppLocalizations.of(context)!.translate("login"),
                        function: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).loginUser(
                                mobile: phoneController.text,
                                pass: passwordController.text);
                          }
                        },
                      ),
                      fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.defaultColor,
                      )),
                    );
                  },
                ),

                const SizedBox(
                  height: 40,
                ),
                Center(
                    child: TextButton(
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!
                          .translate("skip_guester"),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,

                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                  ),
                  onPressed: () {
                    navigateTo(context, const HomeView());
                  },
                )),
                // AppSizedBox.sizedH40,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // AppSizedBox.sizedH100,
                    TextButton(
                      onPressed: () {
                        navigateTo(context, const RegesterView());
                      },
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate("dont_have_acc"),
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    AppSizedBox.sizedW10,
                    TextButton(
                      onPressed: () {
                        navigateTo(context, const RegesterView());
                      },
                      child: Text(
                        AppLocalizations.of(context)!.translate("create_one"),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 198, 40, 40),
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
