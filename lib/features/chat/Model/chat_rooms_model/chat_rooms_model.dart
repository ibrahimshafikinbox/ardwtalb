import 'customer.dart';
import 'message.dart';

class ChatRoomsModel {
  List<Message>? messages;
  Customer? customer;

  ChatRoomsModel({this.messages, this.customer});

  factory ChatRoomsModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomsModel(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'messages': messages?.map((e) => e.toJson()).toList(),
        'customer': customer?.toJson(),
      };
}
