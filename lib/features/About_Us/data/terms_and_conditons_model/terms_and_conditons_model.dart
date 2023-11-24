import 'data.dart';

class AboutUsModel {
  Data? data;

  AboutUsModel({this.data});

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
