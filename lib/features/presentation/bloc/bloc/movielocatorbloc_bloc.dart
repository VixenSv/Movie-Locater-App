import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/domain/usecases/confirmBooking.usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_locator_app/features/domain/usecases/addMovie.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/getAdminMovieList.usecase.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/pages/Booking.page.dart';
import 'package:movie_locator_app/features/presentation/pages/Home.page.dart';
import 'package:movie_locator_app/features/presentation/pages/MovieList.page.dart';
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
  ConfirmBooking confirmBooking;
  AddMovie addMovie;
  GetAdminMovieList getAdminMovieList;

  MovielocatorblocBloc(
      {required this.getMovieList, required this.confirmBooking, required this.addMovie,required this.getAdminMovieList})
      : super(MovieListLoading()) {
    on<GetMovieListEvent>(_onGetMovieList);
    on<BookingEvent>(_onBookingEvent);
    on<GoHomeEvent>(_onGoHomeEvent);
    on<ConfirmBookingEvent>(_onConfirmBookingEvent);
    on<AddMovieEvent>(_onAddMovieEvent);
    on<UpdateMovieEvent>(_onUpdateMovieEvent);
  }

  get movieEntity => null;

  Future<void> _onGoHomeEvent(
      GoHomeEvent event, Emitter<MovielocatorblocState> emit) async {
    // final failureOrImageEntity = await getMovieList(NoParams());
    // failureOrImageEntity.fold(
    //   (failure) => Error(
    //     message: _mapFailureToMessage(failure),
    //   ),
    //   (imageEntity) => emit(MovieListLoaded(listEntity: imageEntity)),

    // );
    emit(MovieListLoading());

  }

  Future<void> _onConfirmBookingEvent(
      ConfirmBookingEvent event, Emitter<MovielocatorblocState> emit) async {
    final failureOrImageEntity = await confirmBooking(event.bookingEntity);
    failureOrImageEntity.fold(
      (failure) => Error(
        message: _mapFailureToMessage(failure),
      ),
      (imageEntity) => emit(MovieListLoading()),
    );

    Navigator.pushReplacement(
      event.context,
      MaterialPageRoute(
          builder: (context) => HomePage(MovieListPage(), 'Movie List')),
    );
    on<AddMovieEvent>(_onAddMovieEvent);
  }

  Future<void> _onGetMovieList(
      GetMovieListEvent event, Emitter<MovielocatorblocState> emit) async {
    if(event.isAdmin){
      final failureOrImageEntity =  await getAdminMovieList(NoParams());
      failureOrImageEntity.fold(
            (failure) => Error(
          message: _mapFailureToMessage(failure),
        ),
            (movieEntity) => emit(MovieListLoaded(listEntity: movieEntity)),
      );
    }else {
      final failureOrImageEntity =  await getMovieList(NoParams());
      failureOrImageEntity.fold(
            (failure) => Error(
          message: _mapFailureToMessage(failure),
        ),
            (movieEntity) => emit(MovieListLoaded(listEntity: movieEntity)),
      );
    }


    // _eitherListLodedOrErrorState(failureOrImageEntity, emit);
  }

  Future<void> _onBookingEvent(
      BookingEvent event, Emitter<MovielocatorblocState> emit) async {
    List<String> list = event.theaterEntity.showEntityList!.cast();
    List<String> clist = event.theaterEntity.availbleClasses!.cast();
    Navigator.pushReplacement(
      event.context,
      MaterialPageRoute(
          builder: (context) => HomePage(
              BookingPage(
                dropdownValue: list[0],
                selectedClass: clist[0],
              ),
              'Book Now')),
    );

    emit(BookingState(
        movieEntity: event.movieEntity,
        theaterEntity: event.theaterEntity,
        showTimeList: list,
        classList: clist));
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


  }

  Future<void> _onUpdateMovieEvent(
      UpdateMovieEvent event, Emitter<MovielocatorblocState> emit) async {
    final failureOrImageEntity = await addMovie(event.movieEntity);
    failureOrImageEntity.fold(
          (failure) => Error(
        message: _mapFailureToMessage(failure),
      ),
          (imageEntity) => emit(MovieListLoading()),
    );


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
