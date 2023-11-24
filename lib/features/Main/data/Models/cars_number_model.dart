class CarsNumberModel {
  List<dynamic>? data;

  CarsNumberModel({this.data});

  factory CarsNumberModel.fromJson(Map<String, dynamic> json) {
    return CarsNumberModel(
      data: json['data'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}
