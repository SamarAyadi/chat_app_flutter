import 'package:chat_app_flutter/model/room.dart';
import 'package:chat_app_flutter/ui/chat/chat_thread.dart';
import 'package:flutter/material.dart';

class RoomWidget extends StatelessWidget {
  final Room room;

  const RoomWidget(this.room, {Key? key}) : super(key: key);

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
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 18,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ensure image asset is loaded correctly
              Image.asset(
                'assets/images/${room.catId}.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 120,
                  );
                },
              ),
              // Room Title
              Text(
                room.title ?? 'No Title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
