// ignore: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class MybottomNavBar extends StatelessWidget {
  const MybottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: GNav(
            backgroundColor: Colors.black,
            gap: 8,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 300),
            color: Colors.white,
            hoverColor: Color.fromARGB(62, 77, 77, 77),
            tabBackgroundGradient: LinearGradient(colors: [
              Colors.black,
              Color.fromRGBO(126, 55, 107, 1),
            ], begin: Alignment.center, end: Alignment.bottomCenter),
            activeColor: Color.fromRGBO(140, 3, 104, 1),
            iconSize: 20,
            tabBackgroundColor: Colors.black12,
            padding: EdgeInsets.all(5),
            tabs: [
              GButton(
                icon: FontAwesomeIcons.house,
                text: 'Home',
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(140, 3, 104, 1),
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.magnifyingGlass,
                text: 'Discover',
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(140, 3, 104, 1),
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.heart,
                text: 'Favorites',
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(140, 3, 104, 1),
                ),
              ),
            ]),
      ),
    );
  }
}
