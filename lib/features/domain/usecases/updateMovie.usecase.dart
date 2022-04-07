import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';
import '../../../core/error/faliure.dart';
import '../../../core/usecase/usecase.dart';

class UpdateMovie implements UseCase<MovieEntity, MovieEntity> {
  final MovieLocatorRepository repository;

  UpdateMovie(this.repository);

  @override
  Future<Either<Failure, MovieEntity>> call(MovieEntity entity) async {
    return await repository.updateMovie(entity);
  }
}
