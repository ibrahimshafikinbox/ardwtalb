// ignore_for_file: file_names

import 'dart:async';

import 'package:ardwtalab/features/chat/Cubit/chat_states.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:ardwtalab/features/chat/Cubit/chat_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRoomView extends StatefulWidget {
  final String userId;
  const ChatRoomView({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State createState() => ChatRoomViewState();
}

class ChatRoomViewState extends State<ChatRoomView> {
  final TextEditingController _textController = TextEditingController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    ChatCubit.get(context).getChatRomms(widget.userId);
    // timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
    //   ChatCubit.get(context).getChatRomms(widget.userId);
    // });
  }

  // @override
  // void dispose() {
  //   // Dispose of the timer when the widget is disposed
  //   timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChatCubit, ChatStates>(
        builder: (context, state) {
          if (state is GetChatRoomsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetChatRoomsSuccessState) {
            var data = ChatCubit.get(context).chatRoomsModel;
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios, // Change this to the desired icon
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Implement your custom back button behavior here
                    // navigateTo(context, const ChatView());
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  Row(
                    children: [
                      Text(
                        "${data?.customer?.name}",
                        style: AppTextStyle.textStyleWhiteSemiBold19,
                      ),
                      AppSizedBox.sizedW20,
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            NetworkImage("${data?.customer?.avatar}"),
                      ),
                      AppSizedBox.sizedW10,
                    ],
                  ),
                ],
              ),
              body: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      reverse: true,
                      itemBuilder: (context, index) {
                        var data = ChatCubit.get(context)
                            .chatRoomsModel
                            ?.messages![index];
                        return ChatMessage(
                          text: ("${data?.content}"),
                          isMe: false,
                        );
                      },
                      itemCount: ChatCubit.get(context)
                          .chatRoomsModel
                          ?.messages
                          ?.length,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: _textController,
                            decoration: const InputDecoration.collapsed(
                                hintText: "Type a message"),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              ChatCubit.get(context).sendMessageInChatRoom(
                                  id: data?.customer?.id,
                                  content: _textController.text);
                            }),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is GetChatRoomsErrorState) {
            return const Center(child: Text('Error loading chat list'));
          } else {
            return IconButton(
                onPressed: () {}, icon: const Icon(Icons.refresh));
          }
        },
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatMessage({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
