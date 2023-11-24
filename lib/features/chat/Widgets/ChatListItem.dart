// ignore_for_file: file_names

import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget {
  final String profileImage;
  final String username;
  final String lastMessage;

  const ChatListItem({
    super.key,
    required this.profileImage,
    required this.username,
    required this.lastMessage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.grey,
        backgroundImage: NetworkImage(profileImage),
      ),
      title: Text(username),
      subtitle: Text(lastMessage),
    );
  }
}
