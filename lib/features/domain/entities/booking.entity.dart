import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/data/models/booking.model.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

class BookingEntity extends Equatable {
  final MovieEntity movieEntity;
  final String selectedShowTime;
  final int numberofTickets;
  final int bookingId;
  final TheaterEntity theaterEntity;
  final String selectedClass;


  BookingEntity(
      {required this.bookingId,
      required this.movieEntity,
      required this.selectedShowTime,
      required this.numberofTickets,
      required this.theaterEntity,
      required this.selectedClass,})
      : super();

  static Future<BookingEntity> toBookingEntity(BookingModel bookingModel) async {
    return await BookingEntity(
        bookingId: bookingModel.bookingId,
        movieEntity: bookingModel.movieEntity,
        numberofTickets: bookingModel.numberofTickets,
        selectedClass: bookingModel.selectedClass,
        selectedShowTime: bookingModel.selectedShowTime,
        theaterEntity: bookingModel.theaterEntity,);
  }

  static Future<BookingModel> fromBookingEntity(
      BookingEntity bookingEntity) async {
    return await BookingModel(
        bookingId: bookingEntity.bookingId,
        movieEntity: bookingEntity.movieEntity,
        numberofTickets: bookingEntity.numberofTickets,

        selectedClass: bookingEntity.selectedClass,
        selectedShowTime: bookingEntity.selectedShowTime,
        theaterEntity: bookingEntity.theaterEntity,
);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        this.bookingId,
        this.movieEntity,
        this.numberofTickets,
        this.selectedShowTime,
        this.theaterEntity,
        this.selectedClass
      ];
}
