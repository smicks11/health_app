import 'package:flutter/material.dart';
import 'package:health_solution_app/model/time_model.dart';
import 'package:health_solution_app/widgets/customtext.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';

List<Time> _timeRange = [
  Time(timeRange: "10:00 - 11:30"),
  Time(timeRange: "12:00 - 13:00"),
  Time(timeRange: "17:00 - 18:00"),
  Time(timeRange: "19:30 - 20:30"),
  Time(timeRange: "21:00 - 22:00")
];

class AppointmentScreen extends StatefulWidget {
  final String image;
  final String name;
  final String position;
  final String content;

  const AppointmentScreen(
      {Key key, this.image, this.name, this.position, this.content})
      : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List<String> _time = ['9:00AM', '12:00PM', '3:00PM'];
  String selectedValue;
  // Widget _selectedTimeBox(index) {
  //   return GestureDetector(
  //     onTap: () {
  //                             setState(() {
  //                               selectedTime =! selectedTime;
  //                             });
  //                           },
  //     child: Container(
  //       alignment: Alignment.center,
  //       height: 45,
  //       width: MediaQuery.of(context).size.width * 0.5,
  //       color: Colors.white,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(Icons.check_circle, color: Colors.blue, size: 14),
  //           SizedBox(
  //             width: 5,
  //           ),
  //           CustomText(
  //             text: _timeRange[index].timeRange,
  //             color: Colors.blue,
  //             weight: FontWeight.w500,
  //             size: 16,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _unselectedTimeBox(index) {
  //   return GestureDetector(
  //     onTap: () {
  //                             setState(() {
  //                               selectedTime = !selectedTime;
  //                             });
  //                           },
  //     child: Container(
  //       alignment: Alignment.center,
  //       height: 45,
  //       width: MediaQuery.of(context).size.width * 0.5,
  //       color: Colors.white,
  //       child: CustomText(
  //         text: _timeRange[index].timeRange,
  //         color: Colors.black87,
  //         weight: FontWeight.w500,
  //         size: 16,
  //       ),
  //     ),
  //   );
  // }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;

  //For Time
  bool selectedTime = false;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
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
                                  text: "Appointment",
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
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: double.infinity,
                    color: Colors.white,
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay =
                              focusedDay; // update `_focusedDay` here as well
                        });
                      },
                      calendarFormat: _calendarFormat,
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                    ),
                  ),
                  SizedBox(height: 12.0),
                  DropdownButton(
                    isExpanded: true,
                    hint: Text("Select Time"),
                    value: selectedValue,
                    items: _time.map((time) {
                      return DropdownMenuItem(
                        child: new Text(time),
                        value: time,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                        print(selectedValue);
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            DarkAlertBox(
                              context: context,
                              title: "Appointment Scheduled",
                              messageText: "Stay Healthy"
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: CustomText(
                              text: "BOOK",
                              size: 20,
                              color: Colors.white,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(8),
                  //   height: 50,
                  //   child: CustomText(
                  //     text: "Choose available time",
                  //     size: 20,
                  //     color: Colors.black45,
                  //     weight: FontWeight.bold,
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       selectedTime = !selectedTime;
                  //     });
                  //   },
                  //   child: selectedTime
                  //       ? Container(
                  //           alignment: Alignment.center,
                  //           height: 45,
                  //           width: MediaQuery.of(context).size.width * 0.5,
                  //           color: Colors.white,
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Icon(Icons.check_circle,
                  //                   color: Colors.blue, size: 15),
                  //               SizedBox(
                  //                 width: 5,
                  //               ),
                  //               CustomText(
                  //                 text: "10.00 - 11:30",
                  //                 color: Colors.blue,
                  //                 weight: FontWeight.w500,
                  //                 size: 16,
                  //               ),
                  //             ],
                  //           ),
                  //         )
                  //       : Container(
                  //           alignment: Alignment.center,
                  //           height: 45,
                  //           width: MediaQuery.of(context).size.width * 0.5,
                  //           color: Colors.white,
                  //           child: CustomText(
                  //             text: "10.00 - 11:30",
                  //             color: Colors.black87,
                  //             weight: FontWeight.w500,
                  //             size: 16,
                  //           ),
                  //         ),
                  // ),
                  // Container(
                  //   height: 200,
                  //   // color: Colors.blue,
                  //   child: GridView.builder(
                  //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //         maxCrossAxisExtent: 150,
                  //         mainAxisExtent: 40,
                  //         // childAspectRatio: 100 / 80,
                  //         crossAxisSpacing: 20,
                  //         mainAxisSpacing: 20,
                  //       ),
                  //       physics: NeverScrollableScrollPhysics(),
                  //       itemCount: _timeRange.length,
                  //       itemBuilder: (_, index) {
                  //         return selectedTime
                  //             ? _selectedTimeBox(index)
                  //             : _unselectedTimeBox(index);
                  //       }),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
