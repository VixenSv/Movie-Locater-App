
import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';

import '../../../domain/entities/movieList.enitity.dart';

abstract class MovielocatorblocState extends Equatable {
  const MovielocatorblocState();
}

class MovielocatorblocInitial extends MovielocatorblocState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Empty extends MovielocatorblocState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieListLoading extends MovielocatorblocState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends MovielocatorblocState {
  final String message;

  Error({required this.message}) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieListLoaded extends MovielocatorblocState {
  final MovieListEntity listEntity;

  const MovieListLoaded({required this.listEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [listEntity];
}

class MovieDetailLoaded extends MovielocatorblocState {
  final MovieEntity entity;

  const MovieDetailLoaded({required this.entity});

  @override
  // TODO: implement props
  List<Object?> get props => [entity];
}




class AddingMovie extends MovielocatorblocState {
  
  const AddingMovie();

    @override
  // TODO: implement props
  List<Object?> get props => [];
}
