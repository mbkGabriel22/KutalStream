import 'package:kutal_stream_app/domain/entities/Movie.dart';

abstract class DiscoverTvShowState {}

class DiscoverTvShowInitial extends DiscoverTvShowState {}

class DiscoverTvShowLoading extends DiscoverTvShowState {}

class DiscoverTvShowLoaded extends DiscoverTvShowState {
  final List<Movie> movies;

  DiscoverTvShowLoaded(this.movies);
}

class DiscoverTvShowError extends DiscoverTvShowState {
  final String message;

  DiscoverTvShowError(this.message);
}
