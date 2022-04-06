
import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';
import '../../../core/error/faliure.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/movie.entity.dart';

class AddMovie implements UseCase<MovieEntity, MovieEntity> {
  final MovieLocatorRepository repository;

  AddMovie(this.repository);

  @override
  Future<Either<Failure, MovieEntity>> call(MovieEntity params) async {
    return await repository.addMovie(params);
  }
}
