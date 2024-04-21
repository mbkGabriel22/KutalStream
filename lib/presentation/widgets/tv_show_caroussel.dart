import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:kutal_stream_app/domain/entities/Movie.dart';

class TvShowCaroussel extends StatelessWidget {
  const TvShowCaroussel({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        height: 200.0,
        showIndicator: true,
        indicatorMargin: 1.0,
        slideIndicator: const CircularSlideIndicator(
          itemSpacing: 12,
          indicatorRadius: 2.0,
          currentIndicatorColor: Color.fromRGBO(20, 124, 166, 1),
          indicatorBorderWidth: 8,
        ),
        enableInfiniteScroll: true,
        allowImplicitScrolling: true,
        initialPage: 0,
        reverse: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 700),
        autoPlayCurve: Curves.easeInCubic,
        enlargeCenterPage: true,
      ),
      items: movies.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              clipBehavior: Clip.none,
              child: Ink.image(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${i.posterPath}'),
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
