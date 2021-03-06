
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_solution_app/provider/userProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_solution_app/screens/onBoardingScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
          ListenableProvider<UserProvider>(
            create: (ctx) => UserProvider(),
          )
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // fontFamily: 'Poppins',
          primarySwatch: Colors.grey,
        ),
        debugShowCheckedModeBanner: false,
        home: OnBoardingPage(),
        // home: StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (ctx, snapshot) {
        //     if (snapshot.hasData) {
        //       return SecondHomePage();
        //     } else {
        //       return Login();
        //     }
        //   },
        // ),
      ),
    );
  }
}
