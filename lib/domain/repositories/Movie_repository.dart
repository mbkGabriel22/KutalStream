import 'package:kutal_stream_app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTrendingMovies();
  Future<List<Movie>> searchMovies();
  Future<List<Movie>> getPopularMovies();
}
