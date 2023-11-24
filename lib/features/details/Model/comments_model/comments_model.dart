import 'datum.dart';
import 'links.dart';
import 'meta.dart';

class CommentsModel {
  List<CommentsData>? data;
  Links? links;
  Meta? meta;

  CommentsModel({this.data, this.links, this.meta});

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CommentsData.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
}
