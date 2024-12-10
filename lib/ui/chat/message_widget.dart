import 'package:chat_app_flutter/model/message.dart';
import 'package:chat_app_flutter/shared_data.dart';
import 'package:chat_app_flutter/utils.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  Message message;
  MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return message.senderId
        == SharedData.user?.id?
        SentMessage(message.content!, message.dateTime!)
        : RecievedMessage(message.senderName!, message.content!, message.dateTime!);
  }
}

class SentMessage extends StatelessWidget {
  int dateTime;
  String content;
  SentMessage(this.content, this.dateTime);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
              bottomLeft: Radius.circular(24)
            )
          ) ,
          child: Text(content, style:
          TextStyle(
            color: Colors.white
          )),

        ),
       Text('${formatMessageDate(dateTime)}'),
      ],
    );
  }
}

class RecievedMessage extends StatelessWidget {
  String senderName;
  int dateTime;
  String content;
  RecievedMessage(this.senderName, this.content, this.dateTime);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(senderName),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24)
              )
          ) ,
          child: Text(content,
          style: TextStyle(
            color: Color(0xFF787993)
          )),

        ),
        Text('${formatMessageDate(dateTime)}'),
      ],
    );
  }
}
