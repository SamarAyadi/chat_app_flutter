import 'package:chat_app_flutter/model/room.dart';
import 'package:chat_app_flutter/ui/chat/chat_thread.dart';
import 'package:flutter/material.dart';

class RoomWidget extends StatelessWidget {
  final Room room;

  RoomWidget(this.room);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ChatThread.routeName,
          arguments: room,
        );
      },

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        elevation: 18,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/${room.catId}.png',
              width:120,
              height: 120,),
      
              Text('${room.title}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
              )
      
            ],
          ),
        ),
      ),
    );
  }
}
