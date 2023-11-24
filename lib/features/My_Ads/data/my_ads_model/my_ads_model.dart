import 'datum.dart';

class MyAdsModel {
  List<MyAdsData>? data;
  // Links? links;
  // Meta? meta;

  MyAdsModel({
    this.data,
  });

  factory MyAdsModel.fromJson(Map<String, dynamic> json) => MyAdsModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => MyAdsData.fromJson(e as Map<String, dynamic>))
            .toList(),
        // links: json['links'] == null
        //     ? null
        //     : Links.fromJson(json['links'] as Map<String, dynamic>),
        // meta: json['meta'] == null
        //     ? null
        //     : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        // 'links': links?.toJson(),
        // 'meta': meta?.toJson(),
      };
}
