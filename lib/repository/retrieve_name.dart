// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:health_solution_app/model/userModel.dart';
// // import 'package:health_solution_app/screens/sign_up.dart';

// class RetrieveName {
//   UserModel userModel;

//    List<UserModel> userModelList = [];


//   //TIHS FUTURE FUNCTION HELPS US IN GETTING USER DATA FROM FIREBASE
//   Future<void> getUserData() async {
//     List<UserModel> newList = [];
//     User currentUser = FirebaseAuth.instance.currentUser;
//     QuerySnapshot userSnapShot =
//         await FirebaseFirestore.instance.collection("User").get();
//     userSnapShot.docs.forEach(
//       (element) {
//         if (currentUser.uid == element.data()["uid"]) {
//           userModel = UserModel(
             
//               displayName: element.data()["fName"],
//               );
//           newList.add(userModel);
//         }
//         userModelList = newList;
//       },
//     );
//   }

//   List<UserModel> get getUserModelList {
//     return userModelList;
//   }
// }
