import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/localizations/clasess/constants.dart';
import 'package:ardwtalab/core/network_constants/local_constants.dart';
import 'package:ardwtalab/features/About_Us/cubit/about_us_cubit.dart';
import 'package:ardwtalab/features/AdComments/Cubit/comments_cubit.dart';
import 'package:ardwtalab/features/Change_Password/cubit/change_pass_cubit.dart';
import 'package:ardwtalab/features/Favorits/Cubit/get_favorite_cubit.dart';
import 'package:ardwtalab/features/Following/cubit/get_following_cubit.dart';
import 'package:ardwtalab/features/Login/Cubit/cubit/Login_Cubit.dart';
import 'package:ardwtalab/features/Main/Cubit/get_department/get_department_Cubit.dart';
import 'package:ardwtalab/features/Main/Cubit/home_ads/home_Ads_Cubit.dart';
import 'package:ardwtalab/features/My_Ads/cubit/my_ads_cubit.dart';
import 'package:ardwtalab/features/New_ad/new_ad_Cubit/new_ad_cubit.dart';
import 'package:ardwtalab/features/Notification/cubit/notification_cubit.dart';
import 'package:ardwtalab/features/Personal_Accont/cubit/Account_Cubit/account_cubit.dart';
import 'package:ardwtalab/features/Personal_Accont/cubit/Personal_info_Cubit/personal_info_cubit.dart';
import 'package:ardwtalab/features/Privacy/cubit/privacy_cubit.dart';
import 'package:ardwtalab/features/chat/Cubit/chat_cubit.dart';
import 'package:ardwtalab/features/contact_with_us/cubit/contact_cubit.dart';
import 'package:ardwtalab/features/details/Cubit/get_details_cubit.dart';
import 'package:ardwtalab/features/layout/cubit/cubit.dart';
import 'package:ardwtalab/features/layout/views/Home_View.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';

import 'package:ardwtalab/features/resources/theme/theme_data.dart';
import 'package:ardwtalab/features/select_lang_view.dart';
import 'package:ardwtalab/features/terms_and_Conditions/cubit/pterms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/Login/View/login_View.dart';

// 555555578
// 510001011
//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LoginCubit loginCubit = LoginCubit();
  accessToken = await loginCubit.getUserToken();

  String? savedToken = await loginCubit.getUserToken();
  Widget firstWidget =
      (savedToken != null) ? const HomeView() : const LoginView();
  print(savedToken);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    // Get the locale and set it
    getLocale().then((locale) => setLocale(locale));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        BlocProvider<HomeAdsCubit>(
          create: (context) => HomeAdsCubit()..getHomeAds(),
        ),
        BlocProvider<GetDepartmentCubit>(
          create: (context) => GetDepartmentCubit()..getdepartment(),
        ),
        BlocProvider<DetailsCubit>(
          create: (context) => DetailsCubit(" "),
        ),
        BlocProvider<CreateNewAdCubit>(
          create: (context) => CreateNewAdCubit(ImageSource.camera),
        ),
        BlocProvider<FollowingCubit>(
          create: (context) => FollowingCubit(),
        ),
        BlocProvider<FavoritesCubit>(
          create: (context) => FavoritesCubit(),
        ),
        BlocProvider<AccountCubit>(
          create: (context) => AccountCubit(),
        ),
        BlocProvider<PersonalCubit>(
          create: (context) => PersonalCubit(),
        ),
        BlocProvider<ChangePasswordCubit>(
          create: (context) => ChangePasswordCubit(),
        ),
        BlocProvider<MyAdsCubit>(
          create: (context) => MyAdsCubit(),
        ),
        BlocProvider<PrivacyCubit>(
          create: (context) => PrivacyCubit(),
        ),
        BlocProvider<TermsCubit>(
          create: (context) => TermsCubit(),
        ),
        BlocProvider<AboutUSCubit>(
          create: (context) => AboutUSCubit(),
        ),
        BlocProvider<CommentsCubit>(
          create: (context) => CommentsCubit(),
        ),
        BlocProvider<NotificationsCubit>(
          create: (context) => NotificationsCubit(),
        ),
        BlocProvider<ContactWithUsCubit>(
          create: (context) => ContactWithUsCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<ChatCubit>(
          create: (context) => ChatCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
          Locale('es'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        locale: _locale,
        home: FutureBuilder(
          future: LoginCubit().getUserToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // Check if the token is not empty
              if (snapshot.hasData && snapshot.data != null) {
                // Token is available, navigate to the home screen
                return const HomeView();
              } else {
                // Token is not available, navigate to the login screen
                return const LoginView();
              }
            } else {
              // Show a loading indicator while checking the token
              return Scaffold(
                  body: Column(
                children: const [
                  AppSizedBox.sizedH45,
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              ));
            }
          },
        ), // home: firstWidget,
      ),
    );
  }
}
