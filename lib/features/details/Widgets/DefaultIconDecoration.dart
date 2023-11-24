// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DefaultIconDecoration extends StatelessWidget {
  final IconData icon;
  const DefaultIconDecoration({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 241, 240, 240),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 18,
        ),
      ),
    );
  }
}

class ConatactIconDecoration extends StatelessWidget {
  final IconData requiredicon;

  const ConatactIconDecoration({
    Key? key,
    required this.requiredicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 241, 240, 240),
      ),
      child: Center(
        child: Icon(
          requiredicon,
          size: 22,
        ),
      ),
    );
  }
}
