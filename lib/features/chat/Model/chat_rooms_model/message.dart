class Message {
  int? key;
  int? id;
  int? chatId;
  dynamic image;
  int? customer1Id;
  String? content;
  String? contentShort;
  String? createdAt;
  dynamic readAt;

  Message({
    this.key,
    this.id,
    this.chatId,
    this.image,
    this.customer1Id,
    this.content,
    this.contentShort,
    this.createdAt,
    this.readAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        key: json['key'] as int?,
        id: json['id'] as int?,
        chatId: json['chat_id'] as int?,
        image: json['image'] as dynamic,
        customer1Id: json['customer1_id'] as int?,
        content: json['content'] as String?,
        contentShort: json['content_short'] as String?,
        createdAt: json['created_at'] as String?,
        readAt: json['read_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'id': id,
        'chat_id': chatId,
        'image': image,
        'customer1_id': customer1Id,
        'content': content,
        'content_short': contentShort,
        'created_at': createdAt,
        'read_at': readAt,
      };
}
