// // import 'package:dio/dio.dart';
// // import 'package:final_ard_w_talab/features/resources/styles/app_sized_box.dart';
// // import 'package:flutter/material.dart';

// // class TestFileView extends StatefulWidget {
// //   const TestFileView({super.key});

// //   @override
// //   State<TestFileView> createState() => _TestFileViewState();
// // }

// // class _TestFileViewState extends State<TestFileView> {
// //   //
// //   var adTitleArabicController = TextEditingController();
// //   var adTitleEnglishController = TextEditingController();
// //   var priceController = TextEditingController();
// //   var phoneNumberController = TextEditingController();
// //   var adContentArabicController = TextEditingController();
// //   var adContentEnglishController = TextEditingController();

// //   var formKey = GlobalKey<FormState>();
// //   DropDownModel? drobdownModel;
// //   ParentCategories? selectedSubdepartment;
// //   AppDepartmentData? selectedsepartment;

// //   Future<List<AppDepartmentData>> getRegions() async {
// //     try {
// //       final response = await Dio().get(
// //           "https://sender.fudex-tech.net/ard-w-talab/public/api/get-regions");
// //       print(response.data);
// //       DropDownModel dropDownModel = DropDownModel.fromJson(response.data);
// //       List<AppDepartmentData> regionData = dropDownModel.data ?? [];

// //       return regionData;
// //     } catch (error) {
// //       throw Exception("Failed to load regions: $error");
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // ... (existing code)
// //       body: Form(
// //         key: formKey,
// //         child: ListView(children: [
// //           Form(
// //             child: FutureBuilder<List<AppDepartmentData>>(
// //               future: getRegions(),
// //               builder: (context, snapshot) {
// //                 if (snapshot.connectionState == ConnectionState.waiting) {
// //                   return const Center(child: CircularProgressIndicator());
// //                 } else if (snapshot.hasError) {
// //                   return Text("Error: ${snapshot.error}");
// //                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //                   return const Text("No regions available.");
// //                 } else {
// //                   return Column(
// //                     children: [
// //                       DropdownButtonFormField<AppDepartmentData>(
// //                         value: selectedsepartment,
// //                         onChanged: (AppDepartmentData? newValue) {
// //                           setState(() {
// //                             selectedsepartment = newValue;
// //                             selectedSubdepartment =
// //                                 null; // Reset selectedSubdepartment when a new region is selected
// //                           });
// //                         },
// //                         items: snapshot.data!.asMap().entries.map((entry) {
// //                           int index = entry.key;
// //                           AppDepartmentData region = entry.value;
// //                           return DropdownMenuItem<AppDepartmentData>(
// //                             key: Key(
// //                                 index.toString()), // Unique key for each item
// //                             value: region,
// //                             child: Text(region.name ?? ""),
// //                           );
// //                         }).toList(),
// //                         decoration: const InputDecoration(
// //                           labelText: 'Select Region',
// //                           border: OutlineInputBorder(),
// //                         ),
// //                       ),

// //                       ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// //                       if (selectedsepartment != null) AppSizedBox.sizedH15,
// //                       AppSizedBox.sizedH15,
// //                       DropdownButtonFormField<ParentCategories>(
// //                         value: selectedSubdepartment,
// //                         onChanged: (ParentCategories? newValue) {
// //                           setState(() {
// //                             selectedSubdepartment = newValue;
// //                           });
// //                         },
// //                         items: (selectedsepartment?.ParentCategories ?? [])
// //                             .asMap()
// //                             .entries
// //                             .map((entry) {
// //                           int index = entry.key;
// //                           ParentCategories city = entry.value;
// //                           return DropdownMenuItem<ParentCategories>(
// //                             key: Key(
// //                                 index.toString()), // Unique key for each item
// //                             value: city,
// //                             child: Text(city.name ?? ""),
// //                           );
// //                         }).toList(),
// //                         decoration: const InputDecoration(
// //                           labelText: 'Select City',
// //                           border: OutlineInputBorder(),
// //                         ),
// //                       ),
// //                     ],
// //                   );
// //                 }
// //               },
// //             ),
// //           )
// //         ]),
// //       ),
// //     );
// //   }
// // }

// import 'package:dio/dio.dart';
// import 'package:final_ard_w_talab/features/New_ad/Models/app_departments_Model.dart';
// import 'package:final_ard_w_talab/features/New_ad/Models/region_model.dart';
// import 'package:final_ard_w_talab/features/New_ad/new_ad_Cubit/new_ad_cubit.dart';
// import 'package:final_ard_w_talab/features/resources/styles/app_sized_box.dart';
// import 'package:flutter/material.dart';

// class TestFileView extends StatefulWidget {
//   const TestFileView({Key? key}) : super(key: key);

//   @override
//   State<TestFileView> createState() => _TestFileViewState();
// }

// class _TestFileViewState extends State<TestFileView> {
//   List<AppDepartmentData>? departs;
//   AppDepartmentData? selectedsepartment;
//   ParentCategories? selectedSubdepartment;

//   @override
//   void initState() {
//     super.initState();
//     // Call the getRegions method and update the dropdown items in initState
//     CreateNewAdCubit.get(context).getAppDepartment().then((data) {
//       setState(() {
//         departs = data;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         child: ListView(
//           children: [
//             // Your other form fields and widgets go here

//             DropdownButtonFormField<AppDepartmentData>(
//               value: selectedsepartment,
//               onChanged: (AppDepartmentData? newValue) {
//                 setState(() {
//                   selectedsepartment = newValue;
//                   selectedSubdepartment = null;
//                 });
//               },
//               items: departs?.map((region) {
//                 return DropdownMenuItem<AppDepartmentData>(
//                   value: region,
//                   child: Text(region.title ?? ""),
//                 );
//               }).toList(),
//               decoration: const InputDecoration(
//                 labelText: 'Select Region',
//                 border: OutlineInputBorder(),
//               ),
//             ),

//             AppSizedBox.sizedH10,
//             // Dropdown for ParentCategories can be implemented in a similar way
//             DropdownButtonFormField<ParentCategories>(
//               value: selectedSubdepartment,
//               onChanged: (ParentCategories? newValue) {
//                 setState(() {
//                   selectedSubdepartment = newValue;
//                 });
//               },
//               items: (selectedsepartment?.parentCategories ?? [])
//                   .asMap()
//                   .entries
//                   .map((entry) {
//                 int index = entry.key;
//                 ParentCategories city = entry.value;
//                 return DropdownMenuItem<ParentCategories>(
//                   key: Key(index.toString()), // Unique key for each item
//                   value: city,
//                   child: Text(city.title ?? ""),
//                 );
//               }).toList(),
//               decoration: const InputDecoration(
//                 labelText: 'Select City',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
