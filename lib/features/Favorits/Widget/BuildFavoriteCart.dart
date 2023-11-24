// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../resources/colors/colors.dart';
import '../../resources/styles/app_sized_box.dart';
import '../../resources/styles/app_text_style.dart';

class BuildFavoriteCart extends StatelessWidget {
  final String image;
  final String title;
  final String fullname;
  final String cityname;
  final String createdat;
  final VoidCallback addtofavoritePressed;

  const BuildFavoriteCart({
    Key? key,
    required this.image,
    required this.title,
    required this.fullname,
    required this.cityname,
    required this.createdat,
    required this.addtofavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  AppSizedBox.sizedW20,
                  Expanded(
                    child: SizedBox(
                      height: 120.0,
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
                              Text(fullname),
                              AppSizedBox.sizedW5,
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on),
                              Text(cityname),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.timer),
                              AppSizedBox.sizedW5,
                              Text(createdat),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.defaultColor,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: AppColors.defaultColor,
                      ),
                      AppSizedBox.sizedW5,
                      TextButton(
                          onPressed: addtofavoritePressed,
                          child: const Text("Remove Love",
                              style: AppTextStyle.textStyleMediumdefault)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
