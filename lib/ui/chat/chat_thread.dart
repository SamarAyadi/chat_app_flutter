import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/model/room.dart';
import 'package:chat_app_flutter/ui/chat/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatThread extends StatefulWidget {
  static const routeName = 'chat-thread';

  @override
  State<ChatThread> createState() => _ChatThreadState();
}

class _ChatThreadState extends BaseState<ChatThread,ChatViewModel>

implements ChatNavigator{

  @override
  ChatViewModel initViewModel() {
    return ChatViewModel();
  }
  late Room room;

  @override
  Widget build(BuildContext context) {
    room = ModalRoute.of(context)?.settings.arguments as Room;
    return ChangeNotifierProvider(
      create: (_)=>viewModel,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/background_pattern.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text('${room.title}'),
            ),
            body: Card(
              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              elevation: 18,
            color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Expanded(child: Container(
                    color: Colors.amber,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black26),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(12))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(4),
                                hintText: 'Your message here'
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 4,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue
                          ),
                          child: Row(
                            children: [
                              Text('Send',
                              style: TextStyle(
                                color: Colors.white
                              ),),
                              Icon(Icons.send, color: Colors.white)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            )
          )

      ),
    );
  }
}
