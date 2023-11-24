import 'package:flutter/material.dart';

class MyIconWidget extends StatelessWidget {
  final IconData icon;
  final Color requiredcolor;
  final Color iconcolor;

  const MyIconWidget({
    Key? key,
    required this.icon,
    required this.iconcolor,
    required this.requiredcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: requiredcolor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: iconcolor,
        ),
      ),
    );
  }
}
