import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Loader extends StatefulWidget {
  final Widget nextScreen;
  const Loader({Key key, this.nextScreen}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: widget.nextScreen,
        // title: new Text(
        //     'Welcome to Great Danic Logistics! \nFast And Reliable Delivery Services',
        //     style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold)),
        // image: new Image.asset('images/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        // photoSize: 70.0,
        loaderColor: Colors.blue,
        // loadingText: Text('initializing...'),
        );
  }
}
