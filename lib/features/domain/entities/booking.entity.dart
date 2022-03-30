import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/data/models/booking.model.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';

class BookingEntity extends Equatable {
  final MovieEntity movieEntity;
  final String selectedShowTime;
  final int numberofTickets;
  final int bookingId;
  final TheaterEntity theaterEntity;
  final String selectedClass;
  final double perTicketPrice;
  final double totalPrice;

  BookingEntity(
      {required this.bookingId,
      required this.movieEntity,
      required this.selectedShowTime,
      required this.numberofTickets,
      required this.theaterEntity,
      required this.selectedClass,
      required this.perTicketPrice,
      required this.totalPrice})
      : super();

  static Future<BookingEntity> toMovieEntity(BookingModel bookingModel) async {
    return await BookingEntity(
        bookingId: bookingModel.bookingId,
        movieEntity: bookingModel.movieEntity,
        numberofTickets: bookingModel.numberofTickets,
        perTicketPrice: bookingModel.perTicketPrice,
        selectedClass: bookingModel.selectedClass,
        selectedShowTime: bookingModel.selectedShowTime,
        theaterEntity: bookingModel.theaterEntity,
        totalPrice: bookingModel.totalPrice);
  }

  static Future<BookingModel> fromMovieEntity(
      BookingEntity bookingEntity) async {
    return await BookingModel(
        bookingId: bookingEntity.bookingId,
        movieEntity: bookingEntity.movieEntity,
        numberofTickets: bookingEntity.numberofTickets,
        perTicketPrice: bookingEntity.perTicketPrice,
        selectedClass: bookingEntity.selectedClass,
        selectedShowTime: bookingEntity.selectedShowTime,
        theaterEntity: bookingEntity.theaterEntity,
        totalPrice: bookingEntity.totalPrice);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        this.bookingId,
        this.movieEntity,
        this.numberofTickets,
        this.perTicketPrice,
        this.selectedShowTime,
        this.theaterEntity,
        this.totalPrice,
        this.selectedClass
      ];
}
