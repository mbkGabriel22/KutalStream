import 'package:kutal_stream_app/domain/entities/Movie.dart';
import 'package:kutal_stream_app/domain/repositories/Movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);
  Future<List<Movie>> call() async {
    return await repository.getTrendingMovies();
  }
}
