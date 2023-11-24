// import 'package:flutter/material.dart';

// class DropdownWidget extends StatelessWidget {
//   final String selectedItem;
//   final List<String> dropdownItems;
//   final ValueChanged<String> onChanged;

//   DropdownWidget({
//     required this.selectedItem,
//     required this.dropdownItems,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       value: selectedItem,
//       items: dropdownItems.map((String item) {
//         return DropdownMenuItem(
//           value: item,
//           child: Text(item),
//         );
//       }).toList(),
//       onChanged: onChanged,
//     );
//   }
// }
