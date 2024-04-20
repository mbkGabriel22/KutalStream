import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:kutal_stream_app/domain/entities/Movie.dart';

class TvShowCaroussel extends StatelessWidget {
  const TvShowCaroussel(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        height: 400.0,
        showIndicator: true,
        slideIndicator: const CircularSlideIndicator(),
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.amber),
                child: Text(
                  'text $i',
                  style: const TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }
}
