import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';
import '../../../core/error/faliure.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/movieList.enitity.dart';

class GetMovieList implements UseCase<MovieListEntity, NoParams> {
  final MovieLocatorRepository repository;

  GetMovieList(this.repository);

  @override
  Future<Either<Failure, MovieListEntity>> call(NoParams params) async {
    return await repository.getMovieList();
  }
}
