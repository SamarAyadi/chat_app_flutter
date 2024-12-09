import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/data_base/my_database.dart';
import 'package:chat_app_flutter/model/room.dart';

abstract class HomeNavigator extends BaseNavigator {

}

class HomeViewModel extends BaseViewModel<HomeNavigator> {

  List<Room> rooms = [];


  void loadRooms()async{
    rooms = await MyDatabase.loadRooms();
  }

}
