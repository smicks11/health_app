import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:health_solution_app/provider/userProvider.dart';
// import 'package:health_solution_app/repository/retrieve_name.dart';
import 'package:health_solution_app/screens/ambulance_screen.dart';
import 'package:health_solution_app/screens/doctors_screen.dart';
import 'package:health_solution_app/screens/drug_library.dart';
import 'package:health_solution_app/screens/laodScreen.dart';
import 'package:health_solution_app/screens/medicalCard.dart';
import 'package:health_solution_app/screens/profileScreen.dart';
// import 'package:health_solution_app/widgets/customtext.dart';
import 'package:health_solution_app/widgets/customtext2.dart';
import 'package:provider/provider.dart';
import 'package:basic_utils/basic_utils.dart';

class SecondHomePage extends StatefulWidget {
  const SecondHomePage({Key key}) : super(key: key);

  @override
  _SecondHomePageState createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
  UserProvider userProvider;
  Widget _boxes(Color color, IconData iconData, String text, String subText) {
    return Container(
        height: 160,
        // width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  iconData,
                  color: Colors.red,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText2(text: text, size: 14, color: Colors.white),
                  CustomText2(text: subText, size: 10, color: Colors.white),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    String greeting() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning';
      }
      if (hour < 17) {
        return 'Good Afternoon';
      }
      return 'Good Evening';
    }

    userProvider = Provider.of<UserProvider>(context);

    userProvider.getUserData();
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body: Consumer<UserProvider>(builder: (context, data, child) {
        return SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: data.userModelList.map((e) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => ProfileScreen()));
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                  child: Text(
                                    '${e.displayName.split("")[0][0]}',
                                    // '${e.displayName.split("")[0][0]}${e.lastName.split(" ")[1][0]}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              // Container(
                              //   height: 40,
                              //   width: 40,
                              //   child: ClipRRect(
                              //     child: Image.asset(
                              //       "images/doctor_13.jpeg",
                              //       fit: BoxFit.cover,
                              //     ),
                              //     borderRadius: BorderRadius.circular(10),
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () {
                                  ConfirmAlertBoxDark(
                                      context: context,
                                      title: "Do you want to sign out",
                                      infoMessage: "",
                                      onPressedYes: () {
                                        FirebaseAuth.instance.signOut();
                                      });
                                },
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.asset("images/menu_icon.png")),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      height: 110,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText2(
                              text: greeting(),
                              size: 28,
                              color: Colors.black87),
                          Row(
                            children: [
                              Row(
                                children: data.userModelList.map((e) {
                                  return CustomText2(
                                    text: StringUtils.capitalize(e.displayName),
                                    size: 28,
                                    color: Colors.black87,
                                    weight: FontWeight.bold,
                                  );
                                }).toList(),
                              ),
                              Container(
                                height: 30,
                                width: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("images/emoji.png"))),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300].withOpacity(0.5)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: "Search for doctor, medicine, etc",
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black38,
                                  ),
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {},
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText2(
                            text: "Book an",
                            size: 30,
                            color: Colors.black87,
                          ),
                          CustomText2(
                            text: "appointment",
                            size: 30,
                            color: Colors.black,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (ctx) => Loader(
                                                      nextScreen:
                                                          DoctorScreen(),
                                                    )));
                                      },
                                      child: _boxes(
                                          Colors.pink[400].withOpacity(0.6),
                                          Icons.medical_services,
                                          "Check doctors",
                                          "3 doctors available"))),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (ctx) => Loader(
                                                      nextScreen: DrugLibrary(),
                                                    )));
                                      },
                                      child: _boxes(
                                          Colors.blue,
                                          Icons.donut_large,
                                          "Drug Library",
                                          "Drugs available"))),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (ctx) => Loader(
                                                    nextScreen:
                                                        AmbulanceScreen(),
                                                  )));
                                    },
                                    child: _boxes(
                                        Colors.orange.withOpacity(0.7),
                                        Icons.bus_alert,
                                        "Ambulance",
                                        "Nearby"),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (ctx) => Loader(
                                                    nextScreen: MedicalCard(),
                                                  )));
                                    },
                                    child: _boxes(
                                        Colors.red[300],
                                        Icons.card_membership,
                                        "Medical card",
                                        "Access card"),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
