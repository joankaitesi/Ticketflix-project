import 'package:flutter/material.dart';
import 'package:homescreen/signup_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('TicketFlix'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/images/up.png")),
            ),
            Text(
              'Welcome to TicketFlix!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to the sign-up page
                // Navigator.pushNamed(context, '/SignUpPage');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return SignUpPage();
                }));
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page
                Navigator.pushNamed(context, '/LoginPage');
              },
              child: Text('Log In'),
            ),
            SizedBox(height: 15),
            TextButton(
              onPressed: () {
                // Navigate to the forgot password page
                Navigator.pushNamed(context, '/forgot_password');
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
