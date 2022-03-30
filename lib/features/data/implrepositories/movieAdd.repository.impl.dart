

import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/domain/usecases/addMovie.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/getMovieList.usecase.dart';

import '../../../core/error/faliure.dart';
import '../../domain/irepositories/movieLocator.repository.dart';
import '../datasources/remote.datasource.dart';

class MovieAddRepositoryImpl implements MovieLocatorRepository {
  final RemoteDataSource remoteDataSource;


  MovieAddRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, MovieEntity>> getMovieList(movie) async {
    try {
      final imageModel = await remoteDataSource.addMovie(movie);
      return Right(await MovieListEntity.toMovieListEntity(imageModel));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
