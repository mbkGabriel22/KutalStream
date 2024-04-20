import 'package:kutal_stream_app/domain/usecases/get_discover_TvShow.dart';
import 'package:kutal_stream_app/presentation/bloc/discover_tv_show/discover_tv_show_event.dart';
import 'package:kutal_stream_app/presentation/bloc/discover_tv_show/discover_tv_show_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverTvShowBloc
    extends Bloc<DiscoverTvShowEvent, DiscoverTvShowState> {
  final GetDiscoverTvShow getDiscoverTvShow;

  DiscoverTvShowBloc({required this.getDiscoverTvShow})
      : super(DiscoverTvShowInitial()) {
    on<FetchDiscoverTvShow>((event, emit) async {
      emit(DiscoverTvShowLoading());
      final failureOrmovies = await getDiscoverTvShow();
      failureOrmovies.fold(
          (failure) => emit(DiscoverTvShowError(failure.toString())),
          (movies) => emit(DiscoverTvShowLoaded(movies)));
    });
  }
}
