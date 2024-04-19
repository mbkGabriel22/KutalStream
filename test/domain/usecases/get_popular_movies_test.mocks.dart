// Mocks generated by Mockito 5.4.2 from annotations
// in movie_app/test/domain/usecases/get_popular_movies_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:kutal_stream_app/core/errors/server_failure.dart' as _i5;
import 'package:kutal_stream_app/domain/entities/Movie.dart' as _i6;
import 'package:kutal_stream_app/domain/repositories/movie_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>> getTrendingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTrendingMovies,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Movie>>(
          this,
          Invocation.method(
            #getTrendingMovies,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Movie>>(
          this,
          Invocation.method(
            #getTrendingMovies,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>);
}
