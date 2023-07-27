import 'package:flutter/material.dart';
import 'package:homescreen/home.dart';
import 'package:homescreen/login.dart';
import 'splashscreen.dart';
import 'welcomescreen.dart'; // Make sure to import the file containing the WelcomePage widget
import 'signup_page.dart';
import 'login.dart';

void main() => runApp(Ticketflix());

class Ticketflix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => splashscreen(),
        '/WelcomePage': (context) => WelcomePage(),
        '/loginPage': (context) => LoginPage(),
        '/SignUpPage': (context) => SignUpPage(),
        '/HomeScreen': (context) => HomeScreen(),
      },
    );
  }
}
