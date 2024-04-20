import 'package:flutter/material.dart';
import 'package:kutal_stream_app/domain/entities/Movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SizedBox(
        height: 150,
        width: 100,
        child: Ink.image(
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
