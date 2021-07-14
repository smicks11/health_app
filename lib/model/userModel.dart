import 'package:flutter/material.dart';

class UserModel {
  final String displayName;
  final String uid;
  final String lastName;
  final String matricNum;
  final String email;
  UserModel({this.email, 
    this.matricNum,
    this.lastName,
    @required this.uid,
    @required this.displayName,
  });
}
