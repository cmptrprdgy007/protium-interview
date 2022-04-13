import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:the_social/constants/constantColors.dart';
import 'package:the_social/screens/HomeScreen/homeScreen.dart';
import 'package:the_social/screens/LandingScreen/landingService.dart';
import 'package:the_social/screens/ProfileScreen/profileScreen.dart';
import 'package:the_social/services/authService.dart';

class LandingHelper extends ChangeNotifier {
  final ConstantColors _constantColors = ConstantColors();

  Widget mainButtons(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.85,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: Text(
                "Google Login->",
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(10.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
                onTap: () async {
                  final res =
                      await Provider.of<AuthService>(context, listen: false)
                          .signInWithGoogle(context);
                  if (res != false) {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageTransition(
                          child: HomeScreen(),
                          type: PageTransitionType.leftToRight,
                        ),
                        (page) => page == null);
                  }
                },
                child: Container(
                  height: 40.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: _constantColors.redColor),
                    color: _constantColors.transparent,
                  ),
                  child: Center(
                    child: Icon(
                      EvaIcons.google,
                      color: _constantColors.redColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
