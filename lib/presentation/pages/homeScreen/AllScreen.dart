import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/popular_movies/popular_movies_state.dart';
import 'package:kutal_stream_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:kutal_stream_app/presentation/pages/movies_list.dart';
import 'package:kutal_stream_app/presentation/widgets/tv_show_caroussel.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tv show carrousel
            BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
              builder: (context, state) {
                if (state is TrendingMoviesLoading) {
                  return const CircularProgressIndicator();
                } else if (state is TrendingMoviesLoaded) {
                  return TvShowCaroussel(movies: state.movies);
                } else if (state is TrendingMoviesError) {
                  return Text(state.message);
                }
                return Container();
              },
            ),
            const SizedBox(
              height: 30,
            ),

            // Trending Movies
            const Text(
              'Trending Movies',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
              builder: (context, state) {
                if (state is TrendingMoviesLoading) {
                  return const CircularProgressIndicator();
                } else if (state is TrendingMoviesLoaded) {
                  return MoviesList(movies: state.movies);
                } else if (state is TrendingMoviesError) {
                  return Text(state.message);
                }
                return Container();
              },
            ),

            const SizedBox(
              height: 10,
            ),
            // Popular Movies
            const Text(
              'Popular Movies',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
              builder: (context, state) {
                if (state is PopularMoviesLoading) {
                  return const CircularProgressIndicator();
                } else if (state is PopularMoviesLoaded) {
                  return MoviesList(movies: state.movies);
                } else if (state is PopularMoviesError) {
                  return Text(state.message);
                }
                return Container();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Tv shows',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
              builder: (context, state) {
                if (state is PopularMoviesLoading) {
                  return const CircularProgressIndicator();
                } else if (state is PopularMoviesLoaded) {
                  return MoviesList(movies: state.movies);
                } else if (state is PopularMoviesError) {
                  return Text(state.message);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
