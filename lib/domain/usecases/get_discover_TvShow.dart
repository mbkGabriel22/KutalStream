import 'package:dartz/dartz.dart';
import 'package:kutal_stream_app/core/errors/server_failure.dart';
import 'package:kutal_stream_app/domain/entities/Movie.dart';
import 'package:kutal_stream_app/domain/repositories/Movie_repository.dart';

class GetDiscoverTvShow {
  final MovieRepository repository;

  GetDiscoverTvShow(this.repository);

  Future<Either<Failure, List<Movie>>> call() {
    return repository.getDiscoverTvShow();
  }
}
