// ignore_for_file: file_names

import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/features/chat/Cubit/chat_states.dart';
import 'package:ardwtalab/features/chat/Views/ChatRoomView.dart';
import 'package:ardwtalab/features/chat/Widgets/ChatListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ardwtalab/features/chat/Cubit/chat_cubit.dart';

import '../../../core/localizations/clasess/app_localization.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();
    ChatCubit.get(context).getlistUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text( AppLocalizations.of(context).translate("chats")),
        actions: [
          IconButton(
            onPressed: () {
              ChatCubit.get(context).getlistUsers();
            },
            icon: const Icon(Icons.ac_unit_sharp),
          )
        ],
      ),
      body: BlocBuilder<ChatCubit, ChatStates>(
        builder: (context, state) {
          if (state is ChatLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChatSuccessState) {
            return ListView.builder(
              itemCount: ChatCubit.get(context).chatlistModel?.items?.length,
              itemBuilder: (context, index) {
                final chatItem =
                    ChatCubit.get(context).chatlistModel?.items![index];
                final chatlastMessge = ChatCubit.get(context)
                    .chatlistModel
                    ?.items![index]
                    .lastMessage;
                return GestureDetector(
                  onTap: () {
                    navigateTo(
                        context,
                        ChatRoomView(
                          userId: "${chatItem?.customer2?.id}",
                        ));
                  },
                  child: ChatListItem(
                    profileImage: "${chatItem?.customer2?.avatar}",
                    username: "${chatItem?.customer2?.firstName}",
                    lastMessage: "${chatlastMessge?.content}",
                  ),
                );
              },
            );
          } else if (state is ChatErrorState) {
            return const Center(child: Text('Error loading chat list'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
