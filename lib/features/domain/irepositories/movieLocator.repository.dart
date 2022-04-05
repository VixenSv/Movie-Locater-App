import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/core/error/faliure.dart';
import 'package:movie_locator_app/features/domain/entities/movieList.enitity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

abstract class MovieLocatorRepository {
  Future<Either<Failure, MovieListEntity>> getMovieList();
  Future<Either<Failure, TheaterEntity>> addTheater(TheaterEntity entity);
}
