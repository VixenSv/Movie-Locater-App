
import 'package:equatable/equatable.dart';

abstract class TheaterState extends Equatable {
  const TheaterState();
  
  @override
  List<Object> get props => [];
}

class TheaterInitial extends TheaterState {}
