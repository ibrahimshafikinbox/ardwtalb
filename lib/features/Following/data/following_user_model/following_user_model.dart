import 'following_user_data.dart';
import 'links.dart';
import 'meta.dart';

class FollowingUserModel {
  List<FollowingUserData>? data;
  Links? links;
  Meta? meta;

  FollowingUserModel({this.data, this.links, this.meta});

  factory FollowingUserModel.fromJson(Map<String, dynamic> json) {
    return FollowingUserModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FollowingUserData.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
}
