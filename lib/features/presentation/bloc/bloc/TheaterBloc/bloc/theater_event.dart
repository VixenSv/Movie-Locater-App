

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

abstract class TheaterEvent extends Equatable {
  const TheaterEvent();

  @override
  List<Object> get props => [];
}

class SaveTheaterDataEvent extends TheaterEvent {
  final TheaterEntity theaterEntity;
  final BuildContext context;

  SaveTheaterDataEvent({required this.theaterEntity, required this.context});

  @override
  List<Object> get props => [this.theaterEntity,this.context];
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

class UpdateTheaterEvent extends TheaterEvent {
  final TheaterEntity theaterEntity;

  UpdateTheaterEvent({required this.theaterEntity});

  @override
  List<Object> get props => [this.theaterEntity];
}

class DeleteTheaterEvent extends TheaterEvent {
  final String ref;

  DeleteTheaterEvent({required this.ref});

  @override
  List<Object> get props => [this.ref];
}