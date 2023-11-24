import 'package:ardwtalab/core/helper/image_helper.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var boardController = PageController();
  bool isLast = false;
  bool showOnboarding = true;

  List<BoardingModel> boarding = [
    BoardingModel(
      title: ' loan without interest',
      image: AppImages.onboard1,
      body: "Lorem Ipsum is simply dummy text of "
          "the printing industry.",
    ),
    BoardingModel(
      title: ' loan without interest',
      image: AppImages.onboard2,
      body: "Lorem Ipsum is simply dummy text of "
          "the printing industry.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              if (showOnboarding)
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: boardController,
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    itemBuilder: (context, index) =>
                        buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                  ),
                ),
              // if (!showOnboarding)
              //   const Expanded(
              //     child: SelectLanguageView(),
              //   ),
              AppSizedBox.sizedH40,
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      if (isLast) {
                        setState(() {
                          showOnboarding = false;
                        });
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Text(
                      isLast ? "Finish" : "Next",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          AppSizedBox.sizedH15,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: boardController,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 10,
                  spacing: 5.0,
                ),
                count: boarding.length,
              ),
            ],
          ),
          AppSizedBox.sizedH15,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.title,
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          AppSizedBox.sizedH25,
          Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      model.body,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSizedBox.sizedH25,
        ],
      );
}

// class SelectLanguageView extends StatelessWidget {
//   const SelectLanguageView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: const [
//           AppSizedBox.sizedH35,
//           Center(
//               child: Text(
//             "Select Language",
//             style: AppTextStyle.textStyleSemiBoldRed,
//           )),
//           AppSizedBox.sizedH10,
//           Center(
//               child: Text(
//             "Select your favorite language ",
//             style: AppTextStyle.textStylePrimaryColorSemiBold,
//           )),
//           AppSizedBox.sizedH40,
//         ],
//       ),
//     );
//   }
// }
