import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/model/room_category.dart';
import 'package:chat_app_flutter/ui/addRoom/add_room_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = 'addRoom';

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseState<AddRoomScreen, AddRoomViewModel>
implements AddRoomNavigator{

  @override
  AddRoomViewModel initViewModel() {
    return  AddRoomViewModel();
  }
  List<RoomCategory> allCats = RoomCategory.getRoomCategories();
  late RoomCategory selectedRoomCategory;
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descController = TextEditingController();
  @override
  void initState() {
    super.initState();
    selectedRoomCategory = allCats[0];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> viewModel,
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
            title: Text('AddRoom'),
          ),
          body: SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.all(24),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,



                  children: [
                    Text('Add Room',
                    textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),

                    ),
                    Image.asset('assets/images/add_room_image.png'),

                    TextFormField(
                      controller: titleController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter room title';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        labelText: 'Room Name',
                      ),
                    ),
                    DropdownButton<RoomCategory>(
                      value: selectedRoomCategory,
                      items: allCats.map((cat) {
                        return DropdownMenuItem<RoomCategory>(
                          value: cat,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/${cat.imageName}',
                                width: 40, height: 40,),
                              ),
                              Text(cat.name),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (item) {
                        if(item==null)return;
                        setState(() {
                          selectedRoomCategory = item;
                        });

                      },
                    ),

                    TextFormField(
                      controller: descController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter room description';
                        }
                        return null;
                      },

                      minLines: 3,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Room Description',
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue), // Set the button color to blue
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                      onPressed: () {
                        submit();
                      },
                      child: Text(
                        'Create',
                        style: TextStyle(color: Colors.white), // Ensure the text is readable on blue background
                      ),
                    ),



                  ],
                ),
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
  void submit(){
    if(formKey.currentState?.validate() ==false)
      return;
    viewModel.addRoom(titleController.text, descController.text, selectedRoomCategory.id);


  }

  @override
  void goBack() {
   Navigator.pop(context);
  }


}

