import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';

abstract class BookingBlocEvent extends Equatable {
  const BookingBlocEvent();

  @override
  List<Object> get props => [];
}

class GetBookingDataEvent extends BookingBlocEvent {
  final String refId;

  GetBookingDataEvent({required this.refId});

  @override
  List<Object> get props => [this.refId];
}

class ShowTheaterLocationEvent extends BookingBlocEvent {
  final String link;

  ShowTheaterLocationEvent({required this.link});

  @override
  List<Object> get props => [this.link];
}

class UpdateBookingEvent extends BookingBlocEvent {
  final BookingEntity bookingEntity;
  final BuildContext context;

  UpdateBookingEvent({required this.bookingEntity, required this.context});

  @override
  List<Object> get props => [this.bookingEntity, this.context];
}

class DeleteBookingEvent extends BookingBlocEvent {
  final BookingEntity bookingEntity;
  final BuildContext context;

  DeleteBookingEvent({required this.bookingEntity, required this.context});

  @override
  List<Object> get props => [this.bookingEntity, this.context];
}
