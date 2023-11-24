class Ad {
  int? key;
  String? status;
  String? statusKey;
  String? title;
  String? sharingLink;
  String? content;
  String? image;
  String? adType;
  DateTime? createdAt;

  Ad({
    this.key,
    this.status,
    this.statusKey,
    this.title,
    this.sharingLink,
    this.content,
    this.image,
    this.adType,
    this.createdAt,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        key: json['key'] as int?,
        status: json['status'] as String?,
        statusKey: json['status_key'] as String?,
        title: json['title'] as String?,
        sharingLink: json['sharing_link'] as String?,
        content: json['content'] as String?,
        image: json['image'] as String?,
        adType: json['ad_type'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'status': status,
        'status_key': statusKey,
        'title': title,
        'sharing_link': sharingLink,
        'content': content,
        'image': image,
        'ad_type': adType,
        'created_at': createdAt?.toIso8601String(),
      };
}
