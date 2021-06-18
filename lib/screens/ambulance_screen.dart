import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_solution_app/model/directions_model.dart';
import 'package:health_solution_app/repository/directions_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:health_solution_app/widgets/customtext2.dart';
import 'package:health_solution_app/widgets/divider.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({Key key}) : super(key: key);

  @override
  _AmbulanceScreenState createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  //Getting User Location
  Position currentPosition;
  var geoLocator = Geolocator();

  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Directions _info;

  double bottomPaddingOfMap = 0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    //Get latitude and longtitude
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 14);

    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Get an Ambulance'),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _origin.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('ORIGIN'),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _destination.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('DEST'),
            )
        ],
      ),
      drawer: Container(
        color: Colors.white,
        width: 255.0,
        child: Drawer(
          child: ListView(
            children: [
              //Drawer Header
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Image.asset(
                        "images/doctor_3.jpg",
                        height: 65.0,
                        width: 65.0,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText2(
                              text: "Kemi Babs", size: 16, color: Colors.black),
                          SizedBox(
                            height: 6,
                          ),
                          CustomText2(
                              text: "Visit Profile",
                              size: 16,
                              color: Colors.black)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              DividerWidget(),

              SizedBox(
                height: 12.0,
              ),

              //Drawer Body
              ListTile(
                leading: Icon(Icons.history),
                title: CustomText2(
                  text: "History",
                  size: 15,
                  color: Colors.black,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: CustomText2(
                  text: "Visit profile",
                  size: 15,
                  color: Colors.black,
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: CustomText2(
                  text: "About",
                  size: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) {
              _googleMapController = controller;

              setState(() {
                bottomPaddingOfMap = 300.0;
              });
              locatePosition();
            },
            markers: {
              if (_origin != null) _origin,
              if (_destination != null) _destination
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            onLongPress: _addMarker,
          ),

          //Hamburger Button For Drawer
          Positioned(
            top: 45.0,
            left: 22.0,
            child: GestureDetector(
              onTap: () {
                scaffoldkey.currentState.openDrawer();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 6.0,
                        offset: Offset(
                          0.7,
                          0.7,
                        ))
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  radius: 20,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 16.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6.0),
                    CustomText2(
                        text: "Hi there", size: 12, color: Colors.black),
                    CustomText2(
                      text: "Emergency Point?",
                      size: 20,
                      color: Colors.black,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 6.0,
                              spreadRadius: 0.5,
                              offset: Offset(0.7, 0.7))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CustomText2(
                                text: "Search Drop Off",
                                size: 16,
                                color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.home, color: Colors.grey),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText2(
                                text: "Add pickup",
                                size: 16,
                                color: Colors.black),
                            SizedBox(
                              height: 4.0,
                            ),
                            CustomText2(
                                text: "Your living home address",
                                size: 12.0,
                                color: Colors.black54),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DividerWidget(),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.work, color: Colors.grey),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText2(
                                text: "Add Dept",
                                size: 16,
                                color: Colors.black),
                            SizedBox(
                              height: 4.0,
                            ),
                            CustomText2(
                                text: "Your Department?",
                                size: 12.0,
                                color: Colors.black54),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info.totalDistance}, ${_info.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        // onPressed: () => _googleMapController.animateCamera(
        //   _info != null
        //       ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
        //       : CameraUpdate.newCameraPosition(_initialCameraPosition),
        // ),
        onPressed: locatePosition,
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        // Reset destination
        _destination = null;

        // Reset info
        _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin.position, destination: pos);
      setState(() => _info = directions);
    }
  }
}
