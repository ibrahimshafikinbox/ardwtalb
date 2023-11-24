import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/widget/insdecator.dart';
import 'package:ardwtalab/features/Notification/cubit/notification_cubit.dart';
import 'package:ardwtalab/features/Notification/cubit/notification_state.dart';
import 'package:ardwtalab/features/Notification/widgets/Notification_Build_item.dart';
import 'package:ardwtalab/features/Notification/widgets/empty_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  void initState() {
    super.initState();
    NotificationsCubit.get(context).getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    // var now = DateTime.now;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("notification")),
        centerTitle: false,
      ),
      body: Column(
        children: [
          BlocBuilder<NotificationsCubit, NotificationsStates>(
            builder: (context, state) {
              if (state is GetNotificationsLoading) {
                return const MyIndecator();
              } else if (state is GetNotificationsSuccess) {
                return Column(
                  children: [
                    NotificationsCubit.get(context)
                                .notificationsModel
                                ?.data
                                ?.isNotEmpty ==
                            true
                        ? Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 12,
                                itemBuilder: (BuildContext context, int index) {
                                  return const NotificationBuildItem();
                                }),
                          )
                        : const EmptyNotification(),
                  ],
                );
              } else if (state is GetNotificationsError) {
                return const Text('Error occurred');
              } else {
                return const Text('Initial state');
              }
            },
          ),
        ],
      ),
    );
  }
}
