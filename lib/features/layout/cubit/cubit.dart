import 'package:ardwtalab/features/Following/view/folllowing_view.dart';
import 'package:ardwtalab/features/Main/presentation/views/Main_View.dart';
import 'package:ardwtalab/features/Personal_Accont/View/account.dart';
import 'package:ardwtalab/features/chat/Views/chat_View.dart';
import 'package:ardwtalab/features/layout/cubit/status.dart';
import 'package:ardwtalab/features/Notification/View/notificatoin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const Main_View(),
    const Following_View(),
    const NotificationsView(),
    const AccountView(),
    const ChatView()
  ];

  List<String> titles = [
    'Main',
    'Following',
    'notifacation ',
    "Messages",
    "Account",
    "Chat"
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
}
