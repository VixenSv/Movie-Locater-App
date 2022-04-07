import 'package:movie_locator_app/features/data/models/movie.model.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/entities/movieList.enitity.dart';
import 'package:movie_locator_app/core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theaterList.entity.dart';

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
  Future<Either<Failure, BookingEntity>> addBooking(
      BookingEntity entity) async {
    try {
      return Right(await BookingEntity.toBookingEntity(
          await remoteDataSource.addBooking(entity)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> getBookingFromRef(String ref) async {
    try {
      return Right(await BookingEntity.toBookingEntity(
          await remoteDataSource.getBookingFromRef(ref)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> updateBookingData(
      BookingEntity entity) async {
    try {
      return Right(await BookingEntity.toBookingEntity(
          await remoteDataSource.updateBooking(entity)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> deleteBookingData(
      BookingEntity entity) async {
    try {
      return Right(await BookingEntity.toBookingEntity(
          await remoteDataSource.deleteBooking(entity)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TheaterEntity>> addTheater(TheaterEntity entity) async{

     try{
        return Right(await TheaterEntity.toTheaterEntity(
          await remoteDataSource.addTheater(entity)));
     }on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> addTheaterImage(XFile file) async {
    try{
      return Right(await remoteDataSource.addTheaterImage(file));
    }on ServerException {
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TheaterListEntity>> getTheaterList() async {
    try {
      return Right(await TheaterListEntity.toTheaterListEntity(
          await remoteDataSource.getTheaterList()));
    } on ServerException {
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TheaterEntity>> updateTheaterData(TheaterEntity entity) async {
    try {
      return Right(await TheaterEntity.toTheaterEntity(
          await remoteDataSource.updateTheater(entity)));
    } on ServerException {
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTheaterData(String ref) async {
    try {
      await remoteDataSource.deleteTheater(ref);
      return Right(true);
    } on ServerException {
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieEntity>> addMovie(MovieEntity movie) async {
    try {
      final movieModel = await remoteDataSource.addMovie(movie);
      return Right(await MovieEntity.toImageEntity(movieModel));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
