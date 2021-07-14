import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_solution_app/model/userModel.dart';
import 'package:health_solution_app/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:badges/badges.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserProvider productProvider;
  File _pickedImage;
  PickedFile _image;
  Future<void> getImage({ImageSource source}) async {
    _image = await ImagePicker().getImage(source: source);
    if (_image != null) {
      _pickedImage = File(_image.path);
    }
  }

  //Updating image in firebase
  //
  String imageUrl;
  void _uploadImage({File image}) async {
    User user = FirebaseAuth.instance.currentUser;
    Reference storageReference =
        FirebaseStorage.instance.ref().child("UserImage/${user.uid}");
    UploadTask uploadTask = storageReference.putFile(image);
    // TaskSnapshot snapshot = await uploadTask.onComplete;
    // imageUrl  = await snapshot.ref.getDownloadURL();
  }

  Widget _buildSingleContainer(String startText, String endText) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              startText,
              style: TextStyle(fontSize: 17, color: Colors.black45),
            ),
            Text(
              endText,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTextFormField({String name}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  bool edit = false;

  Widget _buildContainerPart() {
    List<UserModel> userModel = productProvider.userModelList;
    return Column(
      children: userModel.map((e) {
        return Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSingleContainer("First Name", e.displayName),
              _buildSingleContainer("Last Name", e.lastName),
              _buildSingleContainer("Email", e.email),
              _buildSingleContainer("Matric Number", e.matricNum),
            ],
          ),
        );
      }).toList(),
    );
  }

  Future<void> myDialogBox() {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text("Pick From Camera"),
                    onTap: () {
                      getImage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text("Pick From Gallery"),
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildTextFormFiledPart() {
    List<UserModel> userModel = productProvider.userModelList;
    return Column(
      children: userModel.map((e) {
        return Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSingleTextFormField(name: e.displayName),
              _buildSingleTextFormField(name: e.email),
              _buildSingleTextFormField(name: e.lastName),
              _buildSingleTextFormField(name: e.matricNum),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        leading: edit == true
            ? IconButton(
                icon: Icon(Icons.close, color: Colors.redAccent, size: 30),
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
              )
            : IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
              ),
        backgroundColor: Colors.white,
        actions: [
          edit == false
              ? NotificationButton()
              : IconButton(
                  icon: Icon(Icons.check, size: 30, color: Color(0xff746bc9)),
                  onPressed: () {
                    _uploadImage(image: _pickedImage);
                    setState(() {
                      edit = false;
                    });
                  }),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 65,
                        backgroundImage: _pickedImage == null
                            ? AssetImage("images/avatar.jpg")
                            : FileImage(_pickedImage),
                      ),
                    ],
                  ),
                ),
                edit == true
                    ? Padding(
                        padding: const EdgeInsets.only(left: 225, top: 80),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              myDialogBox();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Icon(Icons.camera_alt,
                                  color: Color(0xff746bc9)),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 300,
                    child: edit == true
                        ? _buildTextFormFiledPart()
                        : _buildContainerPart(),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 200,
                child: edit == false
                    ? MyButton(
                        name: "Edit Profile",
                        onPressed: () {
                          setState(() {
                            edit = true;
                          });
                        },
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;
  MyButton({this.name, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
          ),
        color: Color(0xff746bc9),
        onPressed: onPressed,
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    UserProvider productProvider = Provider.of<UserProvider>(context);
    return Badge(
        position: BadgePosition(start: 25, top: 8),
        badgeContent: Text(
          productProvider.getNotificationIndex.toString(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        badgeColor: Colors.red,
        child: IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {}));
  }
}