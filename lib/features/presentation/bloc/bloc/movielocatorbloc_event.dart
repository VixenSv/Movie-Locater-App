import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

abstract class MovielocatorblocEvent extends Equatable {
  const MovielocatorblocEvent();

  List<Object?> get props => [];
}

class GetMovieListEvent extends MovielocatorblocEvent {
  @override
  List<Object?> get props => [];
}

class GoHomeEvent extends MovielocatorblocEvent {
  @override
  List<Object?> get props => [];
}

class BookingEvent extends MovielocatorblocEvent {
  final MovieEntity movieEntity;
  final TheaterEntity theaterEntity;
  final BuildContext context;

  BookingEvent({required this.movieEntity, required this.theaterEntity, required this.context});
  @override
  List<Object?> get props => [this.movieEntity, this.movieEntity, this.context];
}
