

import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

abstract class TheaterEvent extends Equatable {
  const TheaterEvent();

  @override
  List<Object> get props => [];
}

class SaveTheaterDataEvent extends TheaterEvent {
  final TheaterEntity theaterEntity;

  SaveTheaterDataEvent({required this.theaterEntity});

  @override
  List<Object> get props => [this.theaterEntity];
}

class SelectTheaterImageEvent extends TheaterEvent {

  @override
  List<Object> get props => [];
}

class SaveTheaterImageEvent extends TheaterEvent {
  final imageFile;

  SaveTheaterImageEvent({required this.imageFile});

  @override
  List<Object> get props => [this.imageFile];
}

class GetTheaterListEvent extends TheaterEvent {
  @override
  List<Object> get props => [];
}

class UpdateTheaterImageEvent extends TheaterEvent {
  final TheaterEntity theaterEntity;

  UpdateTheaterImageEvent({required this.theaterEntity});

  @override
  List<Object> get props => [this.theaterEntity];
}