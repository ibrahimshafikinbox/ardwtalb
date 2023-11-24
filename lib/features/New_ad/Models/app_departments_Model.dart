class AppDepartmentsModel {
  List<AppDepartmentData>? data;

  AppDepartmentsModel({this.data});

  AppDepartmentsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AppDepartmentData>[];
      json['data'].forEach((v) {
        data!.add(AppDepartmentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppDepartmentData {
  int? key;
  String? title;
  List<ParentCategories>? parentCategories;

  AppDepartmentData({this.key, this.title, this.parentCategories});

  AppDepartmentData.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    if (json['parent_categories'] != null) {
      parentCategories = <ParentCategories>[];
      json['parent_categories'].forEach((v) {
        parentCategories!.add(ParentCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    if (this.parentCategories != null) {
      data['parent_categories'] =
          this.parentCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParentCategories {
  int? key;
  String? title;
  List<SubCategories>? subCategories;

  ParentCategories({this.key, this.title, this.subCategories});

  ParentCategories.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? key;
  String? title;
  List<Admodels>? admodels;

  SubCategories({this.key, this.title, this.admodels});

  SubCategories.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    if (json['admodels'] != null) {
      admodels = <Admodels>[];
      json['admodels'].forEach((v) {
        admodels!.add(new Admodels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    if (this.admodels != null) {
      data['admodels'] = this.admodels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Admodels {
  int? key;
  String? title;

  Admodels({this.key, this.title});

  Admodels.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    return data;
  }
}
