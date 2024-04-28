import 'package:flutter/material.dart';
import 'package:kutal_stream_app/injection_contenair.dart';
import 'package:kutal_stream_app/presentation/bloc/discover_tv_show/discover_tv_show_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/discover_tv_show/discover_tv_show_event.dart';
import 'package:kutal_stream_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:kutal_stream_app/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:kutal_stream_app/presentation/pages/home.dart';
import 'package:kutal_stream_app/presentation/pages/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
          ),
          BlocProvider(
            create: (context) =>
                getIt<TrendingMoviesBloc>()..add(FetchTrendingMovies()),
          ),
          BlocProvider(
            create: (context) =>
                getIt<DiscoverTvShowBloc>()..add(FetchDiscoverTvShow()),
          ),
          BlocProvider(
            create: (context) => getIt<SearchMoviesBloc>(),
          ),
        ],
        child: const MyHome(),
      ),
    );
  }
}
