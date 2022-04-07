import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/features/domain/entities/theaterList.entity.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';
import '../../../core/error/faliure.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/movieList.enitity.dart';

class GetTheaterList implements UseCase<TheaterListEntity, NoParams> {
  final MovieLocatorRepository repository;

  GetTheaterList(this.repository);

  @override
  Future<Either<Failure, TheaterListEntity>> call(NoParams params) async {
    return await repository.getTheaterList();
  }
}
