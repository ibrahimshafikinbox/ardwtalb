import 'package:flutter/material.dart';

import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';

class ShowMobile extends StatelessWidget {
  final VoidCallback phoneOnPressed;
  final String requiredphone;
  const ShowMobile({
    Key? key,
    required this.phoneOnPressed,
    required this.requiredphone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: phoneOnPressed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 219, 247, 219),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            const Icon(
              Icons.phone,
              color: Colors.green,
            ),
            AppSizedBox.sizedW10,
            Text(" $requiredphone", style: const TextStyle(color: Colors.green))
          ]),
        ),
      ),
    );
  }
}
