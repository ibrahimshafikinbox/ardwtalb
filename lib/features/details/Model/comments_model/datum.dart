import 'ad.dart';
import 'customer.dart';

class CommentsData {
  int? key;
  DateTime? createdAt;
  String? content;
  Customer? customer;
  Ad? ad;
  int? repliesCount;

  CommentsData({
    this.key,
    this.createdAt,
    this.content,
    this.customer,
    this.ad,
    this.repliesCount,
  });

  factory CommentsData.fromJson(Map<String, dynamic> json) => CommentsData(
        key: json['key'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        content: json['content'] as String?,
        customer: json['customer'] == null
            ? null
            : Customer.fromJson(json['customer'] as Map<String, dynamic>),
        ad: json['ad'] == null
            ? null
            : Ad.fromJson(json['ad'] as Map<String, dynamic>),
        repliesCount: json['replies_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'created_at': createdAt?.toIso8601String(),
        'content': content,
        'customer': customer?.toJson(),
        'ad': ad?.toJson(),
        'replies_count': repliesCount,
      };
}
