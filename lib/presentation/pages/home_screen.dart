import 'package:flutter/material.dart';
import 'package:kutal_stream_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/popular_movies/popular_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:kutal_stream_app/presentation/pages/movies_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bckImage =
      'https://www.pexels.com/fr-fr/photo/abstrait-colore-d-etoile-de-nuit-4021521/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bonjour MBK 👋',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'KutalStream',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tv show carrousel
              Container(
                height: 290,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bckImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 18, 151, 174),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // Border radius
                              ),
                            ),
                            child:
                                const Text('▶️ Détendez-vous et explorer !!!'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                height: 20,
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
            ],
          ),
        ),
      ),
    );
  }
}
