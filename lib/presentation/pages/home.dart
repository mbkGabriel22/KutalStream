import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kutal_stream_app/presentation/pages/homeScreen/AllScreen.dart';
import 'package:kutal_stream_app/presentation/pages/homeScreen/MoviesScreen.dart';
import 'package:kutal_stream_app/presentation/pages/homeScreen/SeriesScreen.dart';
import 'package:kutal_stream_app/presentation/pages/homeScreen/TvShowScreen.dart';
import 'package:kutal_stream_app/presentation/widgets/bottom_nav_bar.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 22,
          titleSpacing: 2,
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                print('Menu Burger');
              },
              icon: const Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
              )),
          title: Image.asset(
            'assets/logos/kutal_logo.png',
            scale: 2.0,
          ),
          actions: [
            CircleAvatar(
              radius: 20,
              child: Image.asset(
                'assets/logos/kutal_logo.png',
                fit: BoxFit.cover,
              ),
            )
          ],
          bottom: const TabBar(
            indicator: BoxDecoration(
                color: Color.fromRGBO(20, 124, 166, 1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                shape: BoxShape.rectangle),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color.fromRGBO(20, 124, 166, 1),
            splashBorderRadius: BorderRadius.all(Radius.circular(22)),
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'TV Shows'),
              Tab(text: 'Movies'),
              Tab(text: 'Serie'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllScreen(),
            TvShowScreen(),
            MoviesScreen(),
            SerieScreen()
          ],
        ),
        bottomNavigationBar: const MybottomNavBar(),
      ),
    );
  }
}
