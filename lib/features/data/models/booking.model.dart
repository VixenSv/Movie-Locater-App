import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import '../../domain/entities/movie.entity.dart';
import 'package:image_picker/image_picker.dart';

class BookingModel extends BookingEntity {
  BookingModel(
      {required MovieEntity movieEntity,
      required String selectedShowTime,
      required int numberofTickets,
      required TheaterEntity theaterEntity,
      required String selectedClass,
      required String bookingId})
      : super(
            movieEntity: movieEntity,
            numberofTickets: numberofTickets,
            selectedClass: selectedClass,
            selectedShowTime: selectedShowTime,
            theaterEntity: theaterEntity,
            bookingId: bookingId);

  //method to convert picked Image into a image model
  static Future<BookingModel> fromFile(
      {required String bookingId,
      required MovieEntity movieEntity,
      required String selectedShowTime,
      required int numberofTickets,
      required TheaterEntity theaterEntity,
      required String selectedClass,
      required double perTicketPrice,
      required double totalPrice}) async {
    return await BookingModel(
      bookingId: bookingId,
      movieEntity: movieEntity,
      numberofTickets: numberofTickets,
      selectedClass: selectedClass,
      selectedShowTime: selectedShowTime,
      theaterEntity: theaterEntity,
    );
  }
}
