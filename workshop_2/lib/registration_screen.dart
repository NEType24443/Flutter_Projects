import 'package:firebase_auth/firebase_auth.dart';
import 'facebook.dart';
import 'google.dart';
import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String _name, _email, _password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(      // Main Title
              padding: EdgeInsets.all(height * 0.02),
              child: Text(
                'Register',
                style: GoogleFonts.abel(
                  letterSpacing: 2.0,
                  fontSize: height * 0.05,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(    // Invitation text
              width: width * 0.8,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Lets get \nyou on board',
                  style: GoogleFonts.abel(
                    letterSpacing: 2.0,
                    fontSize: height * 0.038,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(    //  Name Field
              padding: EdgeInsets.all(height * 0.02),
              child: TextField(
                style: GoogleFonts.abel(
                  letterSpacing: 2.0,
                ),
                onChanged: (value) {
                  _name = value;
                  print("Name: $_name");
                },
                decoration: InputDecoration(
                  hintText: 'Full Name',
                ),
              ),
            ),
            Padding(    //  Email Field
              padding: EdgeInsets.all(height * 0.02),
              child: TextField(
                style: GoogleFonts.abel(
                  letterSpacing: 2.0,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _email = value;
                  print("E-Mail: $_email");
                },
                decoration: InputDecoration(
                  hintText: 'E-Mail',
                ),
              ),
            ),
            Padding(    //  Password Field
              padding: EdgeInsets.all(height * 0.02),
              child: TextField(
                style: GoogleFonts.abel(
                  letterSpacing: 2.0,
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  _password = value;
                  print("Password: $_password");
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            Center(   //  Register Button
              child: RoundedButton(
                colour: Colors.blueAccent,
                title: 'Register',
                onPressed: () async{
                  print("Registering...");
                  try {
                    final newUser =
                      await _auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    if(newUser != null) {
                      print("Registration Successful!");
                    }
                  }
                  catch(e){
                    print(e);
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(   //  left --- part of --- OR ---
                  width: width * 0.1,
                  child: Divider(
                    color: Colors.black54,
                    thickness: 1.0,
                  ),
                ),
                Padding(   //  OR part of --- OR ---
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    'Or',
                    style: GoogleFonts.abel(
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(   //  right --- part of --- OR ---
                  width: width * 0.1,
                  child: Divider(
                    color: Colors.black54,
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
            Row(    //  Google and Facebook Login Buttons
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  disabledColor: Colors.white,
                  color: Colors.white,
                  elevation: 0.0,
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.07,
                    child: Center(
                      child: Text(
                        'Google',
                        style: GoogleFonts.abel(
                          letterSpacing: 5.0,
                          fontSize: height * 0.02,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    try {
                      signInWithGoogle().whenComplete(() {
                        Navigator.pushReplacementNamed(
                            context, RegistrationScreen.id);
                        }
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                SizedBox(
                  width: width * 0.1,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  disabledColor: Colors.white,
                  color: Colors.white,
                  elevation: 0.0,
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.07,
                    child: Center(
                      child: Text(
                        'Facebook',
                        style: GoogleFonts.abel(
                          letterSpacing: 5.0,
                          fontSize: height * 0.02,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                   // initiateFacebookLogin();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account?",
                  style: GoogleFonts.abel(
                    letterSpacing: 2.0,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.abel(
                      letterSpacing: 2.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}