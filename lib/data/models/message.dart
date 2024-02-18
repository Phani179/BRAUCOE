
class Message {
  String? message;
  DateTime timestamp;
  String senderId;
  String receiverId;
  String type;

  Message({
    required this.message,
    required this.timestamp,
    required this.senderId,
    required this.receiverId,
    required this.type,
  });
}
