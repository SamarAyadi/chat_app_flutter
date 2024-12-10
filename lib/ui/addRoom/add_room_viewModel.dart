import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/data_base/my_database.dart';
import 'package:chat_app_flutter/model/room.dart';

/// Navigator interface for AddRoom feature
abstract class AddRoomNavigator extends BaseNavigator {
  void goBack(); // Allows navigation back
}

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  /// Adds a new room to the database
  void addRoom(String title, String desc, String catId) async {
    // Show a loading dialog while the room is being created
    navigator?.showLoadingDialog(message: 'Creating room...');
    try {
      // Ensure that all parameters are valid
      if (title.trim().isEmpty || desc.trim().isEmpty || catId.trim().isEmpty) {
        throw Exception('All fields are required.');
      }

      // Attempt to create a new room in the database
      var res = await MyDatabase.createRoom(
        Room(
          title: title,
          description: desc,
          catId: catId,
        ),
      );

      // Hide loading dialog and show success message
      navigator?.hideLoadingDialog();
      navigator?.showMessageDialog(
        'Room Created Successfully',
        posActionName: 'OK',
        posAction: () {
          navigator?.goBack(); // Navigate back on success
        },
        isCancelable: false,
      );
    } catch (e) {
      // Hide loading dialog and display an error message
      navigator?.hideLoadingDialog();
      navigator?.showMessageDialog(
        'Something went wrong: ${e.toString()}',
      );
    }
  }
}
