import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/core/error/faliure.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/domain/entities/movieList.enitity.dart';

abstract class MovieLocatorRepository {
  Future<Either<Failure, MovieListEntity>> getMovieList();
  Future<Either<Failure, BookingEntity>> addBooking(BookingEntity entity);
}
