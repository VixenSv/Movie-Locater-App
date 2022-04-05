
import 'package:movie_locator_app/core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/core/usecase/usecase.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';

class AddTheater implements UseCase<TheaterEntity,TheaterEntity>{
  late final MovieLocatorRepository repository;

  AddTheater(this.repository);

  @override
  Future<Either<Failure, TheaterEntity>> call(TheaterEntity entity) async{
    return await repository.addTheater(entity);
  }
  
}