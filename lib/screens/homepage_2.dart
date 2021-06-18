import 'package:flutter/material.dart';
import 'package:health_solution_app/screens/ambulance_screen.dart';
import 'package:health_solution_app/screens/doctors_screen.dart';
import 'package:health_solution_app/screens/drug_library.dart';
// import 'package:health_solution_app/widgets/customtext.dart';
import 'package:health_solution_app/widgets/customtext2.dart';

class SecondHomePage extends StatefulWidget {
  const SecondHomePage({Key key}) : super(key: key);

  @override
  _SecondHomePageState createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
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
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body: SafeArea(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                            child: Image.asset(
                              "images/doctor_13.jpeg",
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset("images/menu_icon.png")),
                      ],
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
                            text: "Good morning,",
                            size: 28,
                            color: Colors.black87),
                        Row(
                          children: [
                            CustomText2(
                              text: "Olivia",
                              size: 28,
                              color: Colors.black87,
                              weight: FontWeight.bold,
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
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  DoctorScreen()));
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) => DrugLibrary()));
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) => AmbulanceScreen()));
                                    },
                                  child: _boxes(Colors.orange.withOpacity(0.7),
                                      Icons.bus_alert, "Ambulance", "Nearby"),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: _boxes(
                                    Colors.red[300],
                                    Icons.card_membership,
                                    "Medical card",
                                    "Access card")),
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
      ),
    );
  }
}
