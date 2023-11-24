import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/network_constants/local_constants.dart';
import 'package:ardwtalab/core/widget/icon_widget.dart';
import 'package:ardwtalab/features/Login/Cubit/cubit/Login_Cubit.dart';
import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/Login/View/login_View.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  bool showElevatedButton = false;
  void onPressedButton() {
    setState(() {
      showElevatedButton = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressedButton,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    MyIconWidget(
                      iconcolor: Colors.white,
                      icon: Icons.logout,
                      requiredcolor: AppColors.defaultColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(AppLocalizations.of(context).translate("logout"),
                        style: AppTextStyle.textStyleMediumBlack),
                    const Spacer(),
                    const Icon(
                      Icons.navigate_next,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (showElevatedButton)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white, // Background color
            ),
            onPressed: () {},
            child: Container(
              height: 200,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.translate("logout"),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.translate("confirm_exit"),
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: DefaultButton(
                          function: () {
                            LoginCubit.get(context)
                                .logout()
                                .then((value) async {
                              debugPrint(accessToken);
                              navigateAndFinish(context, const LoginView());
                            });
                          },
                          text:
                              AppLocalizations.of(context)!.translate("logout"),
                        ),
                      ),
                      // Spacer(),
                      SizedBox(
                          height: 60,
                          width: 150,
                          child: DefaultButton(
                            function: () {
                              setState(() {
                                showElevatedButton = false;
                              });
                            },
                            text:
                                AppLocalizations.of(context)!.translate("exit"),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class Settings_Item extends StatelessWidget {
  final String text;
  final IconData settingIcon;
  final VoidCallback onPressed;
  const Settings_Item({
    Key? key,
    required this.text,
    required this.settingIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 1 / 5,
        child: Row(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                settingIcon,
                color: Colors.green,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              "$text ",
              style: TextStyle(color: Colors.black, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
