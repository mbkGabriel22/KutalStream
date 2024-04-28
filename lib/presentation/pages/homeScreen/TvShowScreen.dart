import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TvShowScreen extends StatelessWidget {
  const TvShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          ' TV shows',
          style: GoogleFonts.quicksand(
              textStyle: Theme.of(context).textTheme.titleSmall,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
    );
  }
}
