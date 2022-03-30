import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';

abstract class MovielocatorblocEvent extends Equatable {
  const MovielocatorblocEvent();

  List<Object?> get props => [];
}

class GetMovieListEvent extends MovielocatorblocEvent {
  @override
  List<Object?> get props => [];
}

class AddMovieEvent extends MovielocatorblocEvent {
  
  MovieEntity movieEntity;

  AddMovieEvent({required this.movieEntity});

  @override
  List<Object> get props => [movieEntity];

}
