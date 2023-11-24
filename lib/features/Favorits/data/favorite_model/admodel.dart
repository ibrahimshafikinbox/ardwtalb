class Admodel {
  int? key;
  String? title;

  Admodel({this.key, this.title});

  factory Admodel.fromJson(Map<String, dynamic> json) => Admodel(
        key: json['key'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'title': title,
      };
}
