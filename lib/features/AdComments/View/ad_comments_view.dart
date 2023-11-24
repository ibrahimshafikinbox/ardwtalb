import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/widget/insdecator.dart';
import 'package:ardwtalab/features/AdComments/Cubit/comments_cubit.dart';
import 'package:ardwtalab/features/AdComments/Cubit/comments_state.dart';
import 'package:flutter/material.dart';

import 'package:ardwtalab/features/AdComments/Widgtes/CommentsItemBuilder.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AdCommentsView extends StatefulWidget {
  final String commentid;
  const AdCommentsView({
    Key? key,
    required this.commentid,
  }) : super(key: key);

  @override
  State<AdCommentsView> createState() => _AdCommentsViewState();
}

class _AdCommentsViewState extends State<AdCommentsView> {
  @override
  void initState() {
    super.initState();
    CommentsCubit.get(context).getAdComments(widget.commentid);
  }

  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          AppLocalizations.of(context).translate("comments"),
          style: AppTextStyle.textStyleBoldBlack,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          AppSizedBox.sizedH15,
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: const [
          //       Text(
          //         "Comments",
          //         style: AppTextStyle.textStyleBoldBlack,
          //       ),
          //     ],
          //   ),
          // ),
          BlocBuilder<CommentsCubit, CommentsState>(
            builder: (context, state) {
              if (state is GetAdCommentsLoading) {
                return const MyIndecator();
              } else if (state is GetAdCommentsSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      AppSizedBox.sizedH15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [],
                      ),
                      AppSizedBox.sizedH10,
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: CommentsCubit.get(context)
                              .commentsModel
                              ?.data
                              ?.length,
                          itemBuilder: (BuildContext context, int index) {
                            var commentData = CommentsCubit.get(context)
                                .commentsModel
                                ?.data![index];
                            DateTime dateTime =
                                DateTime.parse("${commentData?.createdAt}");
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(dateTime);

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CommentsItemBuilder(
                                profileimage:
                                    "${commentData?.customer?.avatar}",
                                datetime: formattedDate,
                                commentContent:
                                    " ${commentData?.content ?? ""}",
                                userName:
                                    " ${commentData?.customer?.name ?? ""}",
                              ),
                            );
                          }),
                      AppSizedBox.sizedH10,
                    ],
                  ),
                );
              } else if (state is GetAdCommentsError) {
                return TextButton(
                    onPressed: () {
                      CommentsCubit.get(context)
                          .getAdComments(widget.commentid);
                    },
                    child: const Text('Try again ! '));
              } else {
                return TextButton(
                    onPressed: () {
                      CommentsCubit.get(context)
                          .getAdComments(widget.commentid);
                    },
                    child: const Text('Try again ! '));
              }
            },
          ),

          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText:
                    AppLocalizations.of(context).translate("write_comment"),
                suffixIcon: IconButton(
                  onPressed: () {
                    // Call the writeComment function when the send button is pressed
                    String commentContent = _commentController.text;
                    if (commentContent.isNotEmpty) {
                      CommentsCubit.get(context).wirteComment(widget.commentid,
                          commentContent: _commentController.text);
                      // writeComment(adKey, commentContent: commentContent);
                      // Clear the text field after sending the comment
                      _commentController.clear();
                    } else {
                      // Show an error message if the comment is empty
                      showToast(
                          text: "Comment cannot be empty",
                          state: ToastStates.WARNING);
                    }
                  },
                  icon: const Icon(
                    Icons.send,
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
