import 'package:dartz/dartz.dart';
import 'package:kutal_stream_app/core/errors/server_failure.dart';
import 'package:kutal_stream_app/domain/entities/Movie.dart';
import 'package:kutal_stream_app/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
