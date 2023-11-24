// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';

class AdsBuilderWidget extends StatelessWidget {
  final String image;
  final String title;
  final String createdat;
  final String city;
  final String name;

  const AdsBuilderWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.createdat,
    required this.city,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 90.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      )),
                ),
                AppSizedBox.sizedW20,
                Expanded(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyLarge,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        AppSizedBox.sizedH10,
                        Row(
                          children: [
                            const Icon(Icons.person),
                            AppSizedBox.sizedW5,
                            Text(" $name "),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            AppSizedBox.sizedW5,
                            Text(" $city "),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.timer),
                            AppSizedBox.sizedW5,
                            Text(" ${createdat.toString()} "),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
