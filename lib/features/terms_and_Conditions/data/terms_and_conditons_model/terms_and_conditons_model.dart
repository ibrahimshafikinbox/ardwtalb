import 'data.dart';

class TermsAndConditonsModel {
  Data? data;

  TermsAndConditonsModel({this.data});

  factory TermsAndConditonsModel.fromJson(Map<String, dynamic> json) {
    return TermsAndConditonsModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
