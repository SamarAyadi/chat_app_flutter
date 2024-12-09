import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/ui/addRoom/add_room_screen.dart';
import 'package:chat_app_flutter/ui/home/home_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Container(
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
                title: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0), // Add 20 pixels of top margin
                  child: Center(
                    child: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),

                  ),
                ),
              ),
          body: Container(),
            floatingActionButton: FloatingActionButton(
                onPressed: (){
               Navigator.pushNamed(context, AddRoomScreen.routeName);
                },
              backgroundColor: Colors.blue, // Blue background for the button
              child: Icon(
                Icons.add,
                color: Colors.white, // White icon color for contrast
              ),
            ) ,
          )),
    );
  }
}
