import 'package:flutter/material.dart';

class TextWIthDrobDownList extends StatelessWidget {
  final String requiredtext;
  final VoidCallback onpressed;
  const TextWIthDrobDownList({
    Key? key,
    required this.requiredtext,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        height: 50,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(requiredtext),
              const Spacer(),
              IconButton(
                onPressed: onpressed,
                icon: const Icon(
                  Icons.arrow_drop_down,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
