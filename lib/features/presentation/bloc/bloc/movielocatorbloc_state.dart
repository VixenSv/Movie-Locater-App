import 'package:equatable/equatable.dart';

import '../../../domain/entities/movieList.enitity.dart';

abstract class MovielocatorblocState extends Equatable {
  MovielocatorblocState([List props = const <dynamic>[]]) : super();
}

class MovielocatorblocInitial extends MovielocatorblocState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Empty extends MovielocatorblocState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loading extends MovielocatorblocState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Error extends MovielocatorblocState {
  final String message;

  Error({required this.message}) : super([message]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class MovieListLoaded extends MovielocatorblocState {
  final MovieListEntity listEntity;

  MovieListLoaded({required this.listEntity}) : super([listEntity]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
