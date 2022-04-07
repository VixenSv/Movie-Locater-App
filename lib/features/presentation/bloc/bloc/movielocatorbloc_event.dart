import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

abstract class MovielocatorblocEvent extends Equatable {
  const MovielocatorblocEvent();

  List<Object?> get props => [];
}

class GetMovieListEvent extends MovielocatorblocEvent {
  final bool isAdmin;

  GetMovieListEvent({required this.isAdmin});

  @override
  List<Object?> get props => [this.isAdmin];
}

class AddMovieEvent extends MovielocatorblocEvent {
  final MovieEntity movieEntity;
  final BuildContext context;

  AddMovieEvent({required this.movieEntity, required this.context});

  @override
  List<Object> get props => [movieEntity];
}

class UpdateMovieEvent extends MovielocatorblocEvent {
  final MovieEntity movieEntity;
  final BuildContext context;

  UpdateMovieEvent({required this.movieEntity, required this.context});

  @override
  List<Object> get props => [movieEntity];
}

class DeleteMovieEvent extends MovielocatorblocEvent {
  final String ref;

  DeleteMovieEvent({required this.ref});

  @override
  List<Object> get props => [this.ref];
}

class GoHomeEvent extends MovielocatorblocEvent {
  @override
  List<Object?> get props => [];
}

class ConfirmBookingEvent extends MovielocatorblocEvent {
  final BookingEntity bookingEntity;
  final BuildContext context;

  ConfirmBookingEvent({required this.bookingEntity, required this.context});

  @override
  List<Object?> get props => [this.bookingEntity, this.context];
}

class BookingEvent extends MovielocatorblocEvent {
  final MovieEntity movieEntity;
  final TheaterEntity theaterEntity;
  final BuildContext context;

  BookingEvent(
      {required this.movieEntity,
      required this.theaterEntity,
      required this.context});
  @override
  List<Object?> get props => [this.movieEntity, this.movieEntity, this.context];
}
