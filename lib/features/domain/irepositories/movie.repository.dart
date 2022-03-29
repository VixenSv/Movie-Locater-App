import 'dart:ffi';
import 'package:dartz/dartz.dart';
import '../../../core/error/movie.faliure.dart';
import '../entities/movie.entity.dart';


abstract class MovieRepository {
  Future<Either<Failure, MovieEntity>> getTotalPrice(Float price, String movieClass);
}
