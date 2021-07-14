import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_solution_app/model/locationPrice.dart';
import 'package:health_solution_app/model/userModel.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> userModelList = [];

  UserModel userModel;

  Future<void> getUserData() async {
    List<UserModel> newUserList = [];

    User currentUser = FirebaseAuth.instance.currentUser;

    QuerySnapshot userSnapShots =
        await FirebaseFirestore.instance.collection("User").get();

    userSnapShots.docs.forEach((element) {
      if (currentUser.uid == element.get("uid")) {
        userModel = UserModel(
            uid: element.get("uid"), displayName: element.get("fName"), lastName: element.get("lName"), matricNum: element.get("matricNum"), email: element.get("email"));

        newUserList.add(userModel);
      }

      userModelList = newUserList;
    });
    notifyListeners();
  }

  List<UserModel> get getUserModelList {
    return userModelList;
  }

  //Notifications
  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }

  //Getting Location and prices

  List<LocationPrice> locationPriceList = [];

  LocationPrice locationPrice;

  Future<void> getLocationPrices() async {
    List<LocationPrice> newPriceList = [];

    QuerySnapshot locationSnapShot = await FirebaseFirestore.instance
        .collection("LocationPrices")
        .doc("aJEKsgdJ6uzkUveL7Kp7")
        .collection("LoctionPricesData")
        .get();
    locationSnapShot.docs.forEach((element) {
      locationPrice =
          LocationPrice(name: element.get("name"), price: element.get("price"));

      newPriceList.add(locationPrice);

      locationPriceList = newPriceList;
    });

    notifyListeners();
  }

  List<LocationPrice> get getLocationPriceList {
    return locationPriceList;
  }

  // List<LocationPrice> get getLocationPriceList {
  //   return locationPriceList;
  // }

  // FirebaseFirestore.instance.collection("UserOrder").where("userId", isEqualTo: currentUser.uid).get()

  notifyListeners();
}
