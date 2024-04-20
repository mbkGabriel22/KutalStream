import 'package:kutal_stream_app/core/errors/server_failure.dart';
import 'package:kutal_stream_app/domain/entities/Movie.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getDiscoverTvShow();
}
