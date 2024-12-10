class Message {
  static const String collectionName = 'messages';

  String? id;
  String? content;
  String? senderName;
  String? senderId;
  int? dateTime;
  String? roomId;

  Message({
    this.id,
    this.content,
    this.senderName,
    this.senderId,
    this.dateTime,
    this.roomId,
  });

  /// Converts Firestore document to `Message` object
  Message.fromFireStore(Map<String, dynamic> data)
      : id = data['id'],
        content = data['content'],
        senderName = data['senderName'],
        senderId = data['senderId'],
        dateTime = data['dateTime'],
        roomId = data['roomId'];

  /// Converts `Message` object to Firestore document
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'content': content,
      'senderName': senderName,
      'senderId': senderId,
      'dateTime': dateTime,
      'roomId': roomId,
    };
  }
}
