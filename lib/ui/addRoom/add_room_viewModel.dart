

import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/data_base/my_database.dart';
import 'package:chat_app_flutter/model/room.dart';

abstract class AddRoomNavigator extends BaseNavigator {
  void goBack();
}

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  void addRoom(String title, String desc, String catId) async {
    navigator?.showLoadingDialog(message: 'Creating room...');
    try {
      var res = await MyDatabase.createRoom(
        Room(
          title: title,
          description: desc,
          catId: catId,
        ),
      );
      navigator?.hideLoadingDialog();
      navigator?.showMessageDialog('Room Created Successfully',
      posActionName: 'ok',
      posAction: (){
        navigator?.goBack();
      },
      isCancelable: false);
    } catch (e) {
      navigator?.hideLoadingDialog();
      navigator?.showMessageDialog('Something went wrong: ${e.toString()}');
    }
  }

}
