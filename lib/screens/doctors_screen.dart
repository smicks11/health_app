import 'package:flutter/material.dart';
import 'package:health_solution_app/model/options.dart';
import 'package:health_solution_app/screens/doctor_detail.dart';
import 'package:health_solution_app/widgets/customtext.dart';

//List of all Options
List<Option> _optionList = [
  Option(
      name: "Dr. Adeoye Williams",
      image: "images/doctor_4.jpg",
      desc: "Psychologist",
      content: "Dr Adeoye Williams is currently a professor in the Department of Psychology"),
  Option(
      name: "Dr. Yinka Jibs", image: "images/doctor_13.jpeg", desc: "Dentist", content: "Dr Yinka Jibs is a dentist with so much experience in the field"),
  Option(
      name: "Dr. Arotiba Temitayo",
      image: "images/doctor_14.jpeg",
      desc: "Cardiologist",
      content: "Dr Arotiba Temitayo is currently a professor in the Department of Cardioliogy and has served many of live been a cardiologst"),
  Option(
      name: "Dr. Okeowo Monalisa",
      image: "images/doctor_3.jpg",
      desc: "Cardiologist",
      content: "Dr Okeowo Monalisa is currently a professor in the Department of Cardiology and has served many of live been a cardiologst"
      ),
  Option(
      name: "Dr. Badejo Kudembo",
      image: "images/doctor_7.jpg",
      desc: "Dentist",
      content: "Dr Badejo Kudembo is a dentist with so much experience in the field"),
  Option(
      name: "Dr. Yemi Bakare",
      image: "images/doctor_17.jpeg",
      desc: "Optician",
      content: "Dr Yemi Badare is an optician and has lots of experience in this field"),
];

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key key}) : super(key: key);

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  Widget _buildDoctorList(index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => DoctorDetails(
              image: _optionList[index].image,
              name: _optionList[index].name,
              position: _optionList[index].desc,
              content: _optionList[index].content
            )));
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 18),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(_optionList[index].image),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: _optionList[index].name,
                    size: 20,
                    color: Colors.black,
                    weight: FontWeight.w600,
                  ),
                  CustomText(
                    text: _optionList[index].desc,
                    size: 14,
                    color: Colors.black54,
                    weight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.blueAccent.withOpacity(0.8),
                        size: 14,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blueAccent.withOpacity(0.8),
                        size: 14,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blueAccent.withOpacity(0.8),
                        size: 14,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blueAccent.withOpacity(0.8),
                        size: 14,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blueAccent.withOpacity(0.8),
                        size: 14,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Doctors",
                                  size: 30,
                                  color: Colors.black,
                                  weight: FontWeight.bold,
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            ),
                          ])),
                  Container(
                    height: 850,
                    child: ListView.builder(
                      itemCount: _optionList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return _buildDoctorList(index);
                      },
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
