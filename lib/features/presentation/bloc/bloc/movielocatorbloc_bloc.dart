import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/domain/usecases/confirmBooking.usecase.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/pages/Booking.page.dart';
import 'package:movie_locator_app/features/presentation/pages/Home.page.dart';
import 'package:movie_locator_app/features/presentation/pages/MovieList.page.dart';
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
  GetMovieList getMovieList;
  ConfirmBooking confirmBooking;

  MovielocatorblocBloc(
      {required this.getMovieList, required this.confirmBooking})
      : super(MovieListLoading()) {
    on<GetMovieListEvent>(_onGetMovieList);
    on<BookingEvent>(_onBookingEvent);
    on<GoHomeEvent>(_onGoHomeEvent);
    on<ConfirmBookingEvent>(_onConfirmBookingEvent);
  }

  get movieEntity => null;

  Future<void> _onGoHomeEvent(
      GoHomeEvent event, Emitter<MovielocatorblocState> emit) async {
    final failureOrImageEntity = await getMovieList(NoParams());
    failureOrImageEntity.fold(
      (failure) => Error(
        message: _mapFailureToMessage(failure),
      ),
      (imageEntity) => emit(MovieListLoaded(listEntity: imageEntity)),
    );
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
  }

  Future<void> _onGetMovieList(
      GetMovieListEvent event, Emitter<MovielocatorblocState> emit) async {
    final failureOrImageEntity = await getMovieList(NoParams());
    failureOrImageEntity.fold(
      (failure) => Error(
        message: _mapFailureToMessage(failure),
      ),
      (imageEntity) => emit(MovieListLoaded(listEntity: imageEntity)),
    );
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
