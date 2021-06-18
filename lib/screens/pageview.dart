import 'package:flutter/material.dart';
import 'package:health_solution_app/screens/ambulance_screen.dart';
import 'package:health_solution_app/screens/homepage_2.dart';
import 'package:health_solution_app/screens/homepge.dart';

class PageViewScreen extends StatefulWidget {
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  var _selectedPageIndex;
  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _selectedPageIndex = 0;

    _pages = [
      HomePage(),
      SecondHomePage(),
      AmbulanceScreen()
    ];

    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        //The following parameter is just to prevent
        //the user from swiping to the next page.
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "",
          ),
        ],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey.shade300,
        type: BottomNavigationBarType.fixed,
        // showSelectedLabels: true,
        // showUnselectedLabels: false,
        currentIndex: _selectedPageIndex,
        onTap: (selectedPageIndex) {
          setState(() {
            _selectedPageIndex = selectedPageIndex;
            _pageController.jumpToPage(selectedPageIndex);
          });
        },
      ),
    );
  }
}
