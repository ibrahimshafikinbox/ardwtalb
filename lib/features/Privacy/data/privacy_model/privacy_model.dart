import 'data.dart';

class PrivacyModel {
  Data? data;

  PrivacyModel({this.data});

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
