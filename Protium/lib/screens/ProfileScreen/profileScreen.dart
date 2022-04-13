import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:the_social/constants/constantColors.dart';
import 'package:the_social/screens/HomeScreen/homeScreen.dart';
import 'package:the_social/screens/LandingScreen/landingScreen.dart';
import 'package:the_social/screens/ProfileScreen/profileWidgets.dart';
import 'package:the_social/services/authService.dart';
import 'package:the_social/services/firebaseOperations.dart';
import 'package:the_social/uploadlarge.dart';

//created by akshay 13/04/2022
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Text(
              "Get Location",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext) => Home()));
            },
          ),
          GestureDetector(
            child: Text(
              "Go Back",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext) => HomeScreen()));
            },
          ),
        ],
      )),
      backgroundColor: constantColors.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: constantColors.blueGreyColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              EvaIcons.logOut,
              color: constantColors.greenColor,
            ),
            onPressed: () {
              Provider.of<FirebaseOperations>(context, listen: false)
                          .userData['accountType'] ==
                      0
                  ? Provider.of<AuthService>(context, listen: false)
                      .signOutWithEmailAndPassword()
                  : Provider.of<AuthService>(context, listen: false)
                      .signOutWithGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                      child: LandingPage(),
                      type: PageTransitionType.rightToLeft),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
