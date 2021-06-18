import 'package:flutter/material.dart';
import 'package:health_solution_app/model/options.dart';
import 'package:health_solution_app/screens/doctors_screen.dart';
import 'package:health_solution_app/widgets/customtext.dart';

//List of all Options
List<Option> _optionList = [
  Option(
      name: "Doctors", image: "images/doctor.png", desc: "Book an Appointment"),
  Option(
      name: "Medicines", image: "images/medicine.png", desc: "5000+ medicines"),
  Option(
      name: "Lab Tests", image: "images/pills.png", desc: "Sample collection"),
  Option(
      name: "Ambulance", image: "images/ambulance.png", desc: "Ready for you"),
  Option(
      name: "Cabin",
      image: "images/blood-transfusion.png",
      desc: "Book a cabin"),
  Option(
      name: "Contact", image: "images/phone.png", desc: "For more information"),
];

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildOptionBoxes(index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => DoctorScreen()));
      },
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              child: Container(
                height: 70,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(_optionList[index].image))),
                // child: Image.asset("")
              ),
            ),
            Positioned(
              bottom: 20,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: _optionList[index].name,
                    size: 20,
                    color: Colors.black,
                    weight: FontWeight.w500,
                  ),
                  CustomText(
                      text: _optionList[index].desc,
                      size: 14,
                      color: Colors.black54),
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
                    height: 180,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "What are you looking for ?",
                          size: 28,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
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
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          mainAxisExtent: 140,
                          // childAspectRatio: 100 / 80,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _optionList.length,
                        itemBuilder: (_, index) {
                          return _buildOptionBoxes(index);
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
