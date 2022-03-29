import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieEntity extends Equatable {
  final String movieName;
  final DateTime showTime;
  final int NumOfSeats;
  final String movieClass;
  final Float ticketPrice;

  MovieEntity({
    required this.movieName,
    required this.showTime,
    required this.NumOfSeats,
    required this.movieClass,
    required this.ticketPrice,
  }) : super([showTime, showTime, NumOfSeats, movieClass, ticketPrice]);
}
