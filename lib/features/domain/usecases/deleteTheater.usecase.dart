import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';
import '../../../core/error/faliure.dart';
import '../../../core/usecase/usecase.dart';

class DeleteTheater implements UseCase<bool, String> {
  final MovieLocatorRepository repository;

  DeleteTheater(this.repository);

  @override
  Future<Either<Failure, bool>> call(String ref) async {
    return await repository.deleteTheaterData(ref);
  }
}