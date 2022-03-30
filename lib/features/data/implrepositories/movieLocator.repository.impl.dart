import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/entities/movieList.enitity.dart';
import 'package:movie_locator_app/core/error/faliure.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../domain/irepositories/movieLocator.repository.dart';
import '../datasources/remote.datasource.dart';

class MovieLocatorRepositoryImpl implements MovieLocatorRepository {
  final RemoteDataSource remoteDataSource;

  MovieLocatorRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, MovieListEntity>> getMovieList() async {
    try {
      return Right(await MovieListEntity.toMovieListEntity(
          await remoteDataSource.getMovieList()));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> addBooking(BookingEntity entity) async {
    try {
      return Right(await BookingEntity.toBookingEntity(
          await remoteDataSource.addBooking(entity)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
