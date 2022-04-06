import 'package:movie_locator_app/features/data/models/movie.model.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
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
      final imageModel = await remoteDataSource.getImageList();
      return Right(await MovieListEntity.toMovieListEntity(imageModel));
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
