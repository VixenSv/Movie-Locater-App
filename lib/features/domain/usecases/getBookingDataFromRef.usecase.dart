import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/core/error/faliure.dart';
import 'package:movie_locator_app/core/usecase/usecase.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';

class GetBookingDataFromRef implements UseCase<BookingEntity, String> {
  final MovieLocatorRepository repository;

  GetBookingDataFromRef(this.repository);

  @override
  Future<Either<Failure, BookingEntity>> call(String refId) async {
    return await repository.getBookingFromRef(refId);
  }
}
