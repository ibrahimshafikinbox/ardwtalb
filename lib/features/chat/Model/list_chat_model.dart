class ListChatModel {
  List<ChatItem>? items; // Use a list to store multiple ChatItems

  ListChatModel({
    this.items,
  });

  ListChatModel.fromJson(List<dynamic> json) {
    // Check if the incoming json is a list
    if (json != null) {
      items = json.map((item) => ChatItem.fromJson(item)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // Convert the list of ChatItems back to a list of JSON objects
    if (items != null) {
      data['items'] = items!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}

class ChatItem {
  int? key;
  int? id;
  int? customer1Id;
  Customer1? customer1;
  Customer2? customer2;
  Customer2? otherCustomer;
  LastMessage? lastMessage;
  int? firstMessageId;
  int? unreadCount;
  String? createdAt;
  int? createdAtTimestamp;
  String? updatedAt;
  int? updatedAtTimestamp;

  ChatItem({
    this.key,
    this.id,
    this.customer1Id,
    this.customer1,
    this.customer2,
    this.otherCustomer,
    this.lastMessage,
    this.firstMessageId,
    this.unreadCount,
    this.createdAt,
    this.createdAtTimestamp,
    this.updatedAt,
    this.updatedAtTimestamp,
  });

  ChatItem.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    id = json['id'];
    customer1Id = json['customer1_id'];
    customer1 = json['customer1'] != null
        ? Customer1.fromJson(json['customer1'])
        : null;
    customer2 = json['customer2'] != null
        ? Customer2.fromJson(json['customer2'])
        : null;
    otherCustomer = json['other_customer'] != null
        ? Customer2.fromJson(json['other_customer'])
        : null;
    lastMessage = json['last_message'] != null
        ? LastMessage.fromJson(json['last_message'])
        : null;
    firstMessageId = json['first_message_id'];
    unreadCount = json['unread_count'];
    createdAt = json['created_at'];
    createdAtTimestamp = json['created_at_timestamp'];
    updatedAt = json['updated_at'];
    updatedAtTimestamp = json['updated_at_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['id'] = this.id;
    data['customer1_id'] = this.customer1Id;
    if (this.customer1 != null) {
      data['customer1'] = this.customer1!.toJson();
    }
    if (this.customer2 != null) {
      data['customer2'] = this.customer2!.toJson();
    }
    if (this.otherCustomer != null) {
      data['other_customer'] = this.otherCustomer!.toJson();
    }
    if (this.lastMessage != null) {
      data['last_message'] = this.lastMessage!.toJson();
    }
    data['first_message_id'] = this.firstMessageId;
    data['unread_count'] = this.unreadCount;
    data['created_at'] = this.createdAt;
    data['created_at_timestamp'] = this.createdAtTimestamp;
    data['updated_at'] = this.updatedAt;
    data['updated_at_timestamp'] = this.updatedAtTimestamp;
    return data;
  }
}

class Customer1 {
  int? key;
  int? id;
  String? status;
  String? sharingLink;
  bool? isFollowing;
  int? rating;
  String? name;
  String? avatar;
  String? firstName;
  String? mobile;
  String? createdAt;

  Customer1({
    this.key,
    this.id,
    this.status,
    this.sharingLink,
    this.isFollowing,
    this.rating,
    this.name,
    this.avatar,
    this.firstName,
    this.mobile,
    this.createdAt,
  });

  Customer1.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    id = json['id'];
    status = json['status'];
    sharingLink = json['sharing_link'];
    isFollowing = json['is_following'];
    rating = json['rating'];
    name = json['name'];
    avatar = json['avatar'];
    firstName = json['first_name'];
    mobile = json['mobile'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['id'] = this.id;
    data['status'] = this.status;
    data['sharing_link'] = this.sharingLink;
    data['is_following'] = this.isFollowing;
    data['rating'] = this.rating;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['first_name'] = this.firstName;
    data['mobile'] = this.mobile;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Customer2 {
  int? key;
  int? id;
  String? status;
  String? sharingLink;
  bool? isFollowing;
  String? name;
  String? avatar;
  String? firstName;
  String? mobile;
  String? createdAt;

  Customer2({
    this.key,
    this.id,
    this.status,
    this.sharingLink,
    this.isFollowing,
    this.name,
    this.avatar,
    this.firstName,
    this.mobile,
    this.createdAt,
  });

  Customer2.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    id = json['id'];
    status = json['status'];
    sharingLink = json['sharing_link'];
    isFollowing = json['is_following'];
    name = json['name'];
    avatar = json['avatar'];
    firstName = json['first_name'];
    mobile = json['mobile'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['id'] = this.id;
    data['status'] = this.status;
    data['sharing_link'] = this.sharingLink;
    data['is_following'] = this.isFollowing;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['first_name'] = this.firstName;
    data['mobile'] = this.mobile;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class LastMessage {
  int? key;
  int? id;
  int? chatId;
  Null? image;
  int? customer1Id;
  String? content;
  String? contentShort;
  String? createdAt;
  Null? readAt;

  LastMessage({
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

  LastMessage.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    id = json['id'];
    chatId = json['chat_id'];
    image = json['image'];
    customer1Id = json['customer1_id'];
    content = json['content'];
    contentShort = json['content_short'];
    createdAt = json['created_at'];
    readAt = json['read_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['id'] = this.id;
    data['chat_id'] = this.chatId;
    data['image'] = this.image;
    data['customer1_id'] = this.customer1Id;
    data['content'] = this.content;
    data['content_short'] = this.contentShort;
    data['created_at'] = this.createdAt;
    data['read_at'] = this.readAt;
    return data;
  }
}
