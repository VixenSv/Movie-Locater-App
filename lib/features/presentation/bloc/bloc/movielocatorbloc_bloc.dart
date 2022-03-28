import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import '../../../../core/error/faliure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../domain/entities/movieList.enitity.dart';
import '../../../domain/usecases/getMovieList.usecase.dart';
import 'movielocatorbloc_event.dart';
import 'movielocatorbloc_state.dart';

const String SELECTION_FAILURE_MESSAGE = 'selection Failure';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class MovielocatorblocBloc
    extends Bloc<MovielocatorblocEvent, MovielocatorblocState> {
  final GetMovieList getMovieList;

  MovielocatorblocBloc({required this.getMovieList});

  @override
  MovielocatorblocState get initialState => Empty();

  @override
  Stream<MovielocatorblocState> mapEventToState(
      MovielocatorblocEvent event) async* {
    if (event is GetMovieListEvent) {
      yield Loading();
      // final failureOrImageListModel = await getMovieList(NoParams());
      // yield* _eitherListLodedOrErrorState(failureOrImageListModel);
    }
  }

  Stream<MovielocatorblocState> _eitherListLodedOrErrorState(
      Either<Failure, MovieListEntity> failureOrImageEntity) async* {
    yield failureOrImageEntity.fold(
      (failure) => Error(
        message: _mapFailureToMessage(failure),
      ),
      (imageEntity) => MovieListLoaded(listEntity: imageEntity),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case SelectionFailure:
        return SELECTION_FAILURE_MESSAGE;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
