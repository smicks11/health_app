import 'package:flutter/material.dart';
import 'package:health_solution_app/widgets/customtext.dart';

class CompleteNotification extends StatefulWidget {
  final String price;
  const CompleteNotification({Key key, this.price}) : super(key: key);

  @override
  _CompleteNotificationState createState() => _CompleteNotificationState();
}

class _CompleteNotificationState extends State<CompleteNotification> {
  

  @override
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              height: MediaQuery.of(context).size.height * 1.0,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/emoji.png"),
                      )
                    ),
                  ),
                  CustomText(
                      text: "Order Placed!",
                      size: 30,
                      color: Colors.black),
                  SizedBox(
                    height: 20,
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),
                  
                
                ],
              ),
            )));
  }

}
