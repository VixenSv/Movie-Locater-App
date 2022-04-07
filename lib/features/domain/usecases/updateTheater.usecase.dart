import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';
import '../../../core/error/faliure.dart';
import '../../../core/usecase/usecase.dart';

class UpdateTheater implements UseCase<TheaterEntity, TheaterEntity> {
  final MovieLocatorRepository repository;

  UpdateTheater(this.repository);

  @override
  Future<Either<Failure, TheaterEntity>> call(TheaterEntity entity) async {
    return await repository.updateTheaterData(entity);
  }
}