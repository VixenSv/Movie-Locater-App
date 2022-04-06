import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';

abstract class BookingBlocState extends Equatable {
  const BookingBlocState();
}

class BookingInitial extends BookingBlocState {
  @override
  List<Object?> get props => [];
}

class BookingEmpty extends BookingInitial {
  @override
  List<Object?> get props => [];
}

class BookingDataLoding extends BookingInitial {
  @override
  List<Object?> get props => [];
}

class BookingDataLoaded extends BookingBlocState {
  final BookingEntity bookingEntity;

  BookingDataLoaded({
    required this.bookingEntity,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.bookingEntity];
}

class BookingUpdating extends BookingBlocState {
  @override
  List<Object?> get props => [];
}

class BookingUpdated extends BookingBlocState {
  final BookingEntity bookingEntity;

  BookingUpdated({
    required this.bookingEntity,
  });

  @override
  List<Object?> get props => [this.bookingEntity];
}

class BookingDeleting extends BookingBlocState {
  @override
  List<Object?> get props => [];
}

class BookingDeleted extends BookingBlocState {
  @override
  List<Object?> get props => [];
}
