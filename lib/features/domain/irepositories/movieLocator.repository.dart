import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_locator_app/core/error/faliure.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/domain/entities/movieList.enitity.dart';
import 'package:movie_locator_app/features/domain/usecases/addMovie.usecase.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theaterList.entity.dart';

abstract class MovieLocatorRepository {
  Future<Either<Failure, MovieListEntity>> getMovieList();
  Future<Either<Failure, MovieEntity>> addMovie(MovieEntity movie);
  Future<Either<Failure, TheaterEntity>> addTheater(TheaterEntity entity);
  Future<Either<Failure, BookingEntity>> addBooking(BookingEntity entity);
  Future<Either<Failure, BookingEntity>> getBookingFromRef(String ref);
  Future<Either<Failure, BookingEntity>> updateBookingData(BookingEntity entity);
  Future<Either<Failure, BookingEntity>> deleteBookingData(BookingEntity entity);
  Future<Either<Failure, String>> addTheaterImage(XFile file);
  Future<Either<Failure, TheaterListEntity>> getTheaterList();
  Future<Either<Failure, TheaterEntity>> updateTheaterData(TheaterEntity entity);
  Future<Either<Failure, bool>> deleteTheaterData(String ref);
  Future<Either<Failure, MovieListEntity>> getAdminMovieList();
}
