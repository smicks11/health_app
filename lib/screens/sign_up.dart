import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:health_solution_app/screens/homepage_2.dart';
import 'package:health_solution_app/screens/laodScreen.dart';
// import 'package:health_solution_app/screens/login.dart';
import 'package:health_solution_app/widgets/customtext2.dart';
// import 'package:health_solution_app/widgets/loading.dart';

// import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String email;
String matricNo;
bool isMale = true;
String password;
String fName;
String lName;

class _SignUpState extends State<SignUp> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    void validation() async {
      final FormState _form = _formKey.currentState;
      await Firebase.initializeApp();
      if (!_form.validate()) {
        try {
          UserCredential result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          FirebaseFirestore.instance
              .collection("User")
              .doc(result.user.uid)
              .set({
            "uid" : result.user.uid,
            "fName": fName,
            "lName" : lName,
            "matricNum": matricNo,
            "email": email,
            "password" : password
          });
          Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (ctx) => Loader(nextScreen: SecondHomePage(),)), (route) => false);
        } on PlatformException catch (e) {
          print(e.message.toString());
          // ignore: deprecated_member_use
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(e.message),
            ),
          );
        }
      } else {}
    }

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText2(
                              text: "Create new account",
                              size: 25,
                              color: Colors.green),
                          SizedBox(height: 12),
                          Text("Please Fill in the form to continue",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.green[200],
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 600,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fName = value;
                                });
                              },
                              validator: (value) {
                                if (value == "") {
                                  return "Please fill in First Name";
                                } else if (value.length > 10) {
                                  return "First Name is invalid";
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
                                labelText: "First Name",
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
                              onChanged: (value) {
                                setState(() {
                                  lName = value;
                                });
                              },
                              validator: (value) {
                                if (value == "") {
                                  return "Please fill in Last Name";
                                } else if (value.length > 10) {
                                  return "Last Name is invalid";
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
                                labelText: "Last Name",
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
                              onChanged: (value) {
                                setState(() {
                                  matricNo = value;
                                  print(matricNo);
                                });
                              },
                              validator: (value) {
                                if (value == "") {
                                  return "Please fill in Matric No";
                                } else if (value.length < 11) {
                                  return "Matric No doesn't match";
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
                                labelText: "Matric Number",
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
                                    validation();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20)),
                                    alignment: Alignment.center,
                                    child: Text("Sign Up",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            )),
                                        
                                  ),
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
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                      "Sign In",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
