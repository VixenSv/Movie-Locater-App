import 'package:movie_locator_app/features/domain/entities/movieList.enitity.dart';
import 'package:movie_locator_app/core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

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
      final imageModel = await remoteDataSource.getImageList();
      return Right(await MovieListEntity.toMovieListEntity(imageModel));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TheaterEntity>> addTheater(TheaterEntity entity) async{
     
     try{
        return Right(await TheaterEntity.toImageEntity(
          await remoteDataSource.addTheater(entity)));
     }on ServerException {
      return Left(ServerFailure());
    }
  }
}
