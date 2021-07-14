import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_solution_app/model/userModel.dart';

class DataBase {
  final String uid;

  DataBase({this.uid});
  final CollectionReference nameCollection =
      FirebaseFirestore.instance.collection('User');

  //userData from snapShot
  UserModel _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(uid: uid, displayName: snapshot.get("fName"));
  }

  //Get user doc Stream
  Stream<UserModel> get userData {
    return nameCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
