import 'package:flutter/material.dart';
import 'package:health_solution_app/screens/appointment_screen.dart';
import 'package:health_solution_app/widgets/customtext.dart';

class DoctorDetails extends StatelessWidget {
  final String image;
  final String name;
  final String position;
  final String content;

  const DoctorDetails(
      {Key key, this.image, this.name, this.position, this.content})
      : super(key: key);

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
                                  text: "",
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
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(bottom: 18),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: AssetImage(image),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomText(
                                      text: name,
                                      size: 20,
                                      color: Colors.black,
                                      weight: FontWeight.w600,
                                    ),
                                    CustomText(
                                      text: position,
                                      size: 14,
                                      color: Colors.black54,
                                      weight: FontWeight.w500,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.blueAccent
                                              .withOpacity(0.8),
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.blueAccent
                                              .withOpacity(0.8),
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.blueAccent
                                              .withOpacity(0.8),
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.blueAccent
                                              .withOpacity(0.8),
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.blueAccent
                                              .withOpacity(0.8),
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
                        // SizedBox(height: ,),
                        Container(
                          child: CustomText(
                            text:
                                "$name is currently a professor in the Field of Medical sciences and has saved many of live been a $position",
                            color: Colors.black54,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    child: CustomText(
                      text: "Biography",
                      size: 16,
                      color: Colors.black54,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "EDUCATION",
                              size: 12,
                              color: Colors.black45,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(height: 5),
                            CustomText(
                              text: "FCPS, MBBS, $name Specialist",
                              size: 14,
                              color: Colors.black,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "MEDICAL COLLEGE",
                              size: 12,
                              color: Colors.black45,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(height: 5),
                            CustomText(
                              text: "LASUTH Medical College and hospital",
                              size: 14,
                              color: Colors.black,
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 5),
                            CustomText(
                              text: "Lagos, Nigeria",
                              size: 12,
                              color: Colors.black45,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "CERTIFICATIONS",
                              size: 12,
                              color: Colors.black45,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(height: 5),
                            CustomText(
                              text: "Best Doctor Award 2018",
                              size: 14,
                              color: Colors.black,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 30,
                    child: CustomText(
                      text: "Reviews",
                      size: 16,
                      color: Colors.black54,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 70,
                    width: double.infinity,
                    // color: Colors.blue,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                            child: Image.asset(
                              "images/review_1.jpeg",
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Tomi Badmus",
                                size: 14,
                                color: Colors.black,
                                weight: FontWeight.w600,
                              ),
                              CustomText(
                                text:
                                    "Very friendly, I will recommend this doctor to all my friends",
                                size: 12,
                                color: Colors.black54,
                                weight: FontWeight.w500,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    size: 12,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 70,
                    width: double.infinity,
                    // color: Colors.blue,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                            child: Image.asset(
                              "images/review_2.jpeg",
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Kemi James",
                                size: 14,
                                color: Colors.black,
                                weight: FontWeight.w600,
                              ),
                              CustomText(
                                text:
                                    "He is expereinced and calm, i would recommend to all my friends and any student around",
                                size: 12,
                                color: Colors.black54,
                                weight: FontWeight.w500,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    size: 12,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Icon(Icons.messenger_outline_rounded, color: Colors.white),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => AppointmentScreen()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: CustomText(
                    text: "BOOK AN APPOINTMENT",
                    size: 17,
                    color: Colors.white,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
