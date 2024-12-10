import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/data_base/my_database.dart';
import 'package:chat_app_flutter/model/room.dart';

abstract class HomeNavigator extends BaseNavigator {}

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  List<Room> rooms = [];
  bool isLoading = false;

  void loadRooms() async {
    try {
      isLoading = true; // Indicate loading state
      notifyListeners(); // Notify listeners to show loading indicator

      rooms = await MyDatabase.loadRooms();

      isLoading = false; // Loading completed
      notifyListeners(); // Notify listeners to rebuild UI with updated data
    } catch (e) {
      isLoading = false;
      navigator?.showMessageDialog('Error loading rooms: $e');
      notifyListeners(); // Notify listeners to hide the loading indicator
    }
  }
}
