import 'package:dio/dio.dart';
import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:ardwtalab/features/Notification/cubit/notification_state.dart';
import 'package:ardwtalab/features/Notification/data/notifications_model/notifications_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit() : super(GetNotificationsInitial());
  static NotificationsCubit get(context) => BlocProvider.of(context);
  NotificationsModel? notificationsModel;
  final Dio dio = Dio();
  Future<void> getNotifications() async {
    emit(GetNotificationsLoading());
    dio.options.headers['Authorization'] = Constants.token;

    await dio
        .get("${Constants.baseUrl}${Constants.customerNotifications}")
        .then((value) {
      print(value.data);
      notificationsModel = NotificationsModel.fromJson(value.data);
      print(notificationsModel!.data!.length);
      emit(GetNotificationsSuccess());
    }).catchError((e) {
      print(e.toString());
      emit(GetNotificationsError());
    });
  }
}
