import 'links.dart';
import 'meta.dart';

class NotificationsModel {
  List<dynamic>? data;
  Links? links;
  Meta? meta;

  NotificationsModel({this.data, this.links, this.meta});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      data: json['data'] as List<dynamic>?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
}
