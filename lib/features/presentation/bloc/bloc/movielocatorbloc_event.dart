import 'package:equatable/equatable.dart';

abstract class MovielocatorblocEvent extends Equatable {
  MovielocatorblocEvent([List props = const <dynamic>[]]) : super();
}

class GetMovieListEvent extends MovielocatorblocEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
