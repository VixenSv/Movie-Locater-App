import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_locator_app/features/domain/usecases/addMovie.usecase.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import '../../../../core/error/faliure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../domain/entities/movie.entity.dart';
import '../../../domain/entities/movieList.enitity.dart';
import '../../../domain/usecases/getMovieList.usecase.dart';
import '../../pages/Home.page.dart';
import '../../pages/MovieList.page.dart';
import 'movielocatorbloc_event.dart';
import 'movielocatorbloc_state.dart';

const String SELECTION_FAILURE_MESSAGE = 'selection Failure';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class MovielocatorblocBloc
    extends Bloc<MovielocatorblocEvent, MovielocatorblocState> {
  GetMovieList getMovieList;
  AddMovie addMovie;

  MovielocatorblocBloc({required this.getMovieList, required this.addMovie})
      : super(AddingMovie()) {
    on<GetMovieListEvent>(_onGetMovieList);
    on<AddMovieEvent>(_onAddMovieEvent);
  }

  Future<void> _onGetMovieList(
      GetMovieListEvent event, Emitter<MovielocatorblocState> emit) async {
    final failureOrImageEntity = await getMovieList(NoParams());
    failureOrImageEntity.map((r) => print(r.movieList[0].movieName));
    failureOrImageEntity.fold(
      (failure) => Error(
        message: _mapFailureToMessage(failure),
      ),
      (imageEntity) => emit(MovieListLoaded(listEntity: imageEntity)),
    );
    // _eitherListLodedOrErrorState(failureOrImageEntity, emit);
  }

  //create custom methods
  Future<void> _onAddMovieEvent(
      AddMovieEvent event, Emitter<MovielocatorblocState> emit) async {
    final failureOrImageEntity = await addMovie(event.movieEntity);
    failureOrImageEntity.fold(
      (failure) => Error(
        message: _mapFailureToMessage(failure),
      ),
      (imageEntity) => emit(MovieListLoading()),
    );
    // Navigator.pushReplacement(
    //   event.context,
    //   MaterialPageRoute(
    //       builder: (context) => HomePage(MovieListPage(), 'Movie List')),
    // );
    
  }

  @override
  MovielocatorblocState get initialState => Empty();

  Stream<MovielocatorblocState> _eitherListLodedOrErrorState(
      Either<Failure, MovieListEntity> failureOrImageEntity,
      Emitter<MovielocatorblocState> emit) async* {
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
