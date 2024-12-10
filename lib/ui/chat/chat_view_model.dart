

import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/data_base/my_database.dart';
import 'package:chat_app_flutter/model/message.dart';
import 'package:chat_app_flutter/model/room.dart';
import 'package:chat_app_flutter/shared_data.dart';

abstract class ChatNavigator extends BaseNavigator {
  void clearMessageText();
}

class ChatViewModel extends BaseViewModel<ChatNavigator> {
  late Room room;

  void send(String messageContent) {
    if(messageContent.trim().isEmpty) return;
    var message = Message(
      content: messageContent,
      dateTime: DateTime.now().microsecondsSinceEpoch,
      senderId: SharedData.user?.id,
      senderName: SharedData.user?.userName,
      roomId: room.id,
    );

    MyDatabase.sendMessage(room.id ?? '', message)
        .then((value) {
      // Clear the text field on the chat screen
      navigator?.clearMessageText();
    })
        .onError((error, stackTrace) {
      // Handle any error that occurs during message sending
      navigator?.showMessageDialog(
        'Error sending message: ',
        posActionName: 'try again',
       posAction: (){
      send(messageContent);
       }, negActionName: 'Cancel',
      );
    });
  }
}

