import 'package:equatable/equatable.dart';

abstract class MovielocatorblocState extends Equatable {
  MovielocatorblocState([List props = const <dynamic>[]]) : super(props);
}

class MovielocatorblocInitial extends MovielocatorblocState {}

class Empty extends MovielocatorblocState {}
