import 'package:flutter/material.dart';

class AcceptCockies extends StatefulWidget {
  const AcceptCockies({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AcceptCockiesState createState() => _AcceptCockiesState();
}

class _AcceptCockiesState extends State<AcceptCockies> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Checkbox(
            activeColor: Colors.redAccent,
            value: rememberMe,
            onChanged: (value) {
              setState(() {
                rememberMe = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
