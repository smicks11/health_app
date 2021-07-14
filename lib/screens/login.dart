import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:health_solution_app/screens/sign_up.dart';
import 'package:health_solution_app/widgets/customtext2.dart';
// import 'package:health_solution_app/widgets/loading.dart';

// import 'login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _loginScaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String email;
String matricNo;
bool isMale = true;
String password;
String userName;

class _LoginState extends State<Login> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Future<void> validation({Widget loader}) async {
      final FormState _form = _loginFormKey.currentState;

      await Firebase.initializeApp();
      if (!_form.validate()) {
        try {
          UserCredential result = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          FirebaseFirestore.instance
              .collection("Users")
              .doc(result.user.uid)
              .set({});
              
        } on PlatformException catch (e) {
          print(e.message.toString());
          // ignore: deprecated_member_use
          _loginScaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(e.message),
            ),
          );
        }
      } else {}
      return CircularProgressIndicator();
    }

    return Scaffold(
      key: _loginScaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _loginFormKey,
          child: Container(
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText2(text: "Login", size: 25, color: Colors.green),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                              print(email);
                            });
                          },
                          validator: (value) {
                            if (value == "") {
                              return "Please fill Email";
                            } else if (!regExp.hasMatch(value)) {
                              return "Email Is Invalid";
                            }
                            return "";
                          },
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 16),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: "Email Address",
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black26,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
                          // textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                              print(password);
                            });
                          },
                          obscureText: obserText,
                          validator: (value) {
                            if (value == "") {
                              return "Please FIll Password";
                            } else if (value.length < 8) {
                              return "Password is too short";
                            }
                            return "";
                          },
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 16),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                obserText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black26,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 140,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // ignore: deprecated_member_use
                            GestureDetector(
                              onTap: () {
                                validation(loader: CircularProgressIndicator());
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20)),
                                  alignment: Alignment.center,
                                  child: Text("Sign In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ))),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Have an Account?",
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx) => SignUp(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 14),
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
