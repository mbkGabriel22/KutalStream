import 'package:dartz/dartz.dart';
import 'package:kutal_stream_app/core/errors/server_failure.dart';
import 'package:kutal_stream_app/domain/entities/Movie.dart';
import 'package:kutal_stream_app/domain/repositories/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getTrendingMovies();
  }
}
