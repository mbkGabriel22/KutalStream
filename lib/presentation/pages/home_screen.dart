import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kutal_stream_app/presentation/bloc/discover_tv_show/discover_tv_show_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/discover_tv_show/discover_tv_show_event.dart';
import 'package:kutal_stream_app/presentation/bloc/discover_tv_show/discover_tv_show_state.dart';
import 'package:kutal_stream_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/popular_movies/popular_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:kutal_stream_app/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:kutal_stream_app/presentation/pages/films_screen.dart';
import 'package:kutal_stream_app/presentation/pages/movies_list.dart';
import 'package:kutal_stream_app/presentation/pages/serie_screen.dart';
import 'package:kutal_stream_app/presentation/pages/tv_show_screen.dart';
import 'package:kutal_stream_app/presentation/widgets/bottom_nav_bar.dart';
import 'package:kutal_stream_app/presentation/widgets/movie_card.dart';
import 'package:kutal_stream_app/presentation/widgets/tv_show_caroussel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> tabs = [
    HomeScreen(),
    const TvShowScreen(),
    const FilmScreen(),
    const SerieScreen(),
  ];

  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 78;
      case 2:
        return 192;
      case 3:
        return 263;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 50;
      case 1:
        return 80;
      case 2:
        return 50;
      case 3:
        return 50;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
      body: Column(
        children: [
          SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: size.width,
                    height: size.height * 0.05,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.04,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: tabs.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 0 ? 10 : 23, top: 7),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            current = index;
                                          });
                                        },
                                        child: tabs[index]),
                                  );
                                }),
                          ),
                        ),
                        AnimatedPositioned(
                          curve: Curves.fastLinearToSlowEaseIn,
                          bottom: 0,
                          left: changePositionedOfLine(),
                          duration: const Duration(milliseconds: 500),
                          child: AnimatedContainer(
                            margin: const EdgeInsets.only(left: 10),
                            width: changeContainerWidth(),
                            height: size.height * 0.008,
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.3),
                    child: Text(
                      "${tabs[current]} Tab Content",
                      style: GoogleFonts.ubuntu(fontSize: 30),
                    ),
                  )
                ],
              )),
          Container(
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
        ],
      ),
      bottomNavigationBar: const MybottomNavBar(),
    );
  }
}
