// class DropDownModel {
//   List<DropDownData>? data;

//   DropDownModel({this.data});

//   DropDownModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <DropDownData>[];
//       json['data'].forEach((v) {
//         data!.add(new DropDownData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class DropDownData {
//   int? key;
//   String? name;
//   List<Cities>? cities;

//   DropDownData({this.key, this.name, this.cities});

//   DropDownData.fromJson(Map<String, dynamic> json) {
//     key = json['key'];
//     name = json['name'];
//     if (json['cities'] != null) {
//       cities = <Cities>[];
//       json['cities'].forEach((v) {
//         cities!.add(Cities.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['key'] = this.key;
//     data['name'] = this.name;
//     if (this.cities != null) {
//       data['cities'] = this.cities!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Cities {
//   int? key;
//   String? name;

//   Cities({this.key, this.name});

//   Cities.fromJson(Map<String, dynamic> json) {
//     key = json['key'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['key'] = this.key;
//     data['name'] = this.name;
//     return data;
//   }
// }

class DropDownModel {
  List<DropDownData>? data;

  DropDownModel({this.data});

  factory DropDownModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      var list = json['data'] as List;
      List<DropDownData> dataList =
          list.map((i) => DropDownData.fromJson(i)).toList();
      return DropDownModel(data: dataList);
    } else {
      return DropDownModel(data: []);
    }
  }
}

class DropDownData {
  int? key;
  String? name;
  List<Cities>? cities;

  DropDownData({this.key, this.name, this.cities});

  factory DropDownData.fromJson(Map<String, dynamic> json) {
    var citiesList = json['cities'] as List;
    List<Cities> citiesData =
        citiesList.map((i) => Cities.fromJson(i)).toList();
    return DropDownData(
        key: json['key'], name: json['name'], cities: citiesData);
  }
}

class Cities {
  int? key;
  String? name;

  Cities({this.key, this.name});

  Cities.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.name;
    return data;
  }
}
