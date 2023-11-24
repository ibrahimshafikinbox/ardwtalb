class Data {
  int? key;
  String? title;
  String? content;

  Data({this.key, this.title, this.content});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        key: json['key'] as int?,
        title: json['title'] as String?,
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'title': title,
        'content': content,
      };
}
