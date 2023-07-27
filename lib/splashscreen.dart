import 'package:flutter/material.dart';
import 'package:homescreen/home.dart';
import 'package:homescreen/welcomescreen.dart';

class splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _splashscreen();
  }
}

class _splashscreen extends State<splashscreen> {
  int splashtime = 10;

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WelcomePage();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff02221f),
        body: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/images/up.png")),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      "TICKETFLIX",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text("Version: 1.0.0",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                        )),
                  ),
                ])));
  }
}
